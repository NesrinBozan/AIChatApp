//
//  TextManagementView.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 7.12.2023.
//


import Foundation
import UIKit
import NeonSDK

class TextManagementView: UIView {
    
    private let imageView = UIImageView()
    private let titleLabel = NeonLabel()
    private let messageButton1: MessageButton = .init()
    private let messageButton2: MessageButton = .init()
    var onButtonTapped: ((String, String) -> Void)?
    var vc: UIViewController!
    
    init(vc: UIViewController?) {
        self.vc = vc
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        titleLabel.textColor = .darkGray
        titleLabel.font = Font.custom(size: 15, fontWeight: .Bold)
        messageButton1.backgroundColor = .lightGreenClr
        messageButton1.label.font = Font.custom(size: 16, fontWeight: .SemiBold)
        messageButton1.label.textAlignment = .center
        messageButton2.label.textAlignment = .center
        messageButton2.backgroundColor = .lightGreenClr
        messageButton2.label.font = Font.custom(size: 16, fontWeight: .SemiBold)
        messageButton1.layer.cornerRadius = 20
        messageButton2.layer.cornerRadius = 20
        messageButton1.setDefaultHeight(60)
        messageButton2.setDefaultHeight(60)
        
        
        messageButton1.addAction { [self] in
            firstButtonTapped()
        }
        messageButton2.addAction { [self] in
            secondButtonTapped()
        }
        
        let imageAndTextStackView = UIStackView(arrangedSubviews: [imageView, titleLabel])
        imageAndTextStackView.axis = .horizontal
        imageAndTextStackView.alignment = .center
        imageAndTextStackView.spacing = 1
        
        let mainStackView = UIStackView(arrangedSubviews: [ imageAndTextStackView, messageButton1, messageButton2 ])
        
        mainStackView.axis = .vertical
        mainStackView.alignment = .center
        mainStackView.spacing = 20
        
        addSubview(mainStackView)
        
        mainStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(250)
        }
        
        messageButton1.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.85)
        }
        messageButton2.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.85)
        }
    }
    
    func firstButtonTapped() {
        
        onButtonTapped?(messageButton1.label.text!, titleLabel.text!)
        
    }
    
    func secondButtonTapped() {
        onButtonTapped?(messageButton2.label.text!, titleLabel.text!)
    }
}
