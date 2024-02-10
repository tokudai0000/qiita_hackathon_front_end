//
//  StudyRoomCell.swift
//  qiita_hackathon
//
//  Created by Hina on 2024/02/10.
//

import UIKit

class StudyRoomCell: UICollectionViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var drinkLabel: UILabel!
    @IBOutlet weak var langLabel: UILabel!
    @IBOutlet weak var elapsedTime: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setUp(with user: User) {
        if let image = Common().convertBase64ToImage(user.iconImage) {
            userImage.image = image
        }
        userNameLabel.text = user.userName
        drinkLabel.text = user.companionDrink.description
        langLabel.text = user.lang.description
        elapsedTime.text = user.totalTime
    }
}
