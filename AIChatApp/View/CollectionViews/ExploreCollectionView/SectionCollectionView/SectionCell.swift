//
//  SectionCell.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 10.12.2023.
//

import Foundation
import UIKit
import NeonSDK

class SectionCell: NeonCollectionViewCell<Section> {

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGrayClr
        label.textAlignment = .center
        label.font = Font.custom(size: 12, fontWeight: .Regular)
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)

        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.width.height.equalTo(64)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-5)
        }
    }

    override func configure(with object: Section) {
        super.configure(with: object)
        
        if let isSelected = object.isSelected {
            imageView.image = isSelected ? object.selectedImage : object.unSelectedimage
            titleLabel.textColor = isSelected ? .mainClr : .lightGrayClr
        } else {
            imageView.image = object.unSelectedimage
            titleLabel.textColor = .lightGrayClr
        }
        
        titleLabel.text = object.title
    }


}

