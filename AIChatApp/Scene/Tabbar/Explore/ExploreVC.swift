//
//  ExploreVC.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 7.12.2023.
//

import UIKit

class ExploreVC: UIViewController {

    private var sectionCollectionView: SectionCollectionView! = nil
    private var exploreSectionCollectionView: CategoryCollectionView!
    private var filteredCategory: [Category] = []
    let headerView = CustomHeaderView(pageTitle: "MathSolver & GPT".localized(), showLeftButton: false, showRightButton: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        createAllMockData()
        setupView()
        filteredCategory = filterCategoryCollectionView(section: .All)
    }
    
    func setupView(){
        view.backgroundColor = .whiteClr
        headerView.rightBtn.setImage(UIImage(named: "btn_settings"), for: .normal)
//        headerView.rightBtn.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)

        
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.height.equalTo(60)
        }
        
        exploreSectionCollectionView = CategoryCollectionView(category: filteredCategory)
        exploreSectionCollectionView.didSelectCategory = { [weak self] selectedCategory in
            guard let self else { return }
            let exploreDetailVC = GenerateVC(category: selectedCategory)
            self.present(destinationVC: exploreDetailVC, slideDirection: .right)
        }
        exploreSectionCollectionView.backgroundColor = .whiteClr
        
       let sectionCollectionView = SectionCollectionView(didSelect: { section, indexPath in
           print("aaaaa")
           print(section.isSelected)
           print(section.selectedImage)
           for type in Category.CategoryType.allCases{
               if type.rawValue == section.title{
                   self.filteredCategory = self.filterCategoryCollectionView(section: type )
               }
           }
       
           self.exploreSectionCollectionView.objects = self.filteredCategory
       })

        view.addSubview(sectionCollectionView)
        sectionCollectionView.backgroundColor = .whiteClr
        sectionCollectionView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom).offset(20)
            make.height.equalTo(110)
        }
        
        view.addSubview(exploreSectionCollectionView)
        exploreSectionCollectionView.backgroundColor = .white
        exploreSectionCollectionView.snp.makeConstraints { make in
            make.top.equalTo(sectionCollectionView.snp.bottom).offset(20)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-120)
                }
        
    }
    func setupData() {
        
        let allSection = Section(title: "All",isSelected: false,unSelectedimage: UIImage(named: "icon_all_unSelected")!, selectedImage: UIImage(named: "icon_all_selected")!)
        let nameSection = Section(title: "Name", isSelected: false,unSelectedimage: UIImage(named: "icon_name_unSelected")!, selectedImage: UIImage(named: "icon_name_selected")!)
        let dreamSection = Section(title: "Dream",isSelected: false, unSelectedimage: UIImage(named: "icon_dream_unSelected")!, selectedImage: UIImage(named: "icon_dream_selected")!)
        let businessSection = Section(title: "Business", isSelected: false,unSelectedimage: UIImage(named: "icon_business_unSelected")!, selectedImage: UIImage(named: "icon_business_selected")!)
        let contentSection = Section(title: "Content", isSelected: false,unSelectedimage: UIImage(named: "icon_content_unSelected")!, selectedImage: UIImage(named: "icon_content_selected")!)
        let artistSection = Section(title: "Artist", isSelected: false,unSelectedimage: UIImage(named: "icon_artist_unSelected")!, selectedImage: UIImage(named: "icon_artist_selected")!)
        let emailSection = Section(title: "Email",isSelected: false, unSelectedimage: UIImage(named: "icon_email_unSelected")!, selectedImage: UIImage(named: "icon_email_selected")!)
        let personalSection = Section(title: "Personal", isSelected: false,unSelectedimage: UIImage(named: "icon_personal_unSelected")!, selectedImage: UIImage(named: "icon_personal_selected")!)
        let socialSection = Section(title: "Social",isSelected: false, unSelectedimage: UIImage(named: "icon_social_unSelected")!, selectedImage: UIImage(named: "icon_social_selected")!)
        let foodSection = Section(title: "Food", isSelected: false,unSelectedimage: UIImage(named: "icon_food_unSelected")!, selectedImage: UIImage(named: "icon_food_selected")!)
        let entertainmentSection = Section(title: "Entertaintment", isSelected: false,unSelectedimage: UIImage(named: "icon_entertainment_unSelected")!, selectedImage: UIImage(named: "icon_entertaintment_selected")!)
        
         Globals.arrSection = [allSection, nameSection, dreamSection, businessSection, contentSection, artistSection, emailSection, personalSection, socialSection, foodSection, entertainmentSection]

    
     }

    public func createAllMockData() {
        let contentItems = [
            Category(title: "Write a Paragraph".localized(), description: "Generate well-written paragraphs on any given subject".localized(), image: UIImage(named: "icon_all_selected")!, type: .Content,prompt: "I want you to be a paragraph writer. Your objective is to skillfully craft concise and coherent paragraphs that support a central idea, provide relevant evidence, and effectively convey information to the reader. Each paragraph should exhibit logical progression, offer strong supporting details, and employ cohesive language to ensure clarity and coherence within the text.",  questions: [
                Question(text: "What is the main subject or topic that the paragraph focuses on?".localized()),
                Question(text: "What style or tone would you like the paragraph to have?".localized())
            ]),
            Category(title: "Summarize Website".localized(), description: "Extract key points from long text".localized(), image: UIImage(named: "icon_all_selected")!, type: .Content, prompt: "I want you to be a summary writer specialized on websites. Your objective is to thoroughly analyze the given website, construct a concise and captivating summary, and compose a condensed version that effectively conveys the main points and engages the reader. Your summary should showcase a comprehensive understanding, present well-supported key ideas, and employ engaging language to maintain the reader's interest throughout the website.",questions: [
                Question(text: "Which website would like to summarize?".localized()),
                Question(text: "What is the desired length of the summary (in sentences or words)?".localized())
            ]),
            Category(title: "Improve".localized(), description: "Rewrite content to make it better and more readable".localized(), image: UIImage(named: "icon_all_selected")!, type: .Content, prompt: "I want you to be a content improver. Your objective is to extensively evaluate existing content, and enhance the overall quality of the content to effectively inform and engage the reader. Your revisions should demonstrate a comprehensive understanding of the topic, strengthen the arguments with solid evidence, and employ captivating language to sustain the reader's interest throughout the text.",questions: [
                Question(text: "Can you write down the content that you want to improve?".localized()),
                Question(text: "What would you like to improve on your content?".localized())
            ]),
            Category(title: "Translate".localized(), description: "Translate text from one language into another".localized(), image: UIImage(named: "icon_all_selected")!, type: .Content, prompt: "I want you to be a translator. Your objective is to thoroughly research a given text, accurately interpret its meaning, and compose a translated version that effectively conveys the message and captivates the reader. Your translation should showcase a deep understanding of the subject matter, present well-crafted expressions, and employ engaging language to maintain the reader's interest throughout the piece.",questions: [
                Question(text: "Target language?".localized()),
                Question(text: "Preferred tone/style for the translation?".localized())
            ]),
        ]
        
        let artistItems = [
            Category(title: "Lyrics".localized(), description: "Generate lyrics of a song for any music genre".localized(), image: UIImage(named: "icon_all_selected")!, type: .Artist, prompt: "I want you to be an song writer. Your objective is to meticulously analyze a given set of lyrics, formulate a coherent and thought-provoking interpretation, and compose an insightful essay that adeptly conveys the essence and significance of the song. Your essay should demonstrate a comprehensive understanding of the lyrics, present compelling insights, and employ evocative language to engross the reader from beginning to end.",questions: [
                Question(text: "What is the song about?".localized()),
                Question(text: "Which genre does the song have?".localized())
            ]),
            Category(title: "Poem".localized(), description: "Generate poem in different style".localized(), image: UIImage(named: "icon_all_selected")!, type: .Artist, prompt: "I want you to act as a poet. You will create poems that evoke emotions and have the power to stir people’s soul. Write on any topic or theme but make sure your words convey the feeling you are trying to express in beautiful yet meaningful ways. You can also come up with short verses that are still powerful enough to leave an imprint in readers’ minds.",questions: [
                Question(text: "What is the central theme or emotion conveyed in the poem?".localized()),
                Question(text: "Describe the imagery used in the poem.".localized())
            ]),
            Category(title: "Story".localized(), description: "Generate a story from a given subject".localized(), image: UIImage(named: "icon_all_selected")!, type: .Artist, prompt: "“I want you to act as a storyteller. You will come up with entertaining stories that are engaging, imaginative and captivating for the audience. It can be fairy tales, educational stories or any other type of stories which has the potential to capture people’s attention and imagination. Depending on the target audience, you may choose specific themes or topics for your storytelling session e.g., if it’s children then you can talk about animals; If it’s adults then history-based tales might engage them better etc.",questions: [
                Question(text: "What is the central theme or plot of the story?".localized()),
                Question(text: "Who are the main characters in the story?".localized())
            ]),
            Category(title: "Short Movie".localized(), description: "Generate script for a movie".localized(), image: UIImage(named: "icon_all_selected")!, type: .Artist, prompt: "I want you to be a short movie writer. Your objective is to thoroughly conceptualize a given plot, develop a concise and captivating storyline, and create a compelling short movie that effectively entertains and engages the audience. Your movie should demonstrate creativity, deliver a well-structured narrative, and employ visually stimulating elements to sustain the viewer's interest throughout the film.",questions: [
                Question(text: "What is the movie about?".localized()),
                Question(text: "What is the type of the movie?".localized())
            ]),
        ]
        
        let businessItems = [
            Category(title: "Company Bio".localized(), description: "Tell your company’s story in a nutshell".localized(), image: UIImage(named: "icon_all_selected")!, type: .Business, prompt: "I want you to be a company bio writer. Your objective is to thoroughly understand the specs of a given company, construct a clear and compelling bio, and compose a persuasive bio that effectively informs people.",questions: [
                Question(text: "What is the name of the company?".localized()),
                Question(text: "What does this company do?".localized())
            ]),
            Category(title: "Name Generator".localized(), description: "Come up with a great name for your brand or product".localized(), image: UIImage(named: "icon_all_selected")!, type: .Business, prompt: "I want you to be a name writer. Your objective is to thoroughly explore a given topic related to names. Your results should be a list of the suggested names." ,questions: [
                Question(text: "What are you looking name for?".localized()),
                Question(text: "What type of names are you looking for?".localized())
            ]),
            Category(title: "Slogan".localized(), description: "Create a catchy slogan for your business".localized(), image: UIImage(named: "icon_all_selected")!, type: .Business,prompt: "I want you to be a slogan writer. Your objective is to thoroughly understand a given brand or product, create concise and memorable phrases that convey its unique value proposition, and craft compelling slogans that resonate with the target audience. Your slogans should showcase creativity, evoke emotion, and effectively communicate the essence of the brand or product in a succinct and impactful manner",questions: [
                Question(text: "What kind of business are you making?".localized()),
                Question(text: "What is the main message you want your slogan to deliver?".localized())
            ]),
            Category(title: "Advertisements".localized(), description: "Promote a product, service, brand or event".localized(), image: UIImage(named: "icon_all_selected")!, type: .Business, prompt: "I want you to act as an advertiser. You will create a campaign to promote a product or service of your choice. You will choose a target audience, develop key messages and slogans, select the media channels for promotion, and decide on any additional activities needed to reach your goals.",questions: [
                Question(text: "What is the key message or main selling point of the advertisement?".localized()),
                Question(text: "Who is the target audience for this advertisement?".localized())
            ]),
            Category(title: "Job Post".localized(), description: "Write a job description that attracts ideal candidates".localized(), image: UIImage(named: "icon_all_selected")!, type: .Business,prompt: "I want you to be a job post writer. Your objective is to thoroughly understand the requirements of a given position, construct a clear and compelling job description, and compose a persuasive job post that effectively informs and attracts potential candidates. Your job post should showcase a thorough understanding of the role, present enticing details, and employ engaging language to captivate and maintain the interest of job seekers throughout the post.",questions: [
                Question(text: "What is the job title or position you are looking to fill?".localized()),
                Question(text: "What are the key responsibilities or tasks associated with this job?".localized())
            ]),
        ]
        let personelItems = [
            Category(title: "Birthday".localized(), description: "Send sincere birthday wish for your loved ones".localized(), image: UIImage(named: "icon_all_selected")!, type: .Personal, prompt: "I want you to be a birthday message writer. Your objective is to thoroughly understand the recipient's personality and relationship, construct a clear and heartfelt message, and compose a persuasive birthday message that effectively conveys warm wishes and captivates the reader. Your birthday message should showcase thoughtfulness, present well-crafted sentiments, and employ engaging language to maintain the reader's interest throughout the message.",questions: [
                Question(text: "Who is the birthday message for?".localized()),
                Question(text: "What is the relationship between the sender and the recipient?".localized())
            ]),
            Category(title: "Apology".localized(), description: "Apologyize for the mistake you have done".localized(), image: UIImage(named: "icon_all_selected")!, type: .Personal, prompt: "I want you to be an apology writer. Your objective is to thoroughly understand the situation and reasons behind the apology, construct a clear and sincere statement of remorse, and compose a persuasive apology that effectively conveys empathy and captivates the recipient. Your apology should showcase genuine reflection, present well-expressed apologies, and employ engaging language to maintain the recipient's interest and foster forgiveness throughout the message.",questions: [
                Question(text: "What is the reason for the apology?".localized()),
                Question(text: "Who is the recipient of the apology message?".localized())
            ]),
            Category(title: "Invitation".localized(), description: "Write the perfect event invitation".localized(), image: UIImage(named: "icon_all_selected")!, type: .Personal, prompt: "I want you to be an invitation writer. Your objective is to thoroughly understand the purpose and details of the event, construct a clear and captivating invitation message, and compose a persuasive invitation that effectively conveys the importance and entices the recipient to attend. Your invitation should showcase a thoughtful approach, present enticing event details, and employ engaging language to maintain the recipient's interest and generate excitement throughout the message",questions: [
                Question(text: "What is the event or occasion for the invitation?".localized()),
                Question(text: "When and where is the event taking place?".localized())
            ]),
            Category(title: "Pick Up Line".localized(), description: "Generate a conversation opener for online dating".localized(), image: UIImage(named: "icon_all_selected")!, type: .Personal, prompt: "I want you to be a pick-up line writer. Your objective is to thoroughly understand the context and audience, construct a clear and captivating opening line, and compose a persuasive pick-up line that effectively grabs the recipient's attention and sparks interest. Your pick-up line should showcase creativity, present a charming approach, and employ engaging language to maintain the recipient's interest and create a positive impression throughout the interaction.",questions: [
                Question(text: "What's your top conversation starter when reaching out to someone you're interested in?".localized()),
                Question(text: "Funny or sweet pick-up lines: which do you prefer for catching their attention?".localized())
            ]),
            Category(title: "Speech".localized(), description: "Convey a thought or message effectively".localized(), image: UIImage(named: "icon_all_selected")!, type: .Personal, prompt: "I want you to be a speech writer. Your objective is to thoroughly research a given topic, and compose a persuasive speech that effectively informs and captivates the audience. Your speech should showcase a deep understanding of the subject matter, present well-supported arguments, and employ engaging language to maintain the audience's interest and evoke a desired response throughout the delivery.",questions: [
                Question(text: "What is the main topic or subject of the speech?".localized()),
                Question(text: "Who is the intended audience for the speech?".localized())
            ]),
        
        ]
        
        let emailItems = [
            Category(title: "Email".localized(), description: "Write a well-drafted email with a neat structure".localized(), image: UIImage(named: "icon_all_selected")!, type: .Email, prompt: "I want you to be an email writer. Your objective is to thoroughly understand the purpose and recipient of the email, construct a clear and compelling message, and compose a persuasive email that effectively conveys information and engages the reader. Your email should showcase a depth of knowledge, present well-supported points, and employ engaging language to maintain the recipient's interest and elicit the desired response throughout the message.",questions: [
                Question(text: "What is the purpose or reason for writing this e-mail?".localized()),
                Question(text: "Who is the intended recipient of the e-mail?".localized())
            ]),
            Category(title: "Write Email Subject".localized(), description: "Create the best email subject lines that get people to open your emails".localized(), image: UIImage(named: "icon_all_selected")!, type: .Email,prompt: "I want you to be an email writer. Your objective is to thoroughly understand the purpose and target audience of the email, construct a concise and captivating subject line, and compose an email that effectively communicates the main message and generates interest. Your email subject should showcase clarity, relevance, and intrigue to compel the recipient to open and engage with the email content. It should entice curiosity and convey the value of the message within the limited space of the subject line.",questions: [
                Question(text: "What is the purpose or main topic of the email?".localized()),
                Question(text: "Is there any specific urgency or timeline associated with the email?".localized())
            ]),
            Category(title: "Improve Email".localized(), description: "Make your emails better and more readable".localized(), image: UIImage(named: "icon_all_selected")!, type: .Email, prompt: "I want you to be an improve email writer. Your objective is to thoroughly analyze the art of email communication, research effective email writing strategies, and compose persuasive emails that inform and engage the recipient. Your emails should showcase a depth of knowledge about effective communication, present well-supported arguments or requests, and employ engaging language to maintain the recipient's interest throughout the message.",questions: [
                Question(text: "Which e-mail you would like to imrpove?".localized()),
                Question(text: "What areas of your e-mails do you think need improvement?".localized())
            ]),
        
        ]
        
        let socialItems = [
            Category(title: "Tweet".localized(), description: "Craft Tweets that will grab your readers attention".localized(), image: UIImage(named: "icon_all_selected")!, type: .Social, prompt: "I want you to be a tweet writer. Your objective is to succinctly summarize a given topic, craft a concise and attention-grabbing statement, and compose a persuasive tweet that effectively informs and engages the audience. Your tweet should demonstrate a depth of understanding, present compelling ideas, and utilize captivating language to captivate and retain the reader's interest within the limited character count which is 280.",questions: [
                Question(text: "What is the main idea of your tweet?".localized()),
                Question(text: "How do you want your tweet to make your audience feel?".localized())
            ]),
            Category(title: "Turn Into Tweet".localized(), description: "Fit long text into 280 characters".localized(), image: UIImage(named: "icon_all_selected")!, type: .Social, prompt: "I want you to be a turning text into tweet writer. Your objective is to thoroughly analyze the art of condensing information into concise and captivating tweets, research effective strategies for crafting engaging tweets, and compose persuasive tweets that inform and captivate the audience. Your tweets should showcase a depth of knowledge about the topic, present well-supported arguments or ideas, and employ engaging language to maintain the audience's interest within the limited character count.",questions: [
                Question(text: "What is the text you would like to turn it into a tweet?".localized()),
                Question(text: "What kind of tweet do you want to generate?".localized())
            ]),
            Category(title: "LinkedIn Post".localized(), description: "Create an attention-grabbing post on LinkedIn".localized(), image: UIImage(named: "icon_all_selected")!, type: .Social, prompt: "I want you to be a LinkedIn post writer. Your objective is to extensively research a given topic, formulate a content, and compose a persuasive post that effectively educates and engages the readers. Your post should demonstrate a comprehensive understanding, present well-substantiated points, and utilize compelling language to sustain the readers' interest throughout the content.",questions: [
                Question(text: "What is the main message or purpose of your LinkedIn post?".localized()),
                Question(text: "Who is your target audience for this post?".localized())
            ]),
            Category(title: "Instagram Caption".localized(), description: "Writing good Instagram captions to help your audiences find and understand you easily".localized(), image: UIImage(named: "icon_all_selected")!, type: .Social, prompt: "I want you to be an Instagram caption writer. Your objective is to deeply explore a given subject, create a concise and captivating thesis statement, and craft a persuasive caption that effectively informs and captivates the audience. Your suggested captions should be as a list, and should demonstrate a comprehensive understanding, present well-supported points, and use engaging language to sustain the viewers' interest.",questions: [
                Question(text: "What is the main message of your Instagram caption?".localized()),
                Question(text: "How do you want your caption to make people feel?".localized())
            ]),
            Category(title: "TikTok Caption".localized(), description: "Create view-generating captions for viral TikTok".localized(), image: UIImage(named: "icon_all_selected")!, type: .Social,prompt: "I want you to be a TikTok caption writer. Your objective is to conduct extensive research on a given topic, and compose a persuasive caption that effectively informs and captivates the viewers. Your captions should be as a list, and should demonstrate a comprehensive understanding, present well-supported arguments, and use engaging language to maintain the viewers' interest throughout the video.",questions: [
                Question(text: "What is the main idea of your TikTok caption?".localized()),
                Question(text: "What tone do you want to convey in your caption?".localized())
            ]),
            Category(title: "Viral Video Ideas".localized(), description: "Generate list of ideas that can go viral".localized(), image: UIImage(named: "icon_all_selected")!, type: .Social, prompt: "I want you to be a viral video ideas writer. Your objective is to thoroughly research a given topic, develop creative and attention-grabbing concepts, and compose persuasive video ideas that effectively inform and captivate the viewers. Your ideas should demonstrate a depth of knowledge, present well-supported arguments or storytelling elements, and employ engaging language to maintain the audience's interest throughout the video. Craft video ideas that have the potential to go viral, spark discussions, and leave a lasting impression on the viewers.",questions: [
                Question(text: "What kind of videos do you want to make that can potentially become viral?".localized()),
                Question(text: "Is there a specific theme or concept you want your viral video to be based on?".localized())
            ]),
        
        ]
        
        let codeItems = [
            Category(title: "Write Code".localized(), description: "Write simple webpages and applications in various programming languages".localized(), image: UIImage(named: "icon_all_selected")!, type: .Code, prompt: "I want you to be a code writer. Your objective is to thoroughly research a given problem, construct a clear and efficient algorithm, and write code that effectively solves the problem and captivates the reader. Your code should showcase a depth of knowledge, utilize well-supported programming techniques, and employ clear and concise language to maintain the reader's interest throughout the piece.",questions: [
                Question(text: "Which programming language are you using?".localized()),
                Question(text: "What is the main objective of your code?".localized())
            ]),
            Category(title: "Explain Code".localized(), description: "Explain a complicated piece of code".localized(), image: UIImage(named: "icon_all_selected")!, type: .Code,prompt: "I want you to be a code explainer. Your objective is to thoroughly research a specific programming concept, construct a clear and compelling explanation, and compose a persuasive description that effectively informs and engages the reader.",questions: [
                Question(text: "What is the code to be explained?".localized()),
                Question(text: "How long should the description be?".localized())
            ]),
        ]
        
        let foodItems = [
            Category(title: "Recipe".localized(), description: "Get recipes for any food dishes".localized(), image: UIImage(named: "icon_all_selected")!, type: .Food, prompt: "I want you to be a recipe writer. Your job is to create recipes. Your recipes should showcase a depth of knowledge about ingredients, techniques, and cultural influences, present well-supported arguments for the recipe's uniqueness and appeal, and employ engaging language to maintain the reader's interest throughout the piece. Craft a descriptive and enticing narrative that not only provides step-by-step instructions but also delves into the history, cultural significance, and sensory experience associated with the recipe.",questions: [
                Question(text: "What do you want to prepare?".localized()),
                Question(text: "What are the ingredients you want to add to the recipe?".localized())
            ]),
            Category(title: "Diet Plan".localized(), description: "Generate customized meal plan based on preferences".localized(), image: UIImage(named: "icon_all_selected")!, type: .Food, prompt: "I want you to be a diet planner. Your objective is to thoroughly research a given topic related to nutrition and dietary planning. Your diet plans should showcase a depth of knowledge about nutritional principles, dietary guidelines, and the impact of various foods on health and well-being. Present well-supported arguments for the benefits of specific dietary approaches or meal plans, and employ engaging language to maintain the reader's interest throughout the piece. Your essay should not only provide practical advice and recommendations but also address common misconceptions and offer evidence-based strategies for successful diet planning.",questions: [
                Question(text: "What is your main motivation for starting a diet plan?".localized()),
                Question(text: "What are your preferences about your diet plan?".localized())
            ]),
        ]
        
        let entertainmentItems = [
            Category(title: "Movies to Emoji".localized(), description: "Turn movie titles into emojis".localized(), image: UIImage(named: "icon_all_selected")!, type: .Entertainment, prompt: "Be a movie-to-emoji translator. Turn movie titles into emojies. List your suggested results.",questions: [
                Question(text: "What's the movie's name?".localized()),
                Question(text: "Can you give a short description of the movie's plot?".localized())
            ]),
            Category(title: "Tell Joke".localized(), description: "Write a funny joke to tell your friends".localized(), image: UIImage(named: "icon_all_selected")!, type: .Entertainment,prompt: "I want you to be a joke writer. Your objective is to thoroughly research a given topic, construct a well-crafted and humorous jokes, and compose a light-hearted result that effectively entertains and captivates the reader. Your results should showcase a clever understanding of the subject matter, present well-supported comedic arguments, and employ engaging language to maintain the reader's laughter throughout the piece.",questions: [
                Question(text: "What type of joke would you like to hear? (e.g., puns, one-liners, knock-knock jokes)".localized()),
                Question(text: "Do you prefer clean or slightly edgy humor?".localized())
            ]),
            Category(title: "Complete Sentence".localized(), description: "Get your sentences completed randomly".localized(), image: UIImage(named: "icon_all_selected")!, type: .Entertainment, prompt: "I want you to be an sentence complement. Your objective is to meticulously examine a given set of incomplete sentences, construct coherent and captivating conclusions, and fills in the gaps and engages the reader. Your results should showcase a depth of knowledge, present well-supported interpretations, and employ engaging language to maintain the reader's interest throughout the piece.",questions: [
                Question(text: "What is the desired length of the complete sentence?".localized()),
                Question(text: "Should the sentence be formal or informal in tone?".localized())
            ]),
            Category(title: "Create Conversation".localized(), description: "Generate a conversation between your favorite two characters".localized(), image: UIImage(named: "icon_all_selected")!, type: .Entertainment, prompt: "I want you to be a conversation creator. Your objective is to thoroughly explore the art of creating meaningful and engaging conversations, delve into the principles of effective communication, and compose a persuasive results that skillfully demonstrates the techniques for initiating, sustaining, and concluding impactful dialogues. Your results should showcase a depth of knowledge, present well-supported arguments, and employ engaging language to maintain the reader's interest throughout the piece.",questions: [
                Question(text: "What is the main goal of the conversation?".localized()),
                Question(text: "Who will be involved in the conversation?".localized())
            ]),
            Category(title: "Made Up Words".localized(), description: "Create a defininition for a made up word".localized(), image: UIImage(named: "icon_all_selected")!, type: .Entertainment, prompt: "I want you to be an made-up words creator. Generate made up words according to the topic. Şist uour suggested results.",questions: [
                Question(text: "What is the topic or area you would like the made-up word to represent? (Example answer: Animals)".localized()),
                Question(text: "Is there a specific emotion or vibe you want the made-up word to convey? (Example answer: Playfulness)".localized())
            ]),
        
        ]
        
        Globals.arrCategory.append(contentsOf: contentItems)
        Globals.arrCategory.append(contentsOf: artistItems)
        Globals.arrCategory.append(contentsOf: businessItems)
        Globals.arrCategory.append(contentsOf: personelItems)
        Globals.arrCategory.append(contentsOf: emailItems)
        Globals.arrCategory.append(contentsOf: socialItems)
        Globals.arrCategory.append(contentsOf: codeItems)
        Globals.arrCategory.append(contentsOf: foodItems)
        Globals.arrCategory.append(contentsOf: entertainmentItems)
    }


}

extension ExploreVC {
    func filterCategoryCollectionView(section: Category.CategoryType) -> [Category]{
        var filteredCategory: [Category] = []
        filteredCategory = section == .All ? Globals.arrCategory :  Globals.arrCategory.filter({$0.type == section})
        return filteredCategory
    }
}
