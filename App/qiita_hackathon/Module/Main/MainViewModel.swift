//
//  MainViewModel.swift
//  qiita_hackathon
//
//  Created by Akihiro Matsuyama on 2024/02/01.
//

//WARNING// import UIKit 等UI関係は実装しない
import Foundation

final class MainViewModel {
//    public func getPRItems() {
//        state?(.busy) // 通信開始（通信中）
//
//        prItems.removeAll()
//
//        let urlStr = "https://tokudai0000.github.io/tokumemo_resource/pr_image/info.json"
//
//        apiManager.request(urlStr,
//                           success: { [weak self] (response) in
//
//            guard let self = self else { // HomeViewModelのself
//                AKLog(level: .FATAL, message: "[self] FatalError")
//                fatalError()
//            }
//            let itemCounts = response["itemCounts"].int ?? 0
//
//            for i in 0 ..< itemCounts {
//                let item = response["items"][i]
//                let prItem = PublicRelations(imageURL: item["imageURL"].string,
//                                           introduction: item["introduction"].string,
//                                           tappedURL: item["tappedURL"].string,
//                                           organization_name: item["organization_name"].string,
//                                           description: item["description"].string)
//                self.prItems.append(prItem)
//            }
//            self.state?(.ready) // 通信完了
//
//        }, failure: { [weak self] (error) in
//            AKLog(level: .ERROR, message: "[API] userUpdate: failure:\(error.localizedDescription)")
//            self?.state?(.error) // エラー表示
//        })
//    }
}
