//
//  WeatherInfoResponse.swift
//  tourApp
//
//  Created by 김주영 on 2021/12/24.
//

import Foundation

struct WetherInfoResponse: Decodable {
    var coord: Coord
    var weather: [Weather]
    var base: String
    var main: WeatherMain
    var visibility: Int
    var wind: Wind
    var clouds: Clouds
    var dt: Int
    var sys: Sys
    var timezone: Int
    var id: Int
    var name: String
    var cod: Int
}

struct Coord: Decodable {
    var lon: Float
    var lat: Float
}

struct Weather: Decodable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct WeatherMain: Decodable {
    var temp: Float
    var feels_like: Float
    var temp_min: Float
    var temp_max: Float
    var pressure: Float
    var humidity: Float
}

struct Wind: Decodable {
    var speed: Float
    var deg: Int
}

struct Clouds: Decodable {
    var all: Int
}

struct Sys: Decodable {
    var type: Int
    var id: Int
    var country: String
    var sunrise: Int
    var sunset: Int
}
