//
//  CategoryCell.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 19.12.2023.
//

import UIKit

class CatgeoryCell: UITableViewCell {
static let identifier = "categoryCell"
var allExploreCollectionView: CategoryAllCollectionView!
var didSelectItem: ((Category) -> Void)?
var didSelect: ((Category)->Void)?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

func setupView() {
    layer.cornerRadius = 20
    backgroundColor = .whiteClr
    
    allExploreCollectionView = CategoryAllCollectionView(didSelect: { [weak self] category, _ in
           guard let self = self else { return }
           self.didSelectItem?(category)
       })
       
       allExploreCollectionView.didSelect = { [weak self] category, indexPath in
           guard let self = self else { return }
           self.didSelect?(category)
       }
    
    contentView.addSubview(allExploreCollectionView)
    allExploreCollectionView.backgroundColor = .whiteClr
    allExploreCollectionView.snp.makeConstraints { make in
        make.left.right.equalToSuperview().inset(24)
//            make.right.equalToSuperview().offset(-24)
        make.top.equalToSuperview().offset(10)
        make.bottom.equalToSuperview().offset(-10)
    }
    
}

func filterCategoryByType(type: Category.CategoryType, category: [Category]){
        allExploreCollectionView.objects = category.filter({$0.type == type})
}

}
