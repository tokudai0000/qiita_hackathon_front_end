//
//  InputFieldView.swift
//  qiita_hackathon
//
//  Created by Akihiro Matsuyama on 2024/02/10.
//

import UIKit

class InputFieldView: UIView, UITextFieldDelegate {
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var textField: UITextField!

    weak var delegate: InputFieldView?

    override func awakeFromNib() {
        super.awakeFromNib()
        textField.delegate = self
    }

//    func textFieldDidChangeSelection(_ textField: UITextField) {
//        delegate?.textFieldDidChange(text: textField.text ?? "")
//    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
}
