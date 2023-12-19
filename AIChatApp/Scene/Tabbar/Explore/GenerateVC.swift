//
//  GenerateVC.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 12.12.2023.
//

import Foundation
import UIKit
import NeonSDK

public class GenerateVC: UIViewController, UITextViewDelegate{

    private var questionLabels: [NeonLabel] = []
    private var answerTextViews: [NeonTextView] = []
    private var customView = ExploreCustomView()
    var category: Category
    
    init(category: Category) {
        self.category = category
        super.init(nibName: nil, bundle: nil)
        DispatchQueue.main.async { [self] in
           setupView()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public override func viewDidLoad() {
        setupView()
    }
    
    
    func setupView(){
        view.backgroundColor = .whiteClr
        
    }
    
    
    private func createLabel(withText text: String) -> NeonLabel {
          let label = NeonLabel()
          label.text = text
          label.font = Font.custom(size: 18, fontWeight: .SemiBold)
          label.textColor = .white
          label.numberOfLines = 0
          return label
      }
      
      private func createAnswerTextView() -> NeonTextView {
          let textView = NeonTextView()
          textView.layer.cornerRadius = 10
          textView.layer.borderWidth = 1
          textView.layer.borderColor = UIColor.blackClr.cgColor
          textView.textColor = .white
          textView.backgroundColor = .whiteClr
          textView.delegate = self
          textView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
          return textView
      }
    
}
