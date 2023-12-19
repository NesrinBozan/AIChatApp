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
    var type: Category.CategoryType
    var vc: UIViewController!
        
    init(type: Category.CategoryType, vc: UIViewController?) {
        self.vc = vc
        self.type = type
        super.init(frame: .zero)
        setupView()
        viewTypeSelected()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        titleLabel.textColor = .lightGrayClr
        titleLabel.font = Font.custom(size: 15, fontWeight: .Regular)
        messageButton1.backgroundColor = .lightGreenClr
        messageButton1.label.font = Font.custom(size: 16, fontWeight: .Regular)
        messageButton1.label.textColor = .lightGrayClr
        messageButton1.label.textAlignment = .center
        messageButton2.label.textAlignment = .center
        messageButton2.backgroundColor = .lightGreenClr
        messageButton2.label.textColor = .lightGrayClr
        messageButton2.label.font = Font.custom(size: 16, fontWeight: .Regular)
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
            make.height.equalTo(200)
        }
        
        messageButton1.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.85)
        }
        messageButton2.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.85)
        }
    }
    
    func viewTypeSelected(){
        switch self.type {
        case .Explain:
            titleLabel.text = "Explain".localized()
            messageButton1.updateText("Explain quantum physics".localized())
            messageButton2.updateText("What are wormholes explain like I am 5".localized())
            imageView.image = UIImage(named: "btn_explain")
            self.tag = 1
        case .Write:
            titleLabel.text = "Write & Edit".localized()
            messageButton1.updateText("Write a poem about flowers and love".localized())
            messageButton2.updateText("Write a rap song lyrics about AI".localized())
            imageView.image = UIImage(named: "btn_write")
            self.tag = 2
        case .Translate:
            titleLabel.text = "Translate".localized()
            messageButton1.updateText("How do you say “How are you” in Korea?".localized())
            messageButton2.updateText("What does ‘Vouloir c’est pouvoir...’ mean in English?".localized())
            imageView.image = UIImage(named: "img_translate")
            self.tag = 3
        case .WriteEmail:
            titleLabel.text = "Write an Email".localized()
            messageButton1.updateText("Write an email to reject client’s offer because of the hight price".localized())
            messageButton2.updateText("Write a reply for an email to accept meeting request".localized())
            imageView.image = UIImage(named: "img_writeemail")
            self.tag = 4
        case .GetRecipes:
            titleLabel.text = "Get recipes".localized()
            messageButton1.updateText("How to make potato pancakes".localized())
            messageButton2.updateText("How to make pad thai".localized())
            imageView.image = UIImage(named: "img_getrecipes")
            self.tag = 5
        case .History:
            titleLabel.text = "History".localized()
            messageButton1.updateText("Where was Santa born?".localized())
            messageButton2.updateText("How make the pyramids made?".localized())
            imageView.image = UIImage(named: "img_history")
            self.tag = 6
        case .DoMath:
            titleLabel.text = "Do Math".localized()
            messageButton1.updateText("Solve this math problem: 3*(4)+6/(2)".localized())
            messageButton2.updateText("How can we know “pi” is a transcendental number? ".localized())
            imageView.image = UIImage(named: "img_domath")
            self.tag = 7
        case .Social:
            titleLabel.text = "Social".localized()
            messageButton1.updateText("Write a funny tweet about cats".localized())
            messageButton2.updateText("Come up with a caption for my Instagram photo in Paris".localized())
            imageView.image = UIImage(named: "img_social")
            self.tag = 8
        case .Image:
             break
        case .Url:
            break
        case .File:
            break
        case .All:
            break
        case .Content:
            break
        
        case .Artist:
            break
        
        case .Business:
            break
        
        case .Personal:
            break
        
        case .Email:
            break
        
        case .Code:
            break
        
        case .Food:
            break
        
        case .Entertainment:
            break
        
        case .Name:
            break
        case .Dream:
             break
        }
    }
    
    func firstButtonTapped() {
           
        onButtonTapped?(messageButton1.label.text!, titleLabel.text!)
      
    }

     func secondButtonTapped() {
         onButtonTapped?(messageButton2.label.text!, titleLabel.text!)
    }

    }

