//
//  ExploreCustomView.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 19.12.2023.
//

import Foundation
import UIKit
import NeonSDK

class ExploreCustomView: UIView {
    private var imageView = NeonImageView()
    private var titleLabel = NeonLabel()
    private var descriptionLabel = NeonLabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        backgroundColor = .lightGreenClr
        layer.cornerRadius = 15
        
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)

        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(50)
        }

        titleLabel.textColor = .lightGrayClr
        titleLabel.font = Font.custom(size: 16, fontWeight: .SemiBold)
        addSubview(titleLabel)

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalTo(imageView.snp.trailing).offset(9)
            make.trailing.equalToSuperview().offset(-10)
        }

        descriptionLabel.textColor = UIColor(red: 0.45, green: 0.446, blue: 0.446, alpha: 1)
        descriptionLabel.font = Font.custom(size: 13, fontWeight: .SemiBold)
        descriptionLabel.numberOfLines = 0
        addSubview(descriptionLabel)

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(7)
            make.leading.equalTo(titleLabel)
            make.trailing.equalToSuperview().offset(-10)
        }
    }

    func configure(withCategory category: Category) {
        imageView.image = category.image
        titleLabel.text = category.title
        descriptionLabel.text = category.description
    }
}
