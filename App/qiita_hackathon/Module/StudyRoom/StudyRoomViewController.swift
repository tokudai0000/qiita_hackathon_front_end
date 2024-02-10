//
//  StudyRoomViewController.swift
//  qiita_hackathon
//
//  Created by Akihiro Matsuyama on 2024/02/10.
//

import UIKit

class StudyRoomViewController: UIViewController, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    let button = UIButton()
    var entryStatus = false


    override func viewDidLoad() {
        super.viewDidLoad()
        makeButton()
        collectionView.register(UINib(nibName: "StudyRoomCell", bundle: nil), forCellWithReuseIdentifier: "StudyRoomCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        collectionView.backgroundColor = UIColor(red: 26/255, green:93/255, blue: 26/255, alpha: 1)
        //セルの大きさを変更する
        let layout = UICollectionViewFlowLayout()
        //行間の余白
        layout.minimumLineSpacing = 30
        layout.sectionInset = UIEdgeInsets(top: 30, left: 5, bottom: 30, right: 5)
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        //画面サイズ-40
        let width = (window.screen.bounds.width - 20) / 2
        let height = width * 1.5
        layout.itemSize = CGSize(width: width, height: height)
        collectionView.collectionViewLayout = layout
    }

    func makeButton() {

        let screenWidth = self.view.frame.width
        let screenHeight = self.view.frame.height
        // 位置とサイズ
        button.frame = CGRect(x:screenWidth - 150, y:screenHeight - 150,
                              width:screenWidth/4, height:60)
        // タイトル
        button.setTitle("入室", for:UIControl.State.normal)

        // フォントサイズ
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 20)

        // 背景色
        button.backgroundColor = UIColor.systemPink
        // タップされたときの処理
        button.addTarget(self,
                         action: #selector(StudyRoomViewController.buttonTapped(sender:)),
                         for: .touchUpInside)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        // Viewにボタンを追加
        self.view.addSubview(button)
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    @objc  func buttonTapped(sender : Any) {
        if entryStatus == false {
            button.setTitle("退出", for:UIControl.State.normal)
            button.backgroundColor = UIColor.systemBlue
            entryStatus = true
        } else {
            button.setTitle("入室", for:UIControl.State.normal)
            button.backgroundColor = UIColor.systemPink
            entryStatus = false
        }
    }
}

extension StudyRoomViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sample.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StudyRoomCell", for: indexPath) as! StudyRoomCell
        cell.setUp(with: sample[indexPath.row])
        cell.backgroundColor = UIColor.brown
        cell.layer.borderColor = UIColor.brown.cgColor
        cell.layer.borderWidth = 3.0
        cell.layer.cornerRadius = 8.0
        return cell
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

