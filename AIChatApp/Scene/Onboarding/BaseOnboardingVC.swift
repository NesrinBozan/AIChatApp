//
//  BaseOnboardingVC.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 28.12.2023.
//

import UIKit
import NeonSDK

class BaseOnboardingVC: UIViewController {

    var pageControl: UIPageControl!
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let nextButton = UIButton()
    var scrollView: UIScrollView!
    var pageViewController: UIPageViewController?
    let sliderImage = UIImageView()
    
    init(imageName: String, titleText: String, subtitleText: String, pageViewController: UIPageViewController, sliderName: String) {
        super.init(nibName: nil, bundle: nil)
        self.imageView.image = UIImage(named: imageName)
        self.titleLabel.text = titleText
        self.subtitleLabel.text = subtitleText
        self.nextButton.setTitle("Continue", for: .normal)
        self.pageViewController = pageViewController
        self.sliderImage.image = UIImage(named: sliderName)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
 
    func setupView() {
        
        titleLabel.textColor = UIColor(red: 0.098, green: 0.11, blue: 0.239, alpha: 1)
        titleLabel.font = Font.custom(size: 30, fontWeight: .Medium)
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        
        imageView.contentMode = .scaleAspectFit
        subtitleLabel.textColor = UIColor(red: 0.579, green: 0.579, blue: 0.579, alpha: 1)
        subtitleLabel.font = Font.custom(size: 18, fontWeight: .Regular)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0
        
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Continue", for: .normal)
        nextButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
        nextButton.backgroundColor = .mainClr
        nextButton.layer.cornerRadius = 25
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(30)
            make.left.right.equalToSuperview().inset(34)
        }
        view.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(33)
            make.left.right.equalToSuperview().inset(34)
            
        }
        view.addSubview(sliderImage)
        sliderImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(subtitleLabel.snp.bottom).offset(40)
        }
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-35)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(55)
        }
    }
        
    @objc func nextTapped() {
        guard let viewController = pageViewController?.viewControllers?.first,
              let nextViewController = pageViewController?.dataSource?.pageViewController(pageViewController!, viewControllerAfter: viewController) else {
            return
        }
        pageViewController?.setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        updatePageControl(for: nextViewController)
     }
        
    func updatePageControl(for viewController: UIViewController) {
        if let indexClosure = pageViewController?.dataSource?.presentationIndex {
            let index = indexClosure(pageViewController!)
            pageControl.currentPage = index
        }
    }
}
