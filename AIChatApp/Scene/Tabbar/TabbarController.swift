//
//  TabbarController.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 7.12.2023.
//

import UIKit
import NeonSDK

final class TabbarController: UITabBarController, UITabBarControllerDelegate {
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
        self.delegate = self
    }
    
    // MARK: - Helpers
    private func configureViewControllers() {
        
        let home = templateNavigationController(unselectedImage: UIImage(named: "btn_homeUnselected")!,
                                                selectedImage: UIImage(named: "btn_homeSelected")!,
                                                rootViewController: HomeVC())
        let explore = templateNavigationController(unselectedImage: UIImage(named: "btn_exploreUnselected")!,
                                                   selectedImage: UIImage(named: "btn_exploreSelected")!,
                                                    rootViewController: ExploreVC())
        let history = templateNavigationController(unselectedImage: UIImage(named: "btn_historyUnselected")!,
                                                    selectedImage: UIImage(named: "btn_historySelected")!,
                                                      rootViewController: HistoryVC())
        viewControllers = [home, explore, history, ]
    }
    
    func templateNavigationController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage.withRenderingMode(.alwaysOriginal)
        nav.tabBarItem.selectedImage = selectedImage.withRenderingMode(.alwaysOriginal)
        nav.tabBarController?.tabBar.itemPositioning = .fill
        nav.tabBarController?.tabBar.heightAnchor.constraint(equalToConstant: 160).isActive = true
        tabBar.layer.masksToBounds = true
        nav.tabBarItem.imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: -12, right: 0)
        tabBar.backgroundColor = #colorLiteral(red: 0.9796730876, green: 0.9796730876, blue: 0.9796730876, alpha: 1)
        tabBar.layer.cornerRadius = 20
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        return nav
    }


}
