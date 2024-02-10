//
//  SampleData.swift
//  qiita_hackathon
//
//  Created by Hina on 2024/02/10.
//

import Foundation
import UIKit

struct SampleData {
    let image: UIImage
    let name: String
    let drink: String
    let lang: String
    let elapsedTime: String
}

let sample: [SampleData] = [
    SampleData(image: UIImage(named: "Image1")!,name:"hinakko", drink: "コーヒー", lang: "Swift", elapsedTime: "30分"),
    SampleData(image: UIImage(named: "Image2")!,name:"hinakko", drink: "コーヒー", lang: "Swift", elapsedTime: "30分"),
    SampleData(image: UIImage(named: "Image3")!,name:"hinakko", drink: "コーヒー", lang: "Swift", elapsedTime: "30分"),
    SampleData(image: UIImage(named: "Image1")!,name:"hinakko", drink: "コーヒー", lang: "Swift", elapsedTime: "30分"),
    SampleData(image: UIImage(named: "Image2")!,name:"hinakko", drink: "コーヒー", lang: "Swift", elapsedTime: "30分"),
    SampleData(image: UIImage(named: "Image1")!,name:"hinakko", drink: "コーヒー", lang: "Swift", elapsedTime: "30分")
]
