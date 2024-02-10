//
//  AccountSettingsViewController.swift
//  qiita_hackathon
//
//  Created by Akihiro Matsuyama on 2024/02/10.
//

import UIKit

class AccountSettingsViewController: UIViewController {
    @IBOutlet weak var iconImageView: UIImageView!

    var userData: User? = Common().sampleUserData

    override func viewDidLoad() {
        super.viewDidLoad()

        configStackView()
        configIconImageView()
        configNameField()
    }

    private func configStackView() {
    }

    private func configIconImageView() {
        iconImageView.image = UIImage(systemName: "eraser")
        iconImageView.backgroundColor = .red
    }

    private func configNameField() {
    }
}
