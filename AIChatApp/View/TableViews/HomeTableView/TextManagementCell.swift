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
        textView = TextManagementView(type: Category.CategoryType.Explain, vc: nil)
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(textView)
        backgroundColor = .whiteClr
        textView.backgroundColor = .whiteClr
        textView.isUserInteractionEnabled = true
        textView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
            make.height.equalTo(250)
        }
    }
    
    func configure(with type: Category.CategoryType, vc: HomeSliderVC?) {
        textView.type = type
        textView.viewTypeSelected()
        textView.onButtonTapped = { [weak vc] text, categoryTitle in
            vc!.textInputView.textField.text = text
            vc!.textInputView.rightButton.setImage(UIImage(named: "btn_send"), for: .normal)
    }

    }

    }
