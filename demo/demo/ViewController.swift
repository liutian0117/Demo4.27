//
//  ViewController.swift
//  demo
//
//  Created by liutian on 2018/4/27.
//  Copyright © 2018年 liutian. All rights reserved.
//

import UIKit

var courses = [["title":"《我们》","btntitle":"us","content":" "],
               ["title":"陈奕迅","btntitle":"us","content":" "],
               ["title":"该说的 别说了","btntitle":"us","content":"你懂得 就够了"],
               ["title":"真的有 某一种悲哀","btntitle":"us","content":"连泪也不能流 只能目送"],
               ["title":"我最大的遗憾","btntitle":"us","content":"是你的遗憾 与我有关"],
               ["title":"没有句点 已经很完美了","btntitle":"us","content":"何必误会故事 没说完"],
               ["title":"还能做什么呢","btntitle":"us","content":"我连伤感都是 奢侈的"],
               ["title":"我一想念 你就那么近","btntitle":"us","content":"但终究 你都不能 陪我到 回不去的远方"],
               ["title":"原来我很快乐","btntitle":"us","content":"只是不愿承认"],
               ["title":"在我怀疑世界时","btntitle":"us","content":"你给过我答案"],
               ["title":"我最大的遗憾","btntitle":"us","content":"是你的遗憾 与我有关"],
               ["title":"没有句点 已经很完美了","btntitle":"us","content":"何必误会故事 没说完"],
               ["title":"还能做什么呢","btntitle":"us","content":"我连伤感都是 奢侈的"],
               ["title":"我一想念 你就那么近","btntitle":"us","content":"但终究 你都不能 陪我到 回不去的远方"],
               ["title":"原来我很快乐","btntitle":"us","content":"只是不愿承认"],
               ["title":"在我怀疑世界时","btntitle":"us","content":"你给过我答案"],
               ["title":"我感觉到幸福","btntitle":"us","content":"是看见你幸福"],
               ["title":"曾经亲手把时间变慢","btntitle":"end","content":"可惜我们没有等 我们"]]

var selectedCellIndexPaths:[IndexPath] = []

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        self.view.addSubview(self.tableView!)
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
        let item = courses[indexPath.row]
        let textview:UILabel = cell.contentLabel
        let button:UIButton = cell.cellButton
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.textColor = UIColor.black
        textview.text = item["content"]
        cell.contentView.addSubview(textview)
        cell.cellTitle.text = item["title"]
        cell.cellButton.setTitle(item["btntitle"], for: .normal)
        //button点击事件：touchdown（单次触摸）、touchDownRepeat（多次点击）、towchUpInside（触摸并抬起事件）
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        //自动遮罩不可见区域，超出的不显示
        cell.layer.masksToBounds = true
        return cell
    }
    //设置button点击事件
    @objc func buttonClick(){
        let sb = UIStoryboard(name: "TableViewController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "TableViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: false)
        if let index = selectedCellIndexPaths.index(of: indexPath){
            selectedCellIndexPaths.remove(at: index)
        }else{
            selectedCellIndexPaths.append(indexPath)
        }
        //强制改变高度
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
    }
    //点击单元格会引起cell高度的变化，所以要重新设置
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedCellIndexPaths.contains(indexPath){
            return 160
        }
        return 60
    }
    
}

