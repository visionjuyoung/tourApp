//
//  CountyInfo.swift
//  tourApp
//
//  Created by 김주영 on 2021/12/23.
//

import Foundation

class CountyInfo {
    static let shared = CountyInfo()

    var county: String?

    private init() { }
}
