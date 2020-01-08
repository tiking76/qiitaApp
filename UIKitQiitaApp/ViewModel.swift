//
//  ViewModel.swift
//  UIKitQiitaApp
//
//  Created by 舘佳紀 on 2020/01/08.
//  Copyright © 2020 yoshiki Tachi. All rights reserved.
//
import UIKit
import Foundation

class QiitaViewModel {
    static func featchArticles(completion : @escaping ([DataFormat]) -> Swift.Void) {
        
        let url = "https://qiita.com/api/v2/items"
        
        guard var urlComponents = URLComponents(string: url)  else {
            return
        }
        
        //ここでitemの要素数の指定
        urlComponents.queryItems = [
            URLQueryItem(name: "per_page", value: "30")
        ]
        
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            guard let jsonData = data else{
                return
            }
            
            do{
                let articles = try JSONDecoder().decode([DataFormat].self, from: jsonData)
                completion(articles)
            }catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
