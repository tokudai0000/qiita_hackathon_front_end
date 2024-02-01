//
//  MainViewController.swift
//  qiita_hackathon
//
//  Created by Akihiro Matsuyama on 2024/02/01.
//

import UIKit

final class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sampleAPI()
    }

    @IBAction func button(_ sender: Any) {
        // storyboardにてStoryboardIDを設定、Use StoryboardIDにチェックをいれ、1度Buildすること
        let vc = R.storyboard.sub.subViewController()!
        self.present(vc, animated: true)
    }

    private func sampleAPI() {
        let api = AdItemsAPI()
        api.getAdItems { result in // インスタンスを通してメソッドを呼び出す
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    print("広告アイテムを取得しました: \(response.adItems)")
                case .failure(let error):
                    print("エラーが発生しました: \(error)")
                }
            }
        }
    }
}

