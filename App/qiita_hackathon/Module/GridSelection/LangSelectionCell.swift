//
//  LangSelectionCell.swift
//  qiita_hackathon
//
//  Created by Hina on 2024/02/11.
//

import UIKit

class LangSelectionCell: UICollectionViewCell {

    @IBOutlet weak var langLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .yellow
    }

    func setUpLang(lang: String) {
        langLabel.text = lang
    }

}
