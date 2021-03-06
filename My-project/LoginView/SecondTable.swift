//
//  SecondTable.swift
//  LoginView
//
//  Created by liutian on 2018/4/20.
//  Copyright © 2018年 liutian. All rights reserved.
//

import UIKit



class SecondTable:UIViewController {
    
    

    @IBOutlet weak var SecondTable: UITableView!
    
    @IBOutlet weak var BackButton: UIButton!
    var stData = ["           パスワード:","パスワード(確認):"]
    var block: textBlock?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.SecondTable.rowHeight = 60
        self.SecondTable.backgroundColor = UIColor.lightGray
        self.SecondTable!.register(UINib(nibName: "SecondTableCell", bundle: nil), forCellReuseIdentifier: "SecondTableCell")
        self.SecondTable.delegate = self
        self.SecondTable.dataSource = self
    }
    
    @IBAction func BackButtonClick(_ sender: Any) {
//        let stc = SecondTableCell()
        
//        let tf = SecondTable.viewWithTag(1000) as! UITextField
        self.navigationController?.popViewController(animated: true)
    }
}
extension SecondTable:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("SecondHeaderView", owner: nil, options: nil)?[0] as! SecondHeaderView
        headerView.HeaderLabel.text = "新規ユーザー登録"
        headerView.HeaderLabel.font = UIFont.systemFont(ofSize: 12)
        headerView.HeaderLabel.backgroundColor = UIColor.lightGray
        headerView.HeaderLabel.textColor = UIColor.white
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
           let footerView = Bundle.main.loadNibNamed("SecondHeaderView", owner: nil, options: nil)?[0] as! SecondHeaderView
        footerView.HeaderLabel.text = "ログインアカウントの有効期間に限りがある\nシステムは15日保存されます"
        footerView.HeaderLabel.font = UIFont.systemFont(ofSize: 12)
        footerView.HeaderLabel.numberOfLines = 2
        footerView.HeaderLabel.backgroundColor = UIColor.lightGray
        footerView.HeaderLabel.textColor = UIColor.white
        return footerView
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SecondTableCell = tableView.dequeueReusableCell(withIdentifier: "SecondTableCell") as! SecondTableCell
        let item = stData[indexPath.row]
        cell.SecondTableLabel.text = item
        cell.SecondTableTextField.tag = indexPath.row
        cell.block = { text, tag in
            if tag == 0 {
                print(text)
                self.title = text
            } else {
                self.BackButton.setTitle(text, for: .normal)
            }
        }
        return cell
    }
    
}
