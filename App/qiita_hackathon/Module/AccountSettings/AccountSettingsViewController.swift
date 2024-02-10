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
    @IBOutlet weak var companionDrinkButton: UIButton!
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
        nameTextFielld.textAlignment = .center
    }

    private func configCompanionDrinkButton() {
        companionDrinkButton.setTitle(userData?.companionDrink.description, for: .normal)
        companionDrinkButton.tintColor = .black
    }

    private func configLangButton() {
        langButton.setTitle(userData?.lang.description, for: .normal)
        langButton.tintColor = .black
    }

    private func configSns() {
        snsLink.text = userData?.snsLink
        snsLink.textAlignment = .center
    }

    // TODO: displayType == .settings のBool値をisEnabledに使うことも検討
    // buttonをisEnabledにして編集拒否はtintのalfa値も変わる
    private func configDisplayMode() {
        nameTextFielld.isEnabled = false
        companionDrinkButton.isEnabled = false
        langButton.isEnabled = false
        snsLink.isEnabled = false
    }

    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
