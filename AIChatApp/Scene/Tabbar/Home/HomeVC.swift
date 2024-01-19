//
//  HomeVC.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 6.12.2023.
//

import UIKit
import NeonSDK
import PDFKit
import AVFoundation


final class HomeVC: UIViewController, NeonBasePageControlDelegate, MediaButtonDelegate {
    let imagePicker = UIImagePickerController()
    let headerView = CustomHeaderView(pageTitle: "MathSolver & GPT".localized(), showLeftButton: false, showRightButton: true)
    let alertController = UIAlertController(title: "Select Media Source".localized(), message: nil, preferredStyle: .actionSheet)
    let documentPicker = UIDocumentPickerViewController(documentTypes: ["public.item"], in: .import)
    let exampleBtn = NeonButton()
    static let pageControl = NeonPageControlV2()
    var urlInputView = URLInputView()
    
    
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
        headerView.backgroundColor = .whiteClr
        headerView.proButton.addTarget(self, action: #selector(proButtonTapped), for: .touchUpInside)
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.height.equalTo(60)
        }
        HomeVC.pageControl.currentPageTintColor = .mainClr
        HomeVC.pageControl.tintColor = .lightGray
        HomeVC.pageControl.padding = 10
        HomeVC.pageControl.numberOfPages = 2
        HomeVC.pageControl.set(progress: 2, animated: true)
        HomeVC.pageControl.enableTouchEvents = true
        HomeVC.pageControl.delegate = self
        
    }
    
    @objc func proButtonTapped() {
        present(destinationVC: PaywallVC(), slideDirection: .up)
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
        sliderViewController.mediaButtonDelegate = self
        
        sliderViewController.view.translatesAutoresizingMaskIntoConstraints = false
        sliderViewController.view.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom)
            make.bottom.equalToSuperview().offset(-90)
        }
        
        sliderViewController.view.addSubview(sliderViewController.textInputView)
        sliderViewController.textInputView.backgroundColor = .white
        sliderViewController.textInputView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().offset(-16)
            make.height.equalTo(65)
        }
        sliderViewController.view.addSubview(HomeVC.pageControl)
        HomeVC.pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(sliderViewController.textInputView.snp.top).offset(-24)
            make.width.height.equalTo(6)

        }
        
    }
    
    func didTouch(pager: NeonSDK.NeonBasePageControl, index: Int) {
        
    }
    func photoButtonTapped() {
        presentAlerForImageTypeSelection()
       }
    func fileButtonTapped() {
        presentAlertControllerForFileTypeSelection()
    }
    func urlButtonTapped() {
        urlInputView.onAddButtonTapped = { [weak self] url in
//            self?.handleURLAddition(url)
        }
        
        urlInputView.onCancelButtonTapped = { [weak self] in
//            self?.cancelURLAddition()
        }
        
        if let tabBarController = self.tabBarController {
               tabBarController.view.addSubview(urlInputView)
               
               urlInputView.snp.makeConstraints { make in
                   make.leading.trailing.equalToSuperview()
                   make.bottom.equalToSuperview().offset(-10)
                   make.height.equalTo(320)
               }
           }
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissURLInputView))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    @objc func dismissURLInputView() {
        urlInputView.removeFromSuperview()
    }
    
    func presentAlerForImageTypeSelection() {
        let alert = UIAlertController(title: "Select Media Source".localized(), message: nil, preferredStyle: .actionSheet)

        let galleryAction = UIAlertAction(title: "Gallery".localized(), style: .default) { [weak self] _ in
            self?.presentImagePicker(sourceType: .photoLibrary)
        }

        let cameraAction = UIAlertAction(title: "Camera".localized(), style: .default) { [weak self] _ in
            self?.presentImagePicker(sourceType: .camera)
        }

        let cancelAction = UIAlertAction(title: "Cancel".localized(), style: .cancel) { [weak self] _ in
//            self?.removeBlurView()
        }

        alert.addAction(galleryAction)
        alert.addAction(cameraAction)
        alert.addAction(cancelAction)

        if let viewController = UIApplication.shared.keyWindow?.rootViewController {
            alert.overrideUserInterfaceStyle = viewController.traitCollection.userInterfaceStyle
            viewController.present(alert, animated: true, completion: nil)
        }
    }

     
    
    
    func presentAlertControllerForFileTypeSelection() {
        let alert = UIAlertController(title: "Select File Source".localized(), message: nil, preferredStyle: .actionSheet)
        
        let documentAction = UIAlertAction(title: "Document".localized(), style: .default) { [weak self] _ in
            self?.presentFilePicker()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel".localized(), style: .cancel) { [weak self] _ in
            //            self?.removeBlurView()
        }
        
        alert.addAction(documentAction)
        alert.addAction(cancelAction)
        
        if let viewController = UIApplication.shared.keyWindow?.rootViewController {
            alert.overrideUserInterfaceStyle = viewController.traitCollection.userInterfaceStyle
            viewController.present(alert, animated: true, completion: nil)
        }
    }
    
      
}
extension HomeVC: UIImagePickerControllerDelegate & UINavigationControllerDelegate, UIDocumentPickerDelegate, AVCapturePhotoCaptureDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
     
    }
    
    func presentPicker(for type: PickerType) {
         switch type {
         case .photo:
             presentImagePicker(sourceType: .photoLibrary)
         case .url:
             presentURLPicker()
         case .file:
             presentFilePicker()
         }
     }
    
    private func presentImagePicker(sourceType: UIImagePickerController.SourceType) {
        imagePicker.sourceType = sourceType
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
      }

      private func presentURLPicker() {
         
      }

      private func presentFilePicker() {
          documentPicker.allowsMultipleSelection = false
  //        documentPicker.delegate = self
          present(documentPicker, animated: true, completion: nil)
      }
    func presentAlertController() {
        if let viewController = UIApplication.shared.keyWindow?.rootViewController {
            alertController.overrideUserInterfaceStyle = viewController.traitCollection.userInterfaceStyle
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
}

