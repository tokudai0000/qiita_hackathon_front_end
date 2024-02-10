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
    @IBOutlet weak var sns1: UIStackView!
    @IBOutlet weak var sns2: UITextField!
    
    var userData: User? = Common().sampleUserData

    enum DisplayType {
        case settings
        case display
    }
    var displayType: DisplayType = .settings

    override func viewDidLoad() {
        super.viewDidLoad()

        configIconImageView()
        configNameTextFielld()
        configCompanionDrinkButton()
        configLangButton()
        configSns()
    }


    private func configIconImageView() {
        iconImageView.image = UIImage(systemName: "eraser")
        iconImageView.backgroundColor = .red
    }

    private func configNameTextFielld() {
        nameTextFielld.text = userData?.userName
    }

    private func configCompanionDrinkButton() {
    }

    private func configLangButton() {
    }

    private func configSns() {
//        sns1.text = userData?.sns1
//        sns2.text = userData?.sns2
    }
}
