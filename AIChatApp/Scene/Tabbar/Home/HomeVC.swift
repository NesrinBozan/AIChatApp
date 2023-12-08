//
//  HomeVC.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 6.12.2023.
//

import UIKit
import NeonSDK


final class HomeVC: UIViewController, NeonBasePageControlDelegate {

    let textInputView = TextInputView(frame: .zero, showLeftButton: true)
    let headerView = CustomHeaderView(pageTitle: "MathSolver & GPT".localized(), showLeftButton: false, showRightButton: true)
    static let pageControl = NeonPageControlV2()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        addSliderViewController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        HomeVC.pageControl.set(progress: 0, animated: false)
    }

    func setupView() {
        view.backgroundColor = .white

        headerView.rightBtn.setImage(UIImage(named: "btn_settings"), for: .normal)
        headerView.rightBtn.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)

        
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.height.equalTo(60)
        }
        
        view.addSubview(HomeVC.pageControl)
        HomeVC.pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-96)
            make.width.equalTo(12)
            make.height.equalTo(12)
        }
        HomeVC.pageControl.currentPageTintColor = .mainClr
        HomeVC.pageControl.tintColor = .lightGray
        HomeVC.pageControl.padding = 10
        HomeVC.pageControl.numberOfPages = 2
        HomeVC.pageControl.set(progress: 2, animated: true)
        HomeVC.pageControl.enableTouchEvents = true
        HomeVC.pageControl.delegate = self
        
        
        
//        view.addSubview(textInputView)
//
//        textInputView.snp.makeConstraints { make in
//            make.left.equalToSuperview().offset(14)
//            make.right.equalToSuperview().offset(-14)
//            make.bottom.equalToSuperview().offset(-100)
//            make.height.equalTo(68)
//        }
    }
    
    @objc func rightButtonTapped(){
        present(destinationVC: SettingsVC(), slideDirection: .right)
    }
    
    private func addSliderViewController() {
        let sliderViewController = HomeSliderVC(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        addChild(sliderViewController)
        view.addSubview(sliderViewController.view)
        sliderViewController.didMove(toParent: self)
        sliderViewController.view.backgroundColor = .whiteClr
        
        sliderViewController.view.translatesAutoresizingMaskIntoConstraints = false
        sliderViewController.view.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom)
            make.bottom.equalToSuperview().offset(-140)
        }
        
    }
    
    func didTouch(pager: NeonSDK.NeonBasePageControl, index: Int) {
        
    }
}
