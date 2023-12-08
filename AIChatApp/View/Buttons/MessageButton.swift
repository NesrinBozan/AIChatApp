//
//  MessageButton.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 8.12.2023.
//

import UIKit
import SnapKit
import NeonSDK

class MessageButton: UIButton {

    private var defaultHeight: CGFloat = 90.0
    private let textPadding: CGFloat = 10
    
    var label = UILabel()
    var imageV = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
   
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = Font.custom(size: 18, fontWeight: .SemiBold)
        label.textColor = .white
        imageV.contentMode = .scaleAspectFit
        layer.cornerRadius = 10.0
        addSubview(label)
        addSubview(imageV)
        
        snp.makeConstraints { make in
            make.height.equalTo(defaultHeight)
        }
    }
    
    func updateText(_ text: String) {
        label.text = text
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        imageV.isHidden = true
     
    }
    
    func setImage(_ image: UIImage?, withText text: String?) {
        imageV.image = image
        
        if let text = text {
            label.text = text
        }
        
        imageV.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(imageV.snp.height)
        }
        
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(imageV.snp.right).offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
    }
    
    func setDefaultHeight(_ height: CGFloat) {
        defaultHeight = height
        snp.remakeConstraints { make in
            make.height.equalTo(defaultHeight)
        }
    }
}
