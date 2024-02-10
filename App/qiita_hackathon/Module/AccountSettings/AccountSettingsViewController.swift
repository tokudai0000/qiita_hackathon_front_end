//
//  AccountSettingsViewController.swift
//  qiita_hackathon
//
//  Created by Akihiro Matsuyama on 2024/02/10.
//

import UIKit

class AccountSettingsViewController: UIViewController {
    @IBOutlet weak var iconImageView: UIImageView!
    // TODO: 再利用できる
    @IBOutlet weak var nameTextFielld: UITextField!
    @IBOutlet weak var companionDrinkLabel: UILabel!
    @IBOutlet weak var companionDrinkButton: UIButton!
    @IBOutlet weak var langLabel: UILabel!
    @IBOutlet weak var langButton: UIButton!
    @IBOutlet weak var snsLink: UITextField!

    var userData: User? = Common().sampleUserData

    enum DisplayType {
        case settings
        case display
    }
    var displayType: DisplayType = .settings

    override func viewDidLoad() {
        super.viewDidLoad()

        configDefaults()
        configIconImageView()
        configNameTextFielld()
        configCompanionDrinkButton()
        configLangButton()
        configSns()

        if displayType == .display {
            configDisplayMode()
        }
    }

    private func configDefaults() {
        let tapGR: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGR.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGR)
    }

    private func configIconImageView() {
        iconImageView.image = UIImage(systemName: "eraser")
        iconImageView.backgroundColor = .red
    }

    private func configNameTextFielld() {
        nameTextFielld.text = userData?.userName
    }

    private func configCompanionDrinkButton() {
        companionDrinkLabel.text = userData?.companionDrink.description
    }

    private func configLangButton() {
        langLabel.text = userData?.lang.description
    }

    private func configSns() {
        snsLink.text = userData?.snsLink
    }

    // TODO: displayType == .settings のBool値をisEnabledに使うことも検討
    // buttonをisEnabledにして編集拒否はtintのalfa値も変わる
    private func configDisplayMode() {
        nameTextFielld.isEnabled = false
        nameTextFielld.backgroundColor = .none
        snsLink.isEnabled = false
        snsLink.backgroundColor = .none
        companionDrinkButton.isHidden = true
        langButton.isHidden = true
    }

    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
