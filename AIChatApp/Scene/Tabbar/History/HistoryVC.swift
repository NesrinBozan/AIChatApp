//
//  HistoryVC.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 7.12.2023.
//

import UIKit
import NeonSDK

class HistoryVC: UIViewController {

    private let emptyChatView = EmptyChatView()
    let headerView = CustomHeaderView(pageTitle: "MathSolver & GPT".localized(), showLeftButton: false, showRightButton: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        view.backgroundColor = .whiteClr
        
        headerView.rightBtn.setImage(UIImage(named: "btn_settings"), for: .normal)
        headerView.rightBtn.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.height.equalTo(60)
        }
        
        emptyChatView.showInView(emptyChatView) {
            self.present(destinationVC: SettingsVC(), slideDirection: .right)
        }
        
        view.addSubview(emptyChatView)
        emptyChatView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(400)
            make.left.right.equalToSuperview()
       
    }
    
        
    }
    @objc func rightButtonTapped(){
        present(destinationVC: SettingsVC(), slideDirection: .right)
    }
}
