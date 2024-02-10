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

    var userData: User? = Common().sampleUserData

    override func viewDidLoad() {
        super.viewDidLoad()

        configStackView()
        configIconImageView()
        configNameField()
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

    private func configNameField() {
        let firstView = UIView()
        firstView.backgroundColor = .red

        let secondView = UIView()
        secondView.backgroundColor = .blue

        let thirdView = UIView()
        thirdView.backgroundColor = .green

        // 各ビューをstackViewに追加
        view.addSubview(firstView)
        stackView.addArrangedSubview(secondView)
        stackView.addArrangedSubview(thirdView)

        let inputView = InputFieldView()
        stackView.addArrangedSubview(inputView)
        inputView.setTitleText("iou")

        let inputView2 = InputFieldView()
        inputView2.setTitleText("iou")
        stackView.addArrangedSubview(inputView2)
    }
}
