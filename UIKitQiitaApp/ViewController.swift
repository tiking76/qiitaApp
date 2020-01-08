//
//  ViewController.swift
//  UIKitQiitaApp
//
//  Created by 舘佳紀 on 2020/01/08.
//  Copyright © 2020 yoshiki Tachi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var tableView = UITableView()
    fileprivate var articles : [DataFormat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "QiitaAPI"
        
        tableView.dataSource = self
        tableView.frame = view.frame
        //ここで新しいViewを追加
        view.addSubview(tableView)
        QiitaViewModel.featchArticles(completion: { (article) in
            self.articles = article
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController : UITableViewDataSource {
    
    //要素の挿入
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let article = articles[indexPath.row]
        cell.textLabel?.text = article.title
        //cell.detailTextLabel?.text = article.user.name
        cell.detailTextLabel?.text = article.url
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
}

