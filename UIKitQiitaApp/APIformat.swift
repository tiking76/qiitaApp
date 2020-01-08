//
//  APIformat.swift
//  UIKitQiitaApp
//
//  Created by 舘佳紀 on 2020/01/08.
//  Copyright © 2020 yoshiki Tachi. All rights reserved.
//

import Foundation

struct DataFormat: Codable {
    var title : String
    var user : User
    var url : String
    struct User : Codable{
       var name : String
    }
}
