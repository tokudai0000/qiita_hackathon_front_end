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
    


    var userData: User?

    enum DisplayType {
        case settings
        case display
    }
    var displayType: DisplayType = .settings

//    var lang = ""
//
//    override func viewWillAppear(_ animated: Bool) {
//        print(lang)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO: 汚いコード
        if displayType == .display {
            configDisplayMode()
        }else{
            configUserInit()
        }
        configDefaults()
        configIconImageView()
        configNameTextFielld()
        configCompanionDrinkButton()
        configLangButton()
        configSns()
    }

    @IBAction func companionDrinkButton(_ sender: Any) {
        let DrinkVC = UIStoryboard(name: "DrinkSelection", bundle: nil).instantiateViewController(withIdentifier: "DrinkSelection") as! DrinkViewController

        let navigationController = UINavigationController(rootViewController: DrinkVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
    
    @IBAction func langButton(_ sender: Any) {
        let LangSelectionVC = UIStoryboard(name: "LangSelection", bundle: nil).instantiateViewController(withIdentifier: "LangSelection") as! LangSelectionViewController

        let navigationController = UINavigationController(rootViewController: LangSelectionVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }

    private func configUserInit() {
        userData = UserDataRepository().fetchUserData()

        if userData != nil {
            return
        }
        // userのデータがない時のみ
        let id = UUID().uuidString
        let imageNumber = Int.random(in: 1 ... 6)
        let image = "Image\(imageNumber)"

        updateUserData(id: id, iconImage: image)
    }

    private func configDefaults() {

        let tapGR: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGR.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGR)
    }

    private func configIconImageView() {
        // タップ検知
        // API保留
//        iconImageView.isUserInteractionEnabled = true
//        iconImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapped)))

        // Base64からUIImageに変換
        // API保留
//        guard let base64 = userData?.iconImage,
//              let image = Common().convertBase64ToImage(base64) else {
//            iconImageView.image = UIImage(systemName: "eraser")
//            return
//        }
        iconImageView.image = UIImage(named: userData?.iconImage ?? "")
//        updateUserData(iconImage: userData?.iconImage)
        updateUserData(iconImage: "Image3")
    }

    private func configNameTextFielld() {
        nameTextFielld.text = userData?.userName
        nameTextFielld.delegate = self
    }

    private func configCompanionDrinkButton() {
        if let userData {
            companionDrinkLabel.text = Common().drinkList[userData.companionDrink]
        }
    }

    private func configLangButton() {
        if let userData {
            langLabel.text = Common().langList[userData.lang]
        }
    }

    private func configSns() {
        snsLink.text = userData?.snsLink
        snsLink.delegate = self
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

    private func updateUserData(id: String? = nil,
                                iconImage: String? = nil,
                                userName: String? = nil,
                                companionDrink: String? = nil,
                                totalTime: String? = nil,
                                snsLink: String? = nil,
                                entryTime: String? = nil,
                                lang: String? = nil) {
//        guard let user = userData else {
//            AKLog(level: .ERROR, message: "updateUserData失敗")
//            return
//        }
        let finalId = id ?? userData?.id
        let finalIconImage = iconImage ?? userData?.iconImage
        let finalUserName = userName ?? userData?.userName
        let finalCompanionDrink = companionDrink ?? userData?.companionDrink
        let finalTotalTime = totalTime ?? userData?.totalTime
        let finalSnsLink = snsLink ?? userData?.snsLink
        let finalEntryTime = entryTime ?? userData?.entryTime
        let finalLang = lang ?? userData?.lang

        let newUserData = User(id: finalId ?? "",
                               iconImage: finalIconImage ?? "",
                               userName: finalUserName ?? "",
                               companionDrink: finalCompanionDrink ?? "",
                               totalTime: finalTotalTime ?? "",
                               snsLink: finalSnsLink ?? "",
                               entryTime: finalEntryTime ?? "",
                               lang: finalLang ?? "")

        if displayType == .settings {
            // 更新
            userData = newUserData
            UserDataRepository().setUserData(newUserData)
        }
//        postUserAPI()
    }

    private func postUserAPI() {
        let api = UserPostAPI()
        guard let user = userData else {
            AKLog(level: .ERROR, message: "userData")
            return
        }
        api.postUserData(user: user,
                         completion: { result in // インスタンスを通してメソッドを呼び出す
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    print("UserData登録完了！: \(response)")
                case .failure(let error):
                    print("エラーが発生しました: \(error)")
                }
            }
        })
    }

    // TODO: objcは極力使いたくない
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }

    @IBAction func didTapIconSelect(_ sender: Any) {
        let GridVC = UIStoryboard(name: "GridSelection", bundle: nil).instantiateViewController(withIdentifier: "GridSelection") as! GridSelectionViewController

        GridVC.modalPresentationStyle = .formSheet
            present(GridVC, animated: true, completion: nil)
    }
    //    @objc func tapped() {
//        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
//            let pickerView = UIImagePickerController()
//            pickerView.sourceType = .photoLibrary
//            pickerView.delegate = self
//            self.present(pickerView, animated: true)
//        }
//    }
}

extension AccountSettingsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage // 選択された画像を取得
        guard let base64 = Common().convertImageToBase64(image) else {
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
        updateUserData(iconImage: base64)
        self.dismiss(animated: true)
    }
}

extension AccountSettingsViewController: UITextFieldDelegate {
    /// textField編集後
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let userName = nameTextFielld.text {
            updateUserData(userName: userName)
        }
        if let snsLink = snsLink.text {
            updateUserData(snsLink: snsLink)
        }
    }
}
