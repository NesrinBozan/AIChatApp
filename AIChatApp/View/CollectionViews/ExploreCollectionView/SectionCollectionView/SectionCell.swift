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
        label.font = Font.custom(size: 10, fontWeight: .Regular)
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
            make.top.equalToSuperview().offset(5)
            make.width.height.equalTo(60)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-5)
        }
    }

    override func configure(with object: Section) {
        super.configure(with: object)
        imageView.image = object.isSelected ?? false ? object.selectedImage : object.unSelectedimage
        titleLabel.text = object.title
        titleLabel.textColor = object.isSelected ?? false ? .mainClr : .lightGrayClr
    }
}

