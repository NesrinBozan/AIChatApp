//
//  TextManagementCell.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 8.12.2023.
//

import Foundation
import UIKit

class TextManagementCell: UITableViewCell {
    
    var textView: TextManagementView

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        textView = TextManagementView(vc: nil)
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(textView)
        backgroundColor = .whiteClr
        textView.backgroundColor = .lightGreenClr
        textView.isUserInteractionEnabled = true
        textView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
            make.height.equalTo(250)
        }
    }
    
    func configure(with vc: HomeVC?) {
        textView.vc = vc
        textView.onButtonTapped = { [weak vc] text, categoryTitle in
//            vc?.chatInputView.textField.text = text
//            vc?.selectedCategoryFromHome = categoryTitle
//            vc?.chatInputView.rightButton.setImage(UIImage(named: "new_btn_send"), for: .normal)
        }
    }
    }
