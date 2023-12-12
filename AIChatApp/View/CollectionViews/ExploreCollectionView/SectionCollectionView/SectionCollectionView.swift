//
//  SectionCollectionView.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 10.12.2023.
//

import Foundation
import UIKit
import NeonSDK


class SectionCollectionView: NeonCollectionView<Section, SectionCell> {
    var selectedIndexPath: IndexPath?
    convenience init(didSelect: ((Section, IndexPath) -> Void)?) {
        self.init(objects: Globals.arrSection,
                  leftPadding: CGFloat(24),
                  rightPadding: CGFloat(24),
                  horizontalItemSpacing: CGFloat(20),
                  widthForItem: 60)
        self.didSelect = didSelect
        self.showsHorizontalScrollIndicator = false
     
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return objects.count
       }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            if let selectedIndexPath = selectedIndexPath {
                var previousSelectedSection = objects[selectedIndexPath.item]
                previousSelectedSection.isSelected = false
                objects[selectedIndexPath.item] = previousSelectedSection
//                reloadItems(at: [selectedIndexPath])
            }
            var selectedSection = objects[indexPath.item]
            selectedSection.isSelected = true
            objects[indexPath.item] = selectedSection
//            reloadItems(at: [indexPath])

            selectedIndexPath = indexPath

            didSelect?(selectedSection, indexPath)
        }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionCell", for: indexPath) as! SectionCell
            let section = objects[indexPath.item]
            cell.configure(with: section)
            return cell
        
    }
    


}
