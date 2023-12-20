//
//  SettingsTableView.swift
//  AIChatApp
//
//  Created by Nesrin Bozan on 20.12.2023.
//

import UIKit
import NeonSDK

class  SettingsTableView: NeonTableView<SettingItem, SettingsCell> {
    
    override init(objects: [SettingItem] = [], heightForRows: CGFloat = 80, style: UITableView.Style = .plain) {
        super.init(objects: objects, heightForRows: heightForRows, style: style)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as! SettingsCell
            let item = objects[indexPath.row]
            cell.configure(with: item)
            return cell
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
