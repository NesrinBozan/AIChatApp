//
//  ExploreVC.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 7.12.2023.
//

import UIKit

class ExploreVC: UIViewController {

    private var sectionCollectionView: SectionCollectionView! = nil
    let headerView = CustomHeaderView(pageTitle: "MathSolver & GPT".localized(), showLeftButton: false, showRightButton: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
      setupView()
    }
    
    func setupView(){
        view.backgroundColor = .whiteClr
        headerView.rightBtn.setImage(UIImage(named: "btn_settings"), for: .normal)
//        headerView.rightBtn.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)

        
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.height.equalTo(60)
        }
        sectionCollectionView = SectionCollectionView(didSelect: { [weak self] indexPath,section  in
            guard let self = self else { return }
            
        })

        view.addSubview(sectionCollectionView)
        sectionCollectionView.backgroundColor = .whiteClr
        sectionCollectionView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom).offset(30)
            make.height.equalTo(100)
        }
        
    }
    func setupData() {
         // Example data for arrSection
        let section1 = Section(title: "Section 1", unSelectedimage: UIImage(named: "btn_add")!, selectedImage: UIImage(named: "btn_down")!)
        let section2 = Section(title: "Section 2", unSelectedimage: UIImage(named: "btn_add")!, selectedImage: UIImage(named: "btn_down")!)
        let section3 = Section(title: "Section 3", unSelectedimage: UIImage(named: "btn_add")!, selectedImage: UIImage(named: "btn_down")!)

         // Set the arrSection array
         Globals.arrSection = [section1, section2, section3]

    
     }



}
