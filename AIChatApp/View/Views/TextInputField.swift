//
//  TextInputField.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 7.12.2023.
//

import Foundation
import NeonSDK
import UIKit

class TextInputView: UIView, UIImagePickerControllerDelegate, UIDocumentPickerDelegate, UINavigationControllerDelegate {
    let leftButton = NeonButton()
    let rightButton = NeonButton()
    let textField = NeonTextField()
    let cancelButton = NeonButton()
    let fileButton = NeonButton()
       
    var showLeftButton: Bool {
        didSet {
            leftButton.isHidden = !showLeftButton
        }
    }
    var imageView = UIImageView()

    private var isTextFieldEmpty: Bool {
           return textField.text?.isEmpty ?? true
       }
    
    init(frame: CGRect, showLeftButton: Bool? = false) {
        self.showLeftButton = showLeftButton!
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFit
        backgroundColor = .darkText
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.mainClr.cgColor
        cancelButton.setImage(UIImage(named: "cancel_btn"), for: .normal)
        leftButton.setImage(UIImage(named: "btn_add"), for: .normal)
        rightButton.setImage(UIImage(named: "btn_sendunselect"), for: .normal)
        textField.textColor = .blackClr
        let placeholderText =  "Write a message ...".localized()
        let placeholderColor = UIColor.grayClr
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: placeholderColor,
            .font: Font.custom(size: 16, fontWeight: .Medium)
        ]
        let attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
        
        textField.font = Font.custom(size: 16, fontWeight: .Medium)
        textField.attributedPlaceholder = attributedPlaceholder
        fileButton.setImage(UIImage(named: "btn_file"), for: .normal)
        fileButton.isHidden = true
        
        addSubview(leftButton)
        addSubview(rightButton)
        addSubview(textField)
        addSubview(imageView)
        addSubview(cancelButton)
        
        leftButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(50)
        }
            
        cancelButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.left.equalToSuperview().offset(60)
            make.height.width.equalTo(20)
        }
            rightButton.snp.makeConstraints { make in
                make.right.equalToSuperview().offset(-20)
                make.centerY.equalToSuperview()
                make.height.width.equalTo(50)
            }
            
            textField.snp.makeConstraints { make in
                make.left.equalToSuperview().offset(showLeftButton ? 80 : 20)
                make.right.equalTo(rightButton.snp.left).offset(-8)
                make.centerY.equalToSuperview()
            }

               addSubview(fileButton)
               fileButton.snp.makeConstraints { make in
                   make.left.equalToSuperview().offset(20)
                   make.centerY.equalToSuperview()
                   make.height.width.equalTo(50)
               }
        
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

    }

    @objc private func textFieldDidChange(_ textField: UITextField) {
        let newButtonImage: UIImage? = isTextFieldEmpty ? UIImage(named: "btn_sendunselect") : UIImage(named: "btn_send")
        rightButton.setImage(newButtonImage, for: .normal)
        
        let textHeight = textField.sizeThatFits(CGSize(width: textField.bounds.width, height: CGFloat.greatestFiniteMagnitude)).height
        let newChatInputHeight = textHeight + 20
        
        var frame = self.frame
        frame.size.height = newChatInputHeight
        self.frame = frame
        textField.snp.remakeConstraints { make in
            make.left.equalToSuperview().offset(showLeftButton ? 60 : 20)
            make.right.equalTo(rightButton.snp.left).offset(-25)
            make.centerY.equalToSuperview()
            make.height.equalTo(textHeight)
        }
          
    }

    func setImage(_ image: UIImage) {
           imageView.image = image
           leftButton.setImage(image, for: .normal)
           cancelButton.isHidden = false
//
//           let newRightButtonImage: UIImage?
//            if leftButton.image(for: .normal) != UIImage(named: "btn_add") {
//                newRightButtonImage = UIImage(named: "new_btn_send")
//            } else {
//                newRightButtonImage = UIImage(named: "btn_send")
//            }
//            rightButton.setImage(newRightButtonImage, for: .normal)
       }
    
    func setFileButton(_ fileURL: URL) {
         let fileImage = UIImage(named: "btn_file")
         fileButton.setImage(fileImage, for: .normal)
         fileButton.isHidden = false
         cancelButton.isHidden = false
         leftButton.isEnabled = false
        let newRightButtonImage: UIImage?
         if leftButton.image(for: .normal) != UIImage(named: "btn_file") {
             newRightButtonImage = UIImage(named: "btn_send")
         } else {
             newRightButtonImage = UIImage(named: "btn_sendunselect")
         }
         rightButton.setImage(newRightButtonImage, for: .normal)
     }
    
}
