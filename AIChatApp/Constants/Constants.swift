//
//  Constants.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 7.12.2023.
//

import Foundation
import NeonSDK


public class Constants{
    public static let horizontalMargin = CGFloat(24)
    public static let topMargin = CGFloat(70)
    public static let bottomMargin = CGFloat(50)
    
    public static let verticalSpacing = CGFloat(16)
    public static let horizontalSpacing = CGFloat(16)
    
    public static let cornerRadius: CGFloat = 20
    public static let defaultTopOffset: CGFloat = 14
    public static let defaultSize: CGFloat = 50
    public static let customTopOffset: CGFloat = 20
    public static let customLeadingOffset: CGFloat = 50
    
    static var weeklyProductID = "unlock.cleaner.weekly"
    static var lifetimeProductID = "unlock.cleaner.lifetime.1"
    static var lifetime2ProductID = "unlock.cleaner.lifetime.2"



}


class AdaptyConstants{
    
    
    // Paywall 1
    
    static var bestSellerLabelText = "Best Seller"
    static var ctaButtonTextWhenLifetimeSelected = "Unlock All Premium Features"
    static var ctaButtonTextWhenWeeklySelected =   "Start my 3-day free trial"
    static var titleLabelTextWhenWeeklySelected =  "START YOUR 3 DAYS FREE TRIAL"
    static var titleLabelTextWhenLifetimeSelected =  "UNLOCK UNLIMITED ACCESS"

    
    // Common
    
//    static var closeButtonAlpha = AdaptyManager.getRemoteConfigValue(id: "closeButtonAlpha") as? Double ?? 0.8
//    static var closeButtonSize = AdaptyManager.getRemoteConfigValue(id: "closeButtonSize") as? Double ?? 25
//    static var closeButtonAppearanceDuration = AdaptyManager.getRemoteConfigValue(id: "closeButtonAppearanceDuration") as? Double ?? 0
//    static var ctaButtonBouncingDuration = AdaptyManager.getRemoteConfigValue(id: "ctaButtonBouncingDuration") as? Double ?? 0.8
//    static var ctaButtonBouncedScale = AdaptyManager.getRemoteConfigValue(id: "ctaButtonBouncedScale") as? Double ?? 1.15
    
}
 
