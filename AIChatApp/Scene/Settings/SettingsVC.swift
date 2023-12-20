



import UIKit
import NeonSDK

class SettingsVC: UIViewController {
    private let customTableView = SettingsTableView()
    private var sections: [SettingSection] = []
    let headerView = CustomHeaderView(pageTitle: "MathSolver & GPT".localized(), showLeftButton: true, showRightButton: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        configureSections()
    }

    private func setupTableView() {
        view.backgroundColor = .whiteClr
        headerView.leftBtn.setImage(UIImage(named: "btn_back"), for: .normal)

        headerView.leftBtn.addAction {
            self.dismiss(animated: true)
        }
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.height.equalTo(60)
        }
        
        view.addSubview(customTableView)
        customTableView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        
        customTableView.dataSource = self
        customTableView.delegate = self
        customTableView.isScrollEnabled = false
    }

    private func configureSections() {
         sections = [
            SettingSection(title: "Settings", items: [
                SettingItem(rightIcon: "", title: "Clear History", iconName: "btn_clearHistory", action: clearHistory),
                SettingItem(rightIcon: "btn_rightClick", title: "Language", iconName: "btn_language", action: changeLanguage)
            ]),
            
            SettingSection(title: "Membership", items: [SettingItem(rightIcon: "btn_rightClick", title: "Restore Purchases ", iconName: "btn_restore", action: changeLanguage)]),
            
            SettingSection(title: "Support", items: [SettingItem(rightIcon: "btn_rightClick", title: "Help", iconName: "btn_help", action: changeLanguage),
                                                    SettingItem(rightIcon: "btn_rightClick", title: "Request a features", iconName: "btn_requestFeature", action: changeLanguage)]),
            
            SettingSection(title: "About", items: [SettingItem(rightIcon: "btn_rightClick", title: "Rate Us", iconName: "btn_rateUs", action: changeLanguage),
                                                  SettingItem(rightIcon: "btn_rightClick", title: "Share with Friends", iconName: "btn_share", action: changeLanguage),
                                                  SettingItem(rightIcon: "btn_rightClick", title: "Term of Use", iconName: "btn_termofUs", action: changeLanguage),
                                                  SettingItem(rightIcon: "btn_rightClick", title: "Privacy Policy", iconName: "btn_privacy", action: changeLanguage)])
    
        ]

        customTableView.objects = sections.flatMap { $0.items }
        customTableView.reloadData()
    }

    private func clearHistory() {

    }

    private func changeLanguage() {

    }
}

extension SettingsVC: UITableViewDataSource, UITableViewDelegate {
        func numberOfSections(in tableView: UITableView) -> Int {
            return sections.count
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return sections[section].items.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as! SettingsCell

            let item = sections[indexPath.section].items[indexPath.row]
            cell.configure(with: item)
            return cell
        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

            let item = sections[indexPath.section].items[indexPath.row]
            item.action()
            tableView.deselectRow(at: indexPath, animated: true)
        }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 50.0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .whiteClr

        let titleLabel = UILabel()
        titleLabel.textColor = .darkBlackClr
        titleLabel.font = Font.custom(size: 20, fontWeight: .SemiBold)
        titleLabel.text = sections[section].title

        headerView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(headerView).offset(24)
            make.centerY.equalTo(headerView)
        }

        return headerView
    }

    }


