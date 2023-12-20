//
//  SettingsCell.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 20.12.2023.
//

import UIKit
import SnapKit
import NeonSDK

class SettingsCell: NeonTableViewCell<SettingItem> {
    
        let leftIconImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
    
        let rightIconImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
    
        let titleLabel: UILabel = {
            let label = UILabel()
            label.textColor = .blackClr
            label.font = Font.custom(size: 16, fontWeight: .Medium)
            return label
        }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
          contentView.addSubview(leftIconImageView)
          contentView.addSubview(rightIconImageView)
          contentView.addSubview(titleLabel)
  
          leftIconImageView.snp.makeConstraints { make in
              make.width.height.equalTo(50)
              make.leading.equalTo(contentView).offset(10)
              make.centerY.equalTo(contentView)
          }
  
          rightIconImageView.snp.makeConstraints { make in
              make.width.height.equalTo(50)
              make.trailing.equalTo(contentView).offset(-10)
              make.centerY.equalTo(contentView)
          }
  
          titleLabel.snp.makeConstraints { make in
              make.leading.equalTo(leftIconImageView.snp.trailing)
              make.centerY.equalTo(contentView)
          }
    }
    
    override func configure(with object: SettingItem) {
        super.configure(with: object)
        leftIconImageView.image = UIImage(named: object.iconName)
        titleLabel.text = object.title
        rightIconImageView.image = UIImage(named: object.rightIcon)
    }
}
