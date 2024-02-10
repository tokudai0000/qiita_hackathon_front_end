//
//  InputFieldView.swift
//  qiita_hackathon
//
//  Created by Akihiro Matsuyama on 2024/02/10.
//

import UIKit

class InputFieldView: UIView {
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var textField: UITextField!

//    weak var delegate: InputFieldView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setTitleText(_ text: String) {
        titleTextLabel?.text = text
    }

    private func configureView() {
        loadNib()

        // TODO: 他にUIの装飾処理があれば実行する
    }

    private func loadNib() {
        guard let inputField = R.nib.inputField(withOwner: self) else {
            fatalError("Fail to load FooView from Nib.")
        }
        inputField.frame = self.bounds
        addSubview(inputField)
    }
}
