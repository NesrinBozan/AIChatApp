//
//  HomeSliderVC.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 8.12.2023.
//

import Foundation
import UIKit
import NeonSDK

final class HomeSliderVC: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
   
    private var orderedViewControllers: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .whiteClr
        delegate = self
        dataSource = self
        
        let mathandsummaryMediaViewController = mathandsummaryMediaViewController()
        let textManagementViewController = textManagementViewController()

        orderedViewControllers.append(mathandsummaryMediaViewController)
        orderedViewControllers.append(textManagementViewController)

        if let initialViewController = orderedViewControllers.first {
            setViewControllers([initialViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let currentViewController = pageViewController.viewControllers?.first,
               let currentIndex = orderedViewControllers.firstIndex(of: currentViewController) {
                HomeVC.pageControl.set(progress: currentIndex, animated: true)
            }
        }
    }
    private func mathandsummaryMediaViewController() -> UIViewController {
        
        let viewController = UIViewController()
        let mathSolverView = MathAndSummaryView(image: UIImage(named: "btn_image"), title: "MATH SOLVER".localized(), buttonText: "Scan and solve any problem".localized(), background: UIImage(named: "img_mathSolver"), crownIsHidden: false)
        
        let photoView = MathAndSummaryView(image: UIImage(named: "btn_image"), title: "What is this image about?".localized(), buttonText: "Pick a Photo".localized(), background: UIImage(named: "img_Photo"), crownIsHidden: false)
        
        let urlView = MathAndSummaryView(image: UIImage(named: "btn_web"), title: "Summarize Web Page".localized(), buttonText: "Add URL".localized(), background: UIImage(named: "img_url"), crownIsHidden: true)
        
        let fileView = MathAndSummaryView(image: UIImage(named: "btn_file"), title: "Summarize Pdf File".localized(), buttonText: "Pick a File".localized(), background: UIImage(named: "img_file"), crownIsHidden: true)
        
        let stackView = UIStackView(arrangedSubviews: [mathSolverView, photoView, urlView, fileView])
        stackView.axis = .vertical
        stackView.spacing = 20
        
        viewController.view.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        }

        return viewController
    }
    
    private func textManagementViewController() -> UIViewController {
        let viewController = UIViewController()
        
        
        return viewController
        
    }


    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        return orderedViewControllers[previousIndex]

    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        
        HomeVC.pageControl.set(progress: 1, animated: true)

        guard orderedViewControllers.count != nextIndex else {
            return nil
        }
        guard orderedViewControllers.count > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
}
