//
//  OnboardingVC.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 28.12.2023.
//

import UIKit

class OnboardingVC: UIViewController{

    var onboardingPages = [BaseOnboardingVC]()
    var pageViewController: UIPageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .whiteClr
        setupUI()

    }
    
    func setupUI () {
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController?.dataSource = self
    
        let page1 = BaseOnboardingVC(imageName: "img_onboarding1",
                                             titleText: "Scan & Solve",
                                             subtitleText: "Take a picture of your math problem, and our algorithm will provide a step-by-step solution for you.",
                                             pageViewController: pageViewController! ,sliderName: "slider1")
        let page2 = BaseOnboardingVC(imageName: "img_onboarding2",
                                             titleText: "Describe",
                                             subtitleText: "Capture a photo, let our app craft vivid descriptions, bringing your memories to life.",
                                             pageViewController: pageViewController!,  sliderName: "slider2")
        let page3 = BaseOnboardingVC(imageName: "img_onboarding3",
                                             titleText: "Multiple Possibilities",
                                             subtitleText: "Designed for simplicity in daily tasks, including email writing, code explanation, and more.",
                                             pageViewController: pageViewController!, sliderName: "slider3")

        onboardingPages.append(page1)
        onboardingPages.append(page2)
        onboardingPages.append(page3)
   
        if let firstPage = onboardingPages.first {
            pageViewController?.setViewControllers([firstPage], direction: .forward, animated: true, completion: nil)
        }
        addChild(pageViewController!)
        view.addSubview(pageViewController!.view)
        
        pageViewController!.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        pageViewController!.didMove(toParent: self)
    }
}

// MARK: - UIPageViewControllerDataSource

extension OnboardingVC: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentOnboardingVC = viewController as? BaseOnboardingVC,
            let currentIndex = onboardingPages.firstIndex(of: currentOnboardingVC) else {
                return nil
        }

        let nextIndex = currentIndex + 1
        if nextIndex >= onboardingPages.count {
            let paywallViewController = TabbarController()
            return paywallViewController
        }
        let nextViewController = onboardingPages[nextIndex]
        guard nextViewController != pageViewController.viewControllers?.first else {
            return nil
        }
        return nextViewController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = onboardingPages.firstIndex(of: viewController as! BaseOnboardingVC) else {
            return nil
        }
        let previousIndex = currentIndex - 1
        if previousIndex < 0 {
            return nil
        }
        let previousViewController = onboardingPages[previousIndex]
        guard previousViewController != pageViewController.viewControllers?.first else {
            return nil
        }
        return previousViewController
    }
}
