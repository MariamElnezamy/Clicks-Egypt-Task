//
//  Constants.swift
//  Clicks Egypt Task
//
//  Created by Admin on 27/08/2021.
//

import Alamofire

let header: HTTPHeaders = ["accept": "application/json",
                           "Content-Type": "application/json"]

enum Constants: String {
    case baseURL = "https://newsapi.org/v2/"
    case articalListURL = "top-headlines?country=eg&apiKey=798fcc650755491e9c45a86221cbcf19"
}
