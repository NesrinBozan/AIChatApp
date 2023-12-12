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
    
    var pageTitle: String?
    var showLeftButton: Bool = false
    var showRightButton: Bool = false
    
    var imageView = UIImageView()
    var titleLbl = NeonLabel()
    var leftBtn = NeonButton()
    var rightBtn = NeonButton()
    
    init(pageTitle: String?, showLeftButton: Bool, showRightButton: Bool) {
        super.init(frame: .zero)
        self.pageTitle = pageTitle
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
        titleLbl.textColor = .mainClr
        titleLbl.font = Font.custom(size: 24, fontWeight: .Bold)
        
        addSubview(imageView)
        imageView.image = UIImage(named: "Header")
        imageView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
        }
        
        titleLbl.text = pageTitle
        titleLbl.textAlignment = .center
        imageView.addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-14)
            make.centerX.equalToSuperview()
        }
        
        if showLeftButton {
            addSubview(leftBtn)
            leftBtn.snp.makeConstraints { make in
                make.centerY.equalTo(titleLbl)
                make.leading.equalToSuperview().offset(10)
            }
        }
        
        if showRightButton {
            addSubview(rightBtn)
            rightBtn.snp.makeConstraints { make in
                make.centerY.equalTo(titleLbl)
                make.trailing.equalToSuperview().offset(-10)
            }
        }
    }
    
}
