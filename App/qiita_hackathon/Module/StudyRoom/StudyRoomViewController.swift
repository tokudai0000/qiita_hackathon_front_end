//
//  StudyRoomViewController.swift
//  qiita_hackathon
//
//  Created by Akihiro Matsuyama on 2024/02/10.
//

import UIKit

class StudyRoomViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView! 

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
}

extension StudyRoomViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sample.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StudyRoomCell", for: indexPath) as! StudyRoomCell 
        cell.setUp(with: sample[indexPath.row])
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 3.0
        cell.layer.cornerRadius = 8.0
        return cell
    }
}

extension StudyRoomViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 270)
    }
}







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

