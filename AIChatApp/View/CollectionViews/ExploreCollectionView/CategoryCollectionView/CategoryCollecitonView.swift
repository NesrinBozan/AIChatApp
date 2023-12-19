//
//  CategoryCollecitonView.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 10.12.2023.
//

import Foundation
import UIKit
import NeonSDK

class CategoryCollectionView: NeonCollectionView<Category, CategoryAllCell> {
    var didSelectCategory: ((Category) -> Void)?
      
    convenience init(category: [Category] , didSelect: ((Category, IndexPath) -> Void)? = nil) {
        self.init(objects: category,
                  itemsPerRow: 2,
                  leftPadding: 24,
                  rightPadding: 24,
                  horizontalItemSpacing: 16,
                  verticalItemSpacing: 16)
        self.didSelect = didSelect
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objects.count

       }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          let selectedCategory = objects[indexPath.item]
          didSelectCategory?(selectedCategory)
      }


    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryAllCell", for: indexPath) as! CategoryAllCell
            let category = objects[indexPath.item]
              cell.configure(with: category)
              return cell

    }
}
