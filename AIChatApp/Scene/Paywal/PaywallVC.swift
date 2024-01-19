//
//  PaywallVC.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 28.12.2023.
//

import UIKit
import NeonSDK

class PaywallVC: UIViewController {

    let btnWeekly = PaywallButton()
    let btnLifetime = PaywallButton()
    let titleLabel = UILabel()
    let btnBuy = NeonBouncingButton()
    var canDismiss = false
    var isSenderSettings = false
    var completionAfterShowingPaywall : (() -> ())?
    override func viewDidLoad() {
        super.viewDidLoad()
        AdaptyManager.selectedPaywall = AdaptyManager.getPaywall(id: "paywall_1")
        createUI()
        packageFetched()
        Neon.onboardingCompleted()
        if let paywall = AdaptyManager.selectedPaywall{
//            Adapty.logShowPaywall(paywall)
        }
    }
    
    func createUI(){

        let backgroundImage = UIImageView()
//        backgroundImage.image =  Globals.isDarkModeEnabled ?  UIImage(named: "paywall_1_background_dark") : UIImage(named: "paywall_1_background_light")
        view.addSubview(backgroundImage)
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.textAlignment = .center
        titleLabel.text = AdaptyConstants.titleLabelTextWhenWeeklySelected*
        titleLabel.numberOfLines = 2
        titleLabel.font = Font.custom(size: 30, fontWeight: .SemiBold)
//        titleLabel.textColor = Globals.isDarkModeEnabled ? .clrWhite : .clrBlack
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(20)
            
        }
        
        createAnimatedViews()
        
        let testemonialView = NeonTestimonialView()
        view.addSubview(testemonialView)
        testemonialView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.height.equalTo(210)
        }
        
    
        testemonialView.testimonialTextColor = Globals.isDarkModeEnabled ?  .clrWhite : .clrBlack
        testemonialView.testimonialbackgroundColor = Globals.isDarkModeEnabled ?  .clrBlueDark : .clrBlueLight
        testemonialView.currentTestimonialPageTintColor = .clrBluePrimary
        testemonialView.testimonialPageTintColor = .clrGray
        testemonialView.testimonialbackgroundCornerRadious = 12
        testemonialView.pageControlType = .V1
        
        testemonialView.addTestimonial(title: "Great App", testimonial: "I've been using this app for a while now, and it's been amazing! It has improved the performance of my phone and helped me free up a lot of storage space.", author: "John Smith")
        testemonialView.addTestimonial(title: "Highly Recommend", testimonial: "This app is a game-changer! It's incredibly easy to use and has made my phone run faster than ever. I can't imagine using my phone without it now.", author: "Emily Johnson")
        testemonialView.addTestimonial(title: "Impressive Results", testimonial: "I was skeptical at first, but this app exceeded my expectations. It quickly identified and removed unnecessary files, making my phone more efficient.", author: "Michael Davis")

  
        let legalView = NeonLegalView()
        legalView.termsURL = "https://www.neonapps.co/terms-of-use"
        legalView.privacyURL = "https://www.neonapps.co/privacy-policy"
        legalView.restoreButtonClicked = {
            AdaptyManager.restorePurchases(vc: self, animation: .loadingCircle) {
                self.present(destinationVC: TabbarController(), slideDirection: .right)
            } completionFailure: {
                
            }
        }
        legalView.textColor = Globals.isDarkModeEnabled ? .clrWhite : .clrBlack
        view.addSubview(legalView)
        legalView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(50)
        }
        
      
        btnBuy.setTitle(AdaptyConstants.ctaButtonTextWhenWeeklySelected, for: .normal)
        btnBuy.titleLabel?.font = Font.custom(size: 16, fontWeight: .SemiBold)
        btnBuy.backgroundColor = .clrBluePrimary
        btnBuy.setTitleColor(.clrWhite, for: .normal)
        btnBuy.layer.cornerRadius = 12
        btnBuy.bouncingScale = AdaptyConstants.ctaButtonBouncedScale
        btnBuy.bouncingDuration = AdaptyConstants.ctaButtonBouncingDuration
        btnBuy.addTarget(self, action: #selector(btnBuyClicked), for: .touchUpInside)
        view.addSubview(btnBuy)
        btnBuy.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.bottom.equalTo(legalView.snp.top).offset(0)
            make.height.equalTo(60)
        }
        
        let lblFreeTrial = UILabel()
        lblFreeTrial.textAlignment = .left
        lblFreeTrial.text = "Enable Free Trial"
        lblFreeTrial.numberOfLines = 1
        lblFreeTrial.font = Font.custom(size: 15, fontWeight: .Medium)
        lblFreeTrial.textColor = Globals.isDarkModeEnabled ? .clrWhite : .clrBlack
        view.addSubview(lblFreeTrial)
        lblFreeTrial.snp.makeConstraints { make in
            make.bottom.equalTo(btnBuy.snp.top).offset(-30)
            make.left.equalToSuperview().inset(40)
            
        }
        
        let switchFreeTrial = UISwitch()
        switchFreeTrial.isOn = true
        view.addSubview(switchFreeTrial)
        switchFreeTrial.addTarget(self, action: #selector(switchFreeTrialClicked(_ :)), for: .valueChanged)
        switchFreeTrial.snp.makeConstraints { make in
            make.centerY.equalTo(lblFreeTrial)
            make.right.equalToSuperview().inset(40)
            
        }
     
        btnLifetime.title = "Lifetime - \(AdaptyManager.getPackagePrice(id: Constants.lifetimeProductID)) billed once"
        btnLifetime.subtitle = "Unlock Premium Features"
        view.addSubview(btnLifetime)
        btnLifetime.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.bottom.equalTo(switchFreeTrial.snp.top).offset(-20)
            make.height.equalTo(65)
        }
        btnLifetime.clickCompletion = { [self] in
            AdaptyManager.selectPackage(id: Constants.lifetimeProductID)
            titleLabel.text = AdaptyConstants.titleLabelTextWhenLifetimeSelected
            btnBuy.setTitle(AdaptyConstants.ctaButtonTextWhenLifetimeSelected, for: .normal)
            switchFreeTrial.setOn(false, animated: true)
        }
      
        btnWeekly.title = "\(AdaptyManager.getPackagePrice(id: Constants.weeklyProductID)) per week"
        btnWeekly.subtitle = "3-day free trial"
        btnWeekly.isSelected = true
        view.addSubview(btnWeekly)
        btnWeekly.isBestSeller = true
        btnWeekly.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.bottom.equalTo(btnLifetime.snp.top).offset(-20)
            make.height.equalTo(65)
        }
        btnWeekly.clickCompletion = { [self] in
            AdaptyManager.selectPackage(id: Constants.weeklyProductID)
            titleLabel.text = AdaptyConstants.titleLabelTextWhenWeeklySelected
            btnBuy.setTitle(AdaptyConstants.ctaButtonTextWhenWeeklySelected, for: .normal)
            switchFreeTrial.setOn(true, animated: true)
        }
        
        
        let featuresView = NeonPaywallFeaturesView()
        featuresView.featureTextColor = Globals.isDarkModeEnabled ? .clrWhite : .clrBlack
        featuresView.featureIconBackgroundColor = .clrBluePrimary
        featuresView.featureIconTintColor = .clrWhite
        view.addSubview(featuresView)
        featuresView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(testemonialView.snp.bottom).offset(5)
            make.bottom.equalTo(btnWeekly.snp.top).offset(-10)
        }
        featuresView.addFeature(title: "Detect & Remove Similar Photos", icon: UIImage(named: "img_iconClean")!)
        featuresView.addFeature(title: "Get New Features Every Week", icon: UIImage(named: "img_iconCompress")!)
      
        if UIScreen.main.bounds.height > 812{ // iPhone X
            featuresView.addFeature(title: "Free Up Storage & Save Time", icon: UIImage(named: "img_iconFile")!)
        }
       
        if UIScreen.main.bounds.height <= 667{ // iPhone 8
            featuresView.addFeature(title: "Free Up Storage & Save Time", icon: UIImage(named: "img_iconFile")!)
            testemonialView.isHidden = true
            
            featuresView.snp.remakeConstraints { make in
                make.left.right.equalToSuperview()
                make.top.equalTo(titleLabel.snp.bottom).offset(20)
                make.bottom.equalTo(btnWeekly.snp.top).offset(-10)
            }
        }
        
        createCloseButton()
    }
    
    @objc func btnBuyClicked(){
        if AdaptyManager.selectedPackage == nil{
            AdaptyManager.selectPackage(id: Constants.weeklyProductID)
        }
        AdaptyManager.subscribe(animation: .custom(name: "cleaning") ,animationWidth: 300) { [self] in
            if canDismiss && !isSenderSettings{
                dismiss(animated: true)
            }else{
                self.present(destinationVC: TabbarController(), slideDirection: .down)
            }
        } completionFailure: {
         
        }

    }
    func createAnimatedViews(){
        let sparkle1 = NeonAnimationView(animation: .custom(name: "sparkle_1"), color: .clrBluePrimary)
        view.addSubview(sparkle1)
        sparkle1.alpha = 0.4
        sparkle1.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(150)
            make.right.equalToSuperview().offset(10)
        }
        
        let sparkle2 = NeonAnimationView(animation: .custom(name: "sparkle_2"), color: .clrBluePrimary)
        view.addSubview(sparkle2)
        sparkle2.alpha = 0.4
        sparkle2.snp.makeConstraints { make in
            make.bottom.equalTo(titleLabel.snp.bottom)
            make.width.height.equalTo(100)
            make.left.equalTo(titleLabel.snp.left).offset(-20)
        }
        
        let sparkle3 = NeonAnimationView(animation: .custom(name: "sparkle_1"), color:  .clrBluePrimary)
        view.addSubview(sparkle3)
        sparkle3.alpha = 0.4
        sparkle3.transform = CGAffineTransform(scaleX: -1, y: 1)
        sparkle3.snp.makeConstraints { make in
            make.bottom.equalTo(titleLabel.snp.bottom).offset(50)
            make.width.height.equalTo(150)
            make.right.equalTo(titleLabel.snp.right).offset(20)
        }
        
    }
    
    func createCloseButton(){
        let closeButton = UIButton()
        closeButton.setImage(UIImage(named: "paywall_close"), for: .normal)
        let closeButtonAlpha = AdaptyConstants.closeButtonAlpha
        closeButton.alpha = closeButtonAlpha
        closeButton.addAction { [self] in
            if canDismiss{
    
                dismiss(animated: true)
                
                if let completionAfterShowingPaywall{
                    completionAfterShowingPaywall()
                }
      
            }else{
                present(destinationVC: TabbarController(), slideDirection: .right)
            }
        }
      
        let closeButtonAppearanceDuration = AdaptyConstants.closeButtonAppearanceDuration
        if closeButtonAppearanceDuration != 0{
            closeButton.isHidden = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + closeButtonAppearanceDuration , execute: {
            closeButton.isHidden = false
        })
        view.addSubview(closeButton)
        let closeButtonSize = AdaptyConstants.closeButtonSize
        closeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.left.equalToSuperview().offset(10)
            make.height.width.equalTo(closeButtonSize)
        }
        
        
    }
    @objc func switchFreeTrialClicked(_ sender : UISwitch ){
        if sender.isOn{
            btnWeekly.clicked()
        }else{
            btnLifetime.clicked()
        }
    }
    
//    func packageFetched() {
//        btnLifetime.title = "Lifetime - \(AdaptyManager.getPackagePrice(id: Constants.lifetimeProductID)) billed once"
//        btnWeekly.title = "\(AdaptyManager.getPackagePrice(id: Constants.weeklyProductID)) per week"
//    }
    
}
