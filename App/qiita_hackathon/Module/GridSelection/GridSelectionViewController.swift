//
//  GridSelectionViewController.swift
//  qiita_hackathon
//
//  Created by Akihiro Matsuyama on 2024/02/10.
//

import UIKit

class GridSelectionViewController: UIViewController, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView! 
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        configCollectionView()

    }

    private func registerCells() {
        collectionView.register(UINib(nibName: "GridSelectionCell", bundle: nil), forCellWithReuseIdentifier: "GridSelectionCell")
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
        let height = width 
        layout.itemSize = CGSize(width: width, height: height)

        collectionView.collectionViewLayout = layout
    }

}


extension GridSelectionViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Common().iconList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridSelectionCell", for: indexPath) as! GridSelectionCell
        cell.setIcon(imageString: Common().iconList[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let vc = R.storyboard.accountSettings.accountSettingsViewController()!
//        vc.displayType = .display
//        vc.userData = usersData.users[indexPath.row]
//        self.present(vc, animated: true)
    }
}
