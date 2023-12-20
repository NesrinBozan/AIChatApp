//
//  EmptyChatView.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 20.12.2023.
//

import NeonSDK
import UIKit

class EmptyChatView: UIView {
    let emptyLabel = NeonLabel()
    let startChatBtn = NeonButton()
    var startChatButtonClicked: (() -> ())? = nil
    private let emptyImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    func setupView() {
        
       
        emptyLabel.text = "There is nothing here".localized()
        emptyLabel.numberOfLines = 0
        emptyLabel.font = Font.custom(size: 18, fontWeight: .Medium)
        emptyLabel.textColor = .grayClr
        isUserInteractionEnabled = true
        
        startChatBtn.setTitle("Start a chat".localized(), for: .normal)
        startChatBtn.setTitleColor(.mainClr, for: .normal)
        startChatBtn.layer.cornerRadius = 20
        startChatBtn.layer.borderColor = UIColor.borderColor.cgColor
        startChatBtn.backgroundColor = .whiteClr
        startChatBtn.layer.borderWidth = 1
        startChatBtn.addTarget(self, action: #selector(startChatButtonTapped), for: .touchUpInside)
        addSubview(emptyLabel)
        emptyLabel.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
        
        addSubview(startChatBtn)
        startChatBtn.snp.makeConstraints { make in
            make.top.equalTo(emptyLabel.snp.bottom).offset(20)
            make.centerX.equalTo(emptyLabel)
            make.height.equalTo(50)
            make.width.equalTo(165)
        }
        
        emptyImage.image = UIImage(named: "img_emptyChat")
        emptyImage.contentMode = .scaleAspectFit
        addSubview(emptyImage)
        emptyImage.snp.makeConstraints { make in
            make.bottom.equalTo(emptyLabel.snp.top).offset(-20)
            make.centerX.equalTo(emptyLabel)
            
        }

    }
    func showInView(_ parentView: UIView, startButtonCompletion : @escaping () -> ()){
        self.startChatButtonClicked = startButtonCompletion
}
    
    @objc func startChatButtonTapped() {
        startChatButtonClicked!()
    }

}
   

