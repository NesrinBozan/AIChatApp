//
//  ExploreVC.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 7.12.2023.
//

import UIKit

class ExploreVC: UIViewController {

    private var sectionCollectionView: SectionCollectionView! = nil
    let headerView = CustomHeaderView(pageTitle: "MathSolver & GPT".localized(), showLeftButton: false, showRightButton: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
      setupView()
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
       let sectionCollectionView = SectionCollectionView(didSelect: { section, indexPath in
           print("aaaaa")
           print(section.isSelected)
           print(section.selectedImage)
       })

        view.addSubview(sectionCollectionView)
        sectionCollectionView.backgroundColor = .whiteClr
        sectionCollectionView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom).offset(20)
            make.height.equalTo(110)
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



}
