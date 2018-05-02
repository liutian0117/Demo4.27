//
//  ViewController.swift
//  demo
//
//  Created by liutian on 2018/4/27.
//  Copyright © 2018年 liutian. All rights reserved.
//

import UIKit

var courses = [["title":"《我们》","btntitle":"btntitle"],
               ["title":"陈奕迅","btntitle":"btntitle"],
               ["title":"该说的 别说了","btntitle":"btntitle"],
               ["title":"你懂得 就够了","btntitle":"btntitle"],
               ["title":"真的有 某一种悲哀","btntitle":"btntitle"],
               ["title":"连泪也不能流","btntitle":"btntitle"],
               ["title":"只能目送","btntitle":"btntitle"]]

var selectedCellIndexPath:IndexPath!

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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.cellTitle.translatesAutoresizingMaskIntoConstraints = false
        
        let textview = UITextView(frame: CGRect.zero)
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.textColor = UIColor.red
        textview.text = "创建各单元显示内容(创建参数indexPath指定的单元,UIDatePicker是一个控制器类,封装了UIPickerView,但是他是UIControl的子类"
        let item = courses[indexPath.row]
        cell.contentView.addSubview(textview)
        cell.cellTitle.text = item["title"]
        cell.cellButton.setTitle(item["btntitle"], for: .normal)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: false)
        selectedCellIndexPath = indexPath
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(selectedCellIndexPath != nil && selectedCellIndexPath == indexPath){
            return 140
        }
        return 60
    }

}

