//
//  StudyRoomViewController.swift
//  qiita_hackathon
//
//  Created by Akihiro Matsuyama on 2024/02/10.
//

import UIKit

final class StudyRoomViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private let accessButton = UIButton()
    private var isInRoom: Bool = false
    private var usersData: Users = Common().sampleUsersData

    override func viewDidLoad() {
        super.viewDidLoad()

        configAccessButton()
        configCollectionView()

        // APIを呼び出す
        usersUpdateGetAPI()
    }

    private func configAccessButton() {
        accessButton.setTitle("入室", for:UIControl.State.normal)
        accessButton.titleLabel?.font =  UIFont.systemFont(ofSize: 20)
        accessButton.backgroundColor = UIColor.systemPink
        accessButton.layer.cornerRadius = 12

        // タップ処理
        accessButton.addTarget(self,
                               action: #selector(StudyRoomViewController.buttonTapped(sender:)),
                               for: .touchUpInside)

        self.view.addSubview(accessButton)

        // レイアウト
        accessButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // 横幅を親ビューの1/4に設定
            accessButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            // 高さを70に設定
            accessButton.heightAnchor.constraint(equalToConstant: 70),
            // 右部から-15のオートレイアウト
            accessButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            // 下部から(タブバー10pt, accessButtonの高さ70pt, 空白15pt)のオートレイアウト
            accessButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -95)
        ])
    }

    private func configCollectionView() {
        collectionView.register(UINib(resource: R.nib.studyRoomCell),
                                forCellWithReuseIdentifier: R.reuseIdentifier.studyRoomCell.identifier)

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor(red: 26/255, green:93/255, blue: 26/255, alpha: 1)

        // セルの大きさを変更する
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 30 // 行間の余白
        layout.sectionInset = UIEdgeInsets(top: 30, left: 5, bottom: 30, right: 5)

        // サイズ
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 20) / 2 // 画面サイズ-40
        let height = width * 1.5
        layout.itemSize = CGSize(width: width, height: height)

        collectionView.collectionViewLayout = layout
    }

    // usersデータを入れると更新してくれる
    private func listUpdate(users: Users) {
        usersData = users
        collectionView.reloadData()
    }

    private func usersUpdateGetAPI() {
        let api = UsersUpdateGetAPI()
        api.getUsersUpdate { result in // インスタンスを通してメソッドを呼び出す
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    // 受け取ったデータを更新する
                    self.listUpdate(users: response.users)
                    print("Usersを取得しました: \(response.users)")
                case .failure(let error):
                    print("エラーが発生しました: \(error)")
                }
            }
        }
    }

    private func userJoinPostAPI(requestID: String) {
        let api = UserJoinPostAPI()
        api.postUserJoin(id: requestID) { result in // インスタンスを通してメソッドを呼び出す
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    // 受け取ったデータを更新する
                    print("requestIDを打刻しました 入室！")
                case .failure(let error):
                    print("エラーが発生しました: \(error)")
                }
            }
        }
    }

    private func userLeavePostAPI(requestID: String) {
        let api = UserLeavePostAPI()
        api.postUserLeave(id: requestID) { result in // インスタンスを通してメソッドを呼び出す
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    // 受け取ったデータを更新する
                    print("requestIDを打刻しました　退出！")
                case .failure(let error):
                    print("エラーが発生しました: \(error)")
                }
            }
        }
    }

    @objc func buttonTapped(sender : Any) {
        let userId = UserDataRepository().fetchUserData().id
        // isInRoom(部屋にいる状態)の時にボタンが押されると退出とみなす
        if isInRoom {
            // 退出処理(入室を受け付ける表示に変更する)
            userLeavePostAPI(requestID: userId)
            accessButton.setTitle("入室", for:UIControl.State.normal)
            accessButton.backgroundColor = UIColor.systemPink
        } else {
            userJoinPostAPI(requestID: userId)
            accessButton.setTitle("退出", for:UIControl.State.normal)
            accessButton.backgroundColor = UIColor.systemBlue

        }

        isInRoom = !isInRoom
    }
}

extension StudyRoomViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return usersData.users.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.studyRoomCell, for: indexPath)!
        let userData = usersData.users[indexPath.row]
        cell.setUp(with: userData)
        cell.backgroundColor = UIColor.brown
        cell.layer.borderColor = UIColor.brown.cgColor
        cell.layer.borderWidth = 3.0
        cell.layer.cornerRadius = 8.0
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = R.storyboard.accountSettings.accountSettingsViewController()!
        vc.displayType = .display
        vc.userData = usersData.users[indexPath.row]
        self.present(vc, animated: true)
    }
}



//extension StudyRoomViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 180, height: 270)
//    }
//}

//    @IBAction func button(_ sender: Any) {
//        // storyboardにてStoryboardIDを設定、Use StoryboardIDにチェックをいれ、1度Buildすること
//        let vc = R.storyboard.sub.subViewController()!
//        self.present(vc, animated: true)
//    }
//
//    private func sampleAPI() {
//        let api = AdItemsAPI()
//        api.getAdItems { result in // インスタンスを通してメソッドを呼び出す
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let response):
//                    print("広告アイテムを取得しました: \(response.adItems)")
//                case .failure(let error):
//                    print("エラーが発生しました: \(error)")
//                }
//            }
//        }
//    }
