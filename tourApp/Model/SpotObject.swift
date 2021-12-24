//
//  SpotObject.swift
//  tourApp
//
//  Created by 김주영 on 2021/12/24.
//

import Foundation

class SpotObject {
    static let shared = SpotObject()

    var spots: [detail]?

    private init() { }
}
