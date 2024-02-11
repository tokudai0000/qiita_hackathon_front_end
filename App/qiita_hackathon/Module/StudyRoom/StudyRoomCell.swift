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
        // API保留
//        if let image = Common().convertBase64ToImage(user.iconImage) {
//            userImage.image = image
//        }
        userImage.image = UIImage(named: user.iconImage)

        userNameLabel.text = user.userName
        drinkLabel.text = user.companionDrink
        langLabel.text = user.lang


        if let date = DateFormatter.HHmmss.date(from: user.totalTime) {
            let dateFormatter = DateFormatter()
            dateFormatter.setTemplate(.time)
            elapsedTime.text = dateFormatter.string(from: date).description
        }
    }
}
