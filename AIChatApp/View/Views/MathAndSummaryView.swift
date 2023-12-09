//
//  MathAndSummaryView.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 7.12.2023.
//

import UIKit
import SnapKit
import NeonSDK

class MathAndSummaryView: UIView {
    private let imageView = NeonImageView()
    private let titleLabel = NeonLabel()
    private let button = NeonButton()
    private let backgroundImageView = NeonImageView()
    private let crownImage = UIImageView()

    init(image: UIImage?, title: String?, buttonText: String?, background: UIImage?, crownIsHidden: Bool) {
        super.init(frame: .zero)
        commonInit()
        configure(image: image, title: title, buttonText: buttonText, background: background)
        crownImage.isHidden = crownIsHidden
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        configure()
    }

    private func commonInit() {
        layer.cornerRadius = Constants.cornerRadius
        addSubview(backgroundImageView)
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(button)
    }
    
    private func configure(image: UIImage? = nil, title: String? = nil, buttonText: String? = nil, background: UIImage? = nil) {
        imageView.image = image
        titleLabel.text = title
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.setTitle(buttonText, for: .normal)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.image = background

        styleTitleLabel()
        styleButton()
       
        setupBackgroundImageViewConstraints()
        setupConstraints()
    }

    private func styleTitleLabel() {
        titleLabel.textColor = .whiteClr
        titleLabel.font = Font.custom(size: 20, fontWeight: .SemiBold)
    }

    private func styleButton() {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: Font.custom(size: 14, fontWeight: .Regular),
            .foregroundColor: UIColor.blackClr,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let attributeString = NSMutableAttributedString(
            string: button.title(for: .normal) ?? "",
            attributes: attributes
        )
        button.setAttributedTitle(attributeString, for: .normal)
    }

    private func setupBackgroundImageViewConstraints() {
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Constants.customTopOffset)
            make.leading.equalToSuperview().offset(Constants.customLeadingOffset)
            make.width.height.equalTo(Constants.defaultSize)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Constants.customTopOffset)
            make.leading.equalToSuperview().offset(20)
        }
        button.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalTo(titleLabel)
        }
        
        crownImage.image = UIImage(named: "img_crownHome1")?.withRenderingMode(.alwaysOriginal)
        backgroundImageView.addSubview(crownImage)
        crownImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.left.equalToSuperview().offset(12)
        }
    }
               
}
