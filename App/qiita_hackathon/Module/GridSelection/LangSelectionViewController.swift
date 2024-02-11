//
//  LangSelectionViewController.swift
//  qiita_hackathon
//
//  Created by Hina on 2024/02/11.
//

import Foundation
import UIKit

class LangSelectionViewController: UIViewController, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var selectedLang: UILabel!
    var userData: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        configCollectionView()
        userData = UserDataRepository().fetchUserData()

    }

    private func registerCells() {
        collectionView.register(UINib(nibName: "LangSelectionCell", bundle: nil), forCellWithReuseIdentifier: "LangSelectionCell")
    }

    @IBAction func didCancel(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapSave(_ sender: Any) {
//        let preNC = self.presentingViewController as! UINavigationController
//        let preVC = preNC.viewControllers[preNC.viewControllers.count - 1] as! AccountSettingsViewController
//        preVC.lang = selectedLang.text! //ここで値渡し

        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    private func configCollectionView() {

        collectionView.delegate = self
        collectionView.dataSource = self

        // セルの大きさを変更する
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 30 // 行間の余白
        layout.sectionInset = UIEdgeInsets(top: 40, left: 5, bottom: 40, right: 5)

        // サイズ
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 60) / 3 // 画面サイズ-40
        let height = width
        layout.itemSize = CGSize(width: width, height: height)

        collectionView.collectionViewLayout = layout
    }

}


extension LangSelectionViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Common().langList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LangSelectionCell", for: indexPath) as! LangSelectionCell
        cell.setUpLang(lang: Common().langList[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedLang.text = Common().langList[indexPath.row]
        
    }
}
