//
//  File.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 25.12.2023.
//

import NeonSDK
import UIKit

class URLInputView: UIView {

    private var urlTextField: NeonTextField?
    private var addButton: NeonButton?
    private var cancelButton: UIButton?
    private var urlLine: UIImageView?
    var onAddButtonTapped: ((String) -> Void)?
    var onCancelButtonTapped: (() -> Void)?

    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundColor = .whiteClr
        layer.cornerRadius = 10

        let titleLabel = NeonLabel(frame: .zero)
        titleLabel.text = "Paste or type link".localized()
        titleLabel.textColor = .blackClr
        titleLabel.textAlignment = .center
        titleLabel.font = Font.custom(size: 20, fontWeight: .SemiBold)

        urlTextField = NeonTextField(frame: .zero)
        urlTextField?.borderStyle = .roundedRect
        urlTextField?.backgroundColor = .whiteClr
        urlTextField?.textColor = .white
        urlLine = UIImageView(image: UIImage(named: "img_line"))

        let placeholderText = "https://".localized()
        let placeholderColor = UIColor.grayClr
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: placeholderColor,
            .font: Font.custom(size: 20, fontWeight: .Medium)
        ]
        let attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
        urlTextField!.attributedPlaceholder = attributedPlaceholder
        urlTextField?.font = Font.custom(size: 20, fontWeight: .Medium)

        addButton = NeonButton(frame: .zero)
        addButton?.setTitle("Add".localized(), for: .normal)
        addButton?.setTitleColor(.white, for: .normal)
        addButton?.backgroundColor = .mainClr
        addButton?.layer.cornerRadius = 10
        addButton?.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)

        cancelButton = UIButton(frame: .zero)
        cancelButton?.setImage(UIImage(named: "line_img"), for: .normal)
        cancelButton?.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)

        addSubview(titleLabel)
        addSubview(urlTextField!)
        addSubview(addButton!)
        addSubview(cancelButton!)
        addSubview(urlLine!)

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(45)
            make.left.equalToSuperview().offset(24)
        }

        urlTextField?.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(60)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }

        urlLine?.snp.makeConstraints { make in
            make.top.equalTo(urlTextField!.snp.bottom)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(1)
        }

        addButton?.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-90)
            make.left.equalToSuperview().offset(90)
            make.bottom.equalToSuperview().offset(-30)
            make.height.equalTo(55)
        }

        cancelButton?.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.centerX.equalToSuperview()
        }
    }

    @objc private func addButtonTapped() {
        guard let url = urlTextField?.text else { return }
        onAddButtonTapped?(url)
    }

    @objc private func cancelButtonTapped() {
        onCancelButtonTapped?()
    }
}


