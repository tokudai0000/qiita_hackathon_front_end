//
//  DrinkSelectionCell.swift
//  qiita_hackathon
//
//  Created by Hina on 2024/02/11.
//

import UIKit

class DrinkSelectionCell: UICollectionViewCell {
    @IBOutlet weak var drinkLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .systemBlue
    }

    func setUpDrink(drink: String) {
        drinkLabel.text = drink
    }

}
