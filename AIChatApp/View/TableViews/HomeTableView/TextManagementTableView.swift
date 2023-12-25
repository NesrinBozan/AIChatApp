//
//  TextManagementTableView.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 9.12.2023.
//

import Foundation
import UIKit
import NeonSDK

class TextManagementTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    weak var homeVC: HomeSliderVC?
    let cellIdentifier = "ChooseCell"
    let chooseViewTypes: [Category.CategoryType] = [.All, .Explain, .Write, .Translate, .WriteEmail, .GetRecipes, .History, .DoMath, .Social, ]
    var photoButtonTapped: (()->())?
    var urlButtonTapped: (()->())?
    var fileButtonTapped: (()->())?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTableView()
    }
    
    private func setupTableView() {
        delegate = self
        dataSource = self
        backgroundColor = .whiteClr
        register(TextManagementCell.self, forCellReuseIdentifier: cellIdentifier)
        separatorStyle = .none
        rowHeight = UITableView.automaticDimension
        translatesAutoresizingMaskIntoConstraints = false
        showsVerticalScrollIndicator = false
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chooseViewTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TextManagementCell
            let type = chooseViewTypes[indexPath.row]
            cell.configure(with: type, vc: homeVC)
            cell.selectionStyle = .none
            return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
