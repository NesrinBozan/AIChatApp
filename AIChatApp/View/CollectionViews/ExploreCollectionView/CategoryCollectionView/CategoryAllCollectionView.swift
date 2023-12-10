//
//  CategoryAllCollectionView.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 10.12.2023.
//

import UIKit
import NeonSDK

class CategoryAllCollectionView: NeonCollectionView<Category, CategoryCell> {
    
    convenience init( didSelect: ((Category, IndexPath) -> Void)? = nil) {
        self.init(objects: Globals.arrCategory,
                  leftPadding: 0,
                  rightPadding: 24,
                  horizontalItemSpacing: 16,
                  widthForItem: 182)
        self.didSelect = didSelect
        self.showsHorizontalScrollIndicator = false
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return objects.count
        
       }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCategory = objects[indexPath.item]
        didSelect?(selectedCategory, indexPath)
      }
      
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            let section = objects[indexPath.item]
            cell.configure(with: section)
            return cell
    }
    
}
