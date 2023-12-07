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
    
    private var imageView = NeonImageView()
    private var titleLabel = NeonLabel()
    private var button = NeonButton()
    private var backgroundImageView = NeonImageView()

    init(image: UIImage?, title: String?, buttonText: String?, background: UIImage?) {
        super.init(frame: .zero)
        commonInit()
        configure(image: image, title: title, buttonText: buttonText, background: background)
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
        button.setTitle(buttonText, for: .normal)
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
            .font: Font.custom(size: 14, fontWeight: .Bold),
            .foregroundColor: UIColor(red: 0.099, green: 0.721, blue: 0.47, alpha: 1),
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
            make.top.equalTo(imageView)
            make.leading.equalTo(imageView.snp.trailing).offset(10)
        }
        button.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalTo(titleLabel)
        }
    }
               
}
