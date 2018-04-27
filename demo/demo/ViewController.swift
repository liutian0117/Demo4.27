//
//  ViewController.swift
//  demo
//
//  Created by liutian on 2018/4/27.
//  Copyright © 2018年 liutian. All rights reserved.
//

import UIKit

var courses = [["title":"a","btntitle":"btntitle"],["title":"","btntitle":"btntitle"],["title":"a","btntitle":"btntitle"],["title":"a","btntitle":"btntitle"],["title":"a","btntitle":"btntitle"],["title":"a","btntitle":"btntitle"]]



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        let item = courses[indexPath.row]
        cell.cellTitle.text = item["title"]
        cell.cellButton.label = item["btntitle"]
        return cell
    }
    
}

