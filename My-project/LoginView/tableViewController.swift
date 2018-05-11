//
//  tableViewController.swift
//  LoginView
//
//  Created by liutian on 2018/4/11.
//  Copyright © 2018年 liutian. All rights reserved.
//

import UIKit



class tableViewController:UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tableData = [["title":"《我们》","content":" ","image":"cyx-wm.jpg"],
                     ["title":"陈奕迅","content":" ","image":"cyx-wm.jpg"],
                     ["title":" ","content":"该说的 别说了","image":"cyx-wm.jpg"],
                     ["title":" ","content":"你懂得 就够了","image":"cyx-wm.jpg"],
                     ["title":" ","content":"真的有 某一种悲哀","image":"cyx-wm.jpg"],
                     ["title":" ","content":"连泪也不能流","image":"cyx-wm.jpg"],
                     ["title":" ","content":"只能目送","image":"cyx-wm.jpg"],
                     ["title":" ","content":"我最大的遗憾","image":"cyx-wm.jpg"],
                     ["title":" ","content":"是你的遗憾 与我有关","image":"cyx-wm.jpg"],
                     ["title":" ","content":"没有句点 已经很完美了","image":"cyx-wm.jpg"],
                     ["title":" ","content":"何必误会故事 没说完","image":"cyx-wm.jpg"],
                     ["title":" ","content":"还能做什么呢","image":"cyx-wm.jpg"],
                     ["title":" ","content":"我连伤感都是 奢侈的","image":"cyx-wm.jpg"],
                     ["title":" ","content":"我一想念 你就那么近","image":"cyx-wm.jpg"],
                     ["title":" ","content":"但终究 你都不能","image":"cyx-wm.jpg"],
                     ["title":" ","content":"陪我到 回不去的远方","image":"cyx-wm.jpg"],
                     ["title":" ","content":"原来我很快乐","image":"cyx-wm.jpg"],
                     ["title":" ","content":"只是不愿承认","image":"cyx-wm.jpg"],
                     ["title":" ","content":"在我怀疑 世界时","image":"cyx-wm.jpg"],
                     ["title":" ","content":"你给过我 答案","image":"cyx-wm.jpg"],
                     ["title":" ","content":"我感觉到幸福","image":"cyx-wm.jpg"],
                     ["title":" ","content":"是看见你幸福","image":"cyx-wm.jpg"],
                     ["title":" ","content":"曾经亲手把时间变慢","image":"cyx-wm.jpg"],
                     ["title":" ","content":"可惜我们没有等 我们","image":"cyx-wm.jpg"]]
            
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //创建一个复用的单元格
        //注册tableview的单元格xib
        self.tableView!.register(UINib(nibName: "ImageCell", bundle: nil), forCellReuseIdentifier: "ImageCell")
        //设置右侧按钮为编辑模式按钮
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        //设置estimatedRowHeight属性默认值
        // self.tableView.estimatedRowHeight = 44.0;
        //rowHeight属性设置为UITableViewAutomaticDimension
        //  self.tableView.rowHeight = UITableViewAutomaticDimension
        //表格在编辑状态下允许多选
        //tableView.allowsSelectionDuringEditing = true
        //获取所有选中的行
        //tableView.indexPathsForSelectedRows
        self.view.addSubview(self.tableView!)
    }
    
    //编辑模式按钮改变
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        tableView.setEditing(editing, animated: true)
        if self.isEditing{
            self.editButtonItem.title = "完成"
        }else{
            self.editButtonItem.title = "编辑"
        }
    }
    
    //返回编辑样式
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ImageCell = tableView.dequeueReusableCell(withIdentifier: "ImageCell") as! ImageCell
        let item = tableData[indexPath.row]
//       cell.normalLabel.text = item["title"]
//        cell.contentLabel.text = item["content"]
//       cell.normalIamge.image =
//            UIImage(named:item["image"]!)
        
      cell.refleshUI(image: UIImage(named:item["image"] ?? "" )!, titleLabel: item["title"] ?? "" , contentLabel: item["content"] ?? "" )

        return cell
    }
    
//        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return 100
//        }
    
    //动态预估行高
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    //移动 cell 时触发
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let content = self.tableData[sourceIndexPath.row]
        self.tableData.remove(at: sourceIndexPath.row)
        self.tableData.insert(content, at: destinationIndexPath.row)
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        
        //tableview cell滑动的时候有一条细线 解决方法：在sb中开启允许多选：Editing:Multiple Selection During Editing
        return UITableViewCellEditingStyle(rawValue: UITableViewCellEditingStyle.insert.rawValue | UITableViewCellEditingStyle.delete.rawValue)!
    }
    
    //排序方法代理
    //- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    //}
    
    //点击 cell 时触发
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let ctID = UIStoryboard(name: "SecondTable", bundle: nil)
        let ctvc = ctID.instantiateViewController(withIdentifier: "SecondTable") as! SecondTable
        self.navigationController?.pushViewController(ctvc, animated: true)
    }
    
//        let item = tableData[indexPath.row]
//        detailvc.jj = UIImage(named: item ["image"] ?? "" )
//        self.present(ctvc, animated: true, completion: nil)
        //self.navigationController?.dismiss(animated: true, completion: nil)
    //    //右滑按钮title
    //    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
    //        return "删除"
    //    }
    //    //执行删除操作
    //    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    //        if editingStyle == UITableViewCellEditingStyle.delete
    //        {
    //            self.tableData.remove(at: indexPath.row)
    //            self.tableView!.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
    //        }
    //    }
    
    
    //设置 cell 是否允许移动

}






