//
//  Section.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 10.12.2023.
//

import Foundation
import UIKit

public class Section {
    var title: String?
    var isSelected: Bool?
    var unSelectedimage: UIImage?
    var selectedImage: UIImage?
    
    init(title: String? = nil, isSelected: Bool? = nil, unSelectedimage: UIImage? = nil, selectedImage: UIImage? = nil) {
        self.title = title
        self.isSelected = isSelected
        self.unSelectedimage = unSelectedimage
        self.selectedImage = selectedImage
    }
}
