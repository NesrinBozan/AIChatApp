//
//  GenerateVC.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 12.12.2023.
//

import Foundation
import UIKit

public class GenerateVC: UIViewController{

    var category: Category
    
    init(category: Category) {
        self.category = category
        super.init(nibName: nil, bundle: nil)
        DispatchQueue.main.async { [self] in
//            setupView()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public override func viewDidLoad() {
        view.backgroundColor = .red
    }
    
}
