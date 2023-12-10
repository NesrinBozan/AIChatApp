//
//  ExploreVC.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 7.12.2023.
//

import UIKit

class ExploreVC: UIViewController {

    private let sectionCollectionView: SectionCollectionView! = nil
    let headerView = CustomHeaderView(pageTitle: "MathSolver & GPT".localized(), showLeftButton: false, showRightButton: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
      setupView()
    }
    
    
 
    
    func setupView(){
        
        headerView.rightBtn.setImage(UIImage(named: "btn_settings"), for: .normal)
//        headerView.rightBtn.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)

        
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.height.equalTo(60)
        }
        view.addSubview(sectionCollectionView)
        sectionCollectionView.backgroundColor = .whiteClr
        sectionCollectionView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom).offset(30)
            make.height.equalTo(50)
        }
        
    }


}
