//
//  Message.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 9.12.2023.
//

import Foundation
import UIKit

public class Message: Codable {
    enum Sender: Codable {
        case user
        case AI
        case loading
        case none
    }
    
    enum MessageType: Codable {
           case text
           case image
           case url
           case pdf
    }
    
    var isLocked: Bool
    var sender: Sender
    var content: String
    var date: Date
    var id: String
    var shouldAnimate: Bool
    var imageUrl: String?
    var image: Data?
    var messageType: MessageType
    var categoryTitle: String?
    var placeHolder: String?

    init(isLocked: Bool = false, sender: Sender = .none, content: String = "", date: Date = Date(), id: String = UUID().uuidString, shouldAnimate: Bool = false, imageUrl: String? = nil, image: Data? = nil, messageType: MessageType = .text, placeHolder: String = "") {
        self.isLocked = isLocked
        self.sender = sender
        self.content = content
        self.date = date != Date() ? date : Date()
        self.id = id
        self.shouldAnimate = shouldAnimate
        self.imageUrl = imageUrl
        self.image = image
        self.messageType = messageType
        self.placeHolder = placeHolder
    }

}
