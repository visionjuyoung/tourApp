//
//  TourInfoResponse.swift
//  tourApp
//
//  Created by 김주영 on 2021/12/23.
//

import Foundation

struct TourInfoResponse: Decodable {
    var result: [detail]
    var pageIndex: Int
    var pageUnit: Int
    var totalCount: Int
    var searchCnd: String
    var searchKrwd: String
    var status: String
}

struct detail: Decodable {
    var zip: String?
    var areaSe: String
    var lng: String
    var thumbImg: String
    var regDate: String
    var tourImg: String?
    var hmpg: String?
    var telno: String?
    var tourSe: String
    var tourNm: String
    var mobileTelno: String?
    var tourUrl: String
    var adres: String
    var tourNo: Int
    var lat: String
    var operTime: String?
    var intrcn: String?
}
