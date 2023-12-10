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
    
    convenience init(didSelect: ((Section, IndexPath) -> Void)? = nil) {
        self.init(objects: Globals.arrSection,
                  leftPadding: CGFloat(24),
                  rightPadding: CGFloat(24),
                  horizontalItemSpacing: CGFloat(10),
                  widthForItem: 0)
        self.didSelect = didSelect
        register(SectionCell.self, forCellWithReuseIdentifier: "SectionCell")
        self.showsHorizontalScrollIndicator = false
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return objects.count
       }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           reloadData() 
           didSelect?(objects[indexPath.item], indexPath)
       }

      
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionCell", for: indexPath) as! SectionCell
            let section = objects[indexPath.item]
            cell.configure(with: section)
            return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let itemText = objects[indexPath.item].title {
            let font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            let textWidth = itemText.size(withAttributes: [NSAttributedString.Key.font: font]).width
            let cellPadding: CGFloat = 20
            let cellWidth = textWidth + cellPadding * 2
            return CGSize(width: cellWidth, height: 120)
        } else {
            return CGSize(width: 0, height: 0) // or some default size
        }
    }

}
