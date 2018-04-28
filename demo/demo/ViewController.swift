//
//  ViewController.swift
//  demo
//
//  Created by liutian on 2018/4/27.
//  Copyright © 2018年 liutian. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var courses = [["title":"逆战逆战来也","btntitle":"我明白"],["title":"王牌要狂野","btntitle":"太放不开"]]
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        self.tableView!.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier:  "TableViewCell") as! TableViewCell
        let item = courses[indexPath.row]
        cell.cellTitle.text = item["title"]
        cell.cellButton.setTitle(item["btntitle"], for: .normal)
        
        return cell
    }
    
}

