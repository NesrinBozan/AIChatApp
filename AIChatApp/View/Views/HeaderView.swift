//
//  HeaderView.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 7.12.2023.
//

import Foundation
import UIKit
import NeonSDK

class CustomHeaderView: UIView {
    
    var showLeftButton: Bool = false
    var showRightButton: Bool = false
    
    var imageView = UIImageView()
    var logoImage = UIImageView()
    var leftBtn = NeonButton()
    var rightBtn = NeonButton()
    
    init(pageTitle: String?, showLeftButton: Bool, showRightButton: Bool) {
        super.init(frame: .zero)
        self.showLeftButton = showLeftButton
        self.showRightButton = showRightButton
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .white
        addSubview(imageView)
        imageView.image = UIImage(named: "Header")
        imageView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
        }
        logoImage.image = UIImage(named: "img_logo")
        if showLeftButton {
            addSubview(logoImage)
            logoImage.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview().offset(-18)
            }
            
            addSubview(leftBtn)
            leftBtn.snp.makeConstraints { make in
                make.centerY.equalTo(logoImage)
                make.leading.equalToSuperview().offset(24)
            }
        } else {
            addSubview(logoImage)
            logoImage.snp.makeConstraints { make in
                make.bottom.equalToSuperview().offset(-18)
                make.leading.equalToSuperview().offset(24)
            }
        }
        
        if showRightButton {
            addSubview(rightBtn)
            rightBtn.snp.makeConstraints { make in
                make.bottom.equalToSuperview().offset(-10)
                make.right.equalToSuperview().offset(-24)
            }
        }
    }

    
}
