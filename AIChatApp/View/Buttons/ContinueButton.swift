//
//  ContinueButton.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 19.12.2023.
//

import UIKit
import SnapKit
import NeonSDK

class ContinueButton: UIButton {

    private let defaultHeight: CGFloat = 60.00


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        layer.cornerRadius = 10.0
        backgroundColor = .mainClr
        titleLabel?.font = Font.custom(size: 20, fontWeight: .Bold)
        titleLabel?.textColor = .lightWhiteClr
        titleLabel?.textAlignment = .center
  
        snp.makeConstraints { make in
            make.height.equalTo(defaultHeight)
        }
    }
    
    func updateText(_ text: String) {
        setTitle(text, for: .normal)
    }
}
