//
//  AccountSettingsViewController.swift
//  qiita_hackathon
//
//  Created by Akihiro Matsuyama on 2024/02/10.
//

import UIKit

class AccountSettingsViewController: UIViewController {
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var iconImageView: UIImageView!

    var userData: User? = nil
//    User(id: "UUID", iconImage: <#T##String#>, userName: <#T##String#>, companionDrink: <#T##String#>, programLangs: <#T##[ProgramLang]#>, snsLinks: <#T##[SnsLink]#>)

    override func viewDidLoad() {
        super.viewDidLoad()

        configStackView()
        configIconImageView()
    }

    private func configStackView() {
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 10
    }

    private func configIconImageView() {
        iconImageView.image = UIImage(systemName: "eraser")
        iconImageView.backgroundColor = .red
    }
}
