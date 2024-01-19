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
    let segmentedControl = UISegmentedControl(items: ["Math Solver", "GPT"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        view.backgroundColor = .whiteClr
        
        headerView.rightBtn.setImage(UIImage(named: "btn_settings"), for: .normal)
        headerView.rightBtn.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        headerView.proButton.addTarget(self, action: #selector(proButtonTapped), for: .touchUpInside)
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.height.equalTo(60)
        }
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        segmentedControl.backgroundColor = .ultraLightGrayClr
        segmentedControl.selectedSegmentTintColor = .mainClr
        let font = Font.custom(size: 16, fontWeight: .Medium)
        segmentedControl.setTitleTextAttributes([.font: font], for: .selected)
        segmentedControl.setTitleTextAttributes([.font: font], for: .normal)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.exploreLightGray], for: .normal)
    

        view.addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(58)
            make.height.equalTo(40)
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
    @objc func proButtonTapped() {
        present(destinationVC: PaywallVC(), slideDirection: .up)
    }
    @objc func segmentedControlValueChanged() {
        }
    func updateEmptyViewButtonText() {
          let selectedSegmentIndex = segmentedControl.selectedSegmentIndex
          let buttonText = selectedSegmentIndex == 0 ? "Button Text 1" : "Button Text 2"
//          emptyChatView.updateButtonText(buttonText)
      }
    
}
