//
//  Settings.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 20.12.2023.
//

import Foundation

struct SettingItem {
    let rightIcon: String
    let title: String
    let iconName: String
    let action: () -> Void
}

struct SettingSection {
    let title: String
    let items: [SettingItem]
}
