import UIKit

struct DataModel {
    var title: String?
    var cellType: String?
}


class TableViewController: UITableViewController {

    var HiddenCells:Bool = false
    
    var tableData = [["content":"该说的 别说了"],
                     ["content":"你懂得 就够了"]]
    
//    var tableData = [DataModel(title: "jhgjhgj", cellType: "cell1"),DataModel(title: "jhgjhgj", cellType: "cell1")]

    override func viewDidLoad() {
        super.viewDidLoad()
        //去除尾部多余的空行
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.register(UINib(nibName: "NewTableViewCell", bundle: nil), forCellReuseIdentifier: "NewTableViewCell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 && HiddenCells{
            return 4
        }else{
            return 2
        }
       
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        通过结构体选择数组：
//        let data = tableData[indexPath.row]
//        if data.cellType == "cell1"{
//
//        }
            let cell:NewTableViewCell = tableView.dequeueReusableCell(withIdentifier: "NewTableViewCell") as! NewTableViewCell
            let item = tableData[indexPath.row]
            let textview:UILabel = cell.NewLabel
            textview.text = item["content"]
            return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 1{
            if HiddenCells == false{
                showHiddenCells()
            }else{
                killHiddenCells()
            }
        }
        print(indexPath.row)
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 44))
        let headerlabel:UILabel = UILabel(frame: headerView.bounds)
        headerlabel.textColor = UIColor.white
        headerlabel.font = UIFont.systemFont(ofSize: 16)
        headerlabel.text = "页眉"
        headerView.addSubview(headerlabel)
        headerView.backgroundColor = UIColor.black
        
        return headerView
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }

    func showHiddenCells(){
        HiddenCells = true
        let indexMaker = IndexPath(row: 2, section: 0)
        let indexMaker2 = IndexPath(row: 3, section: 0)
        tableData.append(["content":"真的有 某一种悲哀"])
        tableData.append(["content":"连泪也不能流 只能目送"])
        self.tableView.insertRows(at: [indexMaker,indexMaker2], with: .automatic)
    }

    func killHiddenCells(){
        HiddenCells = false
        let indexMaker = IndexPath(row: 2, section: 0)
        let indexMaker2 = IndexPath(row: 3, section: 0)
        self.tableView.deleteRows(at: [indexMaker,indexMaker2], with: .fade)
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 2 {
            return 44.0
        }else{
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
    }
    override func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        if indexPath.section == 0 && indexPath.row == 2 {
            let newIndexPath = IndexPath(row: 0, section: indexPath.section)
            return super.tableView(tableView, indentationLevelForRowAt: newIndexPath)

        }else{
            return super.tableView(tableView, indentationLevelForRowAt: indexPath)
        }
    }
    
    
    
    
}

    
    
    
    
    
    
    

