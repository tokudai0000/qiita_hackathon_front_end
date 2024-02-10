//
//  StudyRoomCell.swift
//  qiita_hackathon
//
//  Created by Hina on 2024/02/10.
//

import UIKit

class StudyRoomCell: UICollectionViewCell {

    @IBOutlet weak var userImage: UIImageView!

    @IBOutlet weak var drinkLabel: UILabel!

    @IBOutlet weak var langLabel: UILabel!

    @IBOutlet weak var elapsedTime: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    func setUp(with sample: SampleData) {
//        userImage.image = sample.image
//        drinkLabel.text = sample.drink
//        langLabel.text = sample.lang
//        elapsedTime.text = sample.elapsedTime
//    }
}
