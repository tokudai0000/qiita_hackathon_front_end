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

    @IBAction func companionDrinkButton(_ sender: Any) {
    }
    
    @IBAction func langButton(_ sender: Any) {
    }
    
    private func configDefaults() {
        let tapGR: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGR.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGR)
    }

    private func configIconImageView() {
        // タップ検知
        iconImageView.isUserInteractionEnabled = true
        iconImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapped)))

        // Base64からUIImageに変換
        guard let base64 = userData?.iconImage,
              let image = Common().convertBase64ToImage(base64) else {
            iconImageView.image = UIImage(systemName: "eraser")
            return
        }
        iconImageView.image = image
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

    // TODO: objcは極力使いたくない
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }

    @objc func tapped() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let pickerView = UIImagePickerController()
            pickerView.sourceType = .photoLibrary
            pickerView.delegate = self
            self.present(pickerView, animated: true)
        }
    }
}

extension AccountSettingsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage // 選択された画像を取得
        guard let user = userData,
              let base64 = Common().convertImageToBase64(image) else {
            let alert = UIAlertController(title: "保存に失敗しました", message: nil, preferredStyle: .alert)
            // UIAlertActionを作成
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                // アクションボタンがタップされたときの処理
            }
            // UIAlertActionをUIAlertControllerに追加
            alert.addAction(okAction)
            // UIAlertControllerを表示
            self.present(alert, animated: true, completion: nil)
            self.dismiss(animated: true)
            return
        }
        iconImageView.image = image

        let newUserData = User(id: user.id,
                               iconImage: base64,
                               userName: user.userName,
                               companionDrink: user.companionDrink,
                               totalTime: user.totalTime,
                               snsLink: user.snsLink,
                               entryTime: user.entryTime,
                               lang: user.lang)
        userData = newUserData
        self.dismiss(animated: true)
    }
}
