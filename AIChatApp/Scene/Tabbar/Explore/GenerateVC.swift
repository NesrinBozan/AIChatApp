//
//  GenerateVC.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 12.12.2023.
//

import Foundation
import UIKit
import NeonSDK

public class GenerateVC: UIViewController, UITextViewDelegate{

    private var customView = ExploreCustomView()
    var category: Category
    private var headerView =  CustomHeaderView(pageTitle: "CHATAPP", showLeftButton: true, showRightButton: false)
    lazy var generateButton = ContinueButton()
    private var answerTextView1: NeonTextView!
    private var answerTextView2: NeonTextView!

    
    init(category: Category) {
        self.category = category
        super.init(nibName: nil, bundle: nil)
        DispatchQueue.main.async { [self] in
            setupView()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public override func viewDidLoad() {
        setupView()
    }
    
    
    func setupView(){
        view.backgroundColor = .whiteClr
        headerView.leftBtn.setImage(UIImage(named: "btn_back"), for: .normal)
        headerView.leftBtn.addAction {
            self.dismiss(animated: true)
        }
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.height.equalTo(60)
        }
        customView.configure(withCategory: category)
        view.addSubview(customView)
        customView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(94)
        }
        
        let questionLabel1 = createLabel(withText: category.questions.count > 0 ? category.questions[0].text : "")
        view.addSubview(questionLabel1)
        questionLabel1.snp.makeConstraints { make in
            make.top.equalTo(customView.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(24)
        }
         answerTextView1 = createAnswerTextView()
        view.addSubview(answerTextView1)
        answerTextView1.snp.makeConstraints { make in
            make.top.equalTo(questionLabel1.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(90)
        }
        let questionLabel2 = createLabel(withText: category.questions.count > 1 ? category.questions[1].text : "")
        view.addSubview(questionLabel2)
        questionLabel2.snp.makeConstraints { make in
            make.top.equalTo(answerTextView1.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
         answerTextView2 = createAnswerTextView()
        view.addSubview(answerTextView2)
        answerTextView2.snp.makeConstraints { make in
            make.top.equalTo(questionLabel2.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(120)
        }
    
        generateButton.updateText("Generate")
        generateButton.backgroundColor = .ultraLightGrayClr
        generateButton.setTitleColor(.borderColor, for: .normal)
        generateButton.addTarget(self, action: #selector(generateButtonTapped), for: .touchUpInside)
        generateButton.isEnabled = false
        
        view.addSubview(generateButton)
        generateButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.6)
            make.bottom.equalToSuperview().offset(-50)
        }
        
    }
    
    
    @objc func generateButtonTapped() {
        
    }
    
    public func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.layer.borderColor = UIColor.borderColor.cgColor
        } else {
            textView.layer.borderColor = UIColor.mainClr.cgColor
        }
        
        if answerTextView1.text.isEmpty || answerTextView2.text.isEmpty {
            generateButton.backgroundColor = UIColor.ultraLightGrayClr
            generateButton.setTitleColor(.borderColor, for: .normal)
            generateButton.isEnabled = false
        } else {
            generateButton.backgroundColor = UIColor.mainClr
            generateButton.setTitleColor(.lightWhiteClr, for: .normal)
            generateButton.isEnabled = true
        }
        
    }
    
    private func createLabel(withText text: String) -> NeonLabel {
        let label = NeonLabel()
        label.text = text
        label.font = Font.custom(size: 16, fontWeight: .SemiBold)
        label.textColor = .lightGrayClr
        label.numberOfLines = 0
        return label
    }
    
    private func createAnswerTextView() -> NeonTextView {
        let textView = NeonTextView()
        textView.layer.cornerRadius = 15
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.borderColor.cgColor
        textView.textColor = .darkBlackClr
        textView.font = Font.custom(size: 15, fontWeight: .Regular)
        textView.backgroundColor = .whiteClr
        textView.delegate = self
        textView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return textView
    }
}
