//
//  DrinkViewController.swift
//  qiita_hackathon
//
//  Created by Hina on 2024/02/11.
//

import UIKit

private let reuseIdentifier = "Cell"

class DrinkViewController: UIViewController, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!


    @IBOutlet weak var selectedDrink: UILabel!
    var userData: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        configCollectionView()

    }

    private func registerCells() {
        collectionView.register(UINib(nibName: "DrinkSelectionCell", bundle: nil), forCellWithReuseIdentifier: "DrinkSelectionCell")
    }

    @IBAction func didCancel(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

    @IBAction func didTapSave(_ sender: Any) {

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


extension DrinkViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Common().drinkList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DrinkSelectionCell", for: indexPath) as! DrinkSelectionCell
        cell.setUpDrink(drink: Common().drinkList[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedDrink.text = Common().drinkList[indexPath.row]

    }
}
