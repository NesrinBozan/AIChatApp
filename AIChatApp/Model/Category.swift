//
//  Category.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 9.12.2023.
//

import Foundation
import UIKit


class Category {
    
    enum CategoryType: String, Codable, CaseIterable {
        case All, Content, Artist, Business, Personal, Email, Social, Code, Food, Entertainment, Explain, Write, Translate, WriteEmail, GetRecipes, History, DoMath,Image, Url, File
    }
    enum HomeCategoryType: String, Codable, CaseIterable {
      case Explain, Write, Translate, WriteEmail, GetRecipes, History, DoMath
    }
    
    var title = String()
    var description = String()
    var image = UIImage()
    var type =  CategoryType.All
    var questions: [Question]
    var chatHistory = [Message]()
    var prompt = String()
    var id = String()
    var  button1Text: String?
    var  button2Text: String?
    
    init(title: String = String(), description: String = String(), image: UIImage = UIImage(), type: CategoryType = .All, chatHistory: [Message] = [], prompt: String = String(), questions: [Question] = [], id : String = String(), button1Text: String? = nil, button2Text: String? = nil ) {
        self.title = title
        self.description = description
        self.image = image
        self.type = type
        self.chatHistory = chatHistory
        self.prompt = prompt
        self.questions = questions
        self.id = id
        self.button1Text = button1Text
        self.button2Text = button2Text
    }
    
    func stringCategoryType() -> String {
        return self.type.rawValue
    }
}
struct Question {
    var text: String
}

