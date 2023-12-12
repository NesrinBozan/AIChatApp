//
//  CategoryCell.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 10.12.2023.
//

import Foundation
import UIKit
import NeonSDK

class CategoryCell: NeonCollectionViewCell<Category> {
    
    private let containerView = UIView()
    private let descriptionLabel = NeonLabel()
    private let titleLabel = NeonLabel()
    private let photoView = NeonImageView()
    

    override init(frame: CGRect) {
          super.init(frame: frame)
          setupSubviews()
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }

    private func setupSubviews() {
        backgroundColor = .whiteClr
        contentView.addSubview(containerView)
        containerView.backgroundColor = .whiteClr
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.mainClr.cgColor
        containerView.layer.cornerRadius = 20
        containerView.snp.makeConstraints { make in
            make.height.equalTo(172)
            make.width.equalTo(186)
        }
              
        containerView.addSubview(photoView)
        photoView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(16)
            make.height.width.equalTo(50)
        }
        
        titleLabel.textColor = .blackClr
        titleLabel.numberOfLines = 1
        titleLabel.textAlignment = .left
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        titleLabel.font = Font.custom(size: 15, fontWeight: .SemiBold)
        containerView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(photoView.snp.bottom).offset(10)
            make.left.equalTo(photoView)
            make.right.equalToSuperview()
        }
        
        
        descriptionLabel.textColor = .exploreLightGray
        descriptionLabel.numberOfLines = 3
        descriptionLabel.textAlignment = .left
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        descriptionLabel.font = Font.custom(size: 13, fontWeight: .Medium)
        containerView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalTo(photoView)
            make.right.equalToSuperview().offset(-2)
        }

        }

    override func configure(with object: Category ) {
        super.configure(with: object)
        titleLabel.text = object.title
        descriptionLabel.text = object.description
        photoView.image = object.image
        
    }
}


