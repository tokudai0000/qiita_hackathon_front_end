//
//  GridSelectionCell.swift
//  qiita_hackathon
//
//  Created by Hina on 2024/02/10.
//

import UIKit

class GridSelectionCell: UICollectionViewCell {

    @IBOutlet weak var selectedIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    func setIcon(imageString: String) {
        selectedIcon.image = UIImage(named: imageString)!
    }

}
