import UIKit

struct DataModel {
    var title: String?
    var cellType: String?
}

struct contentData{
    var name: String
    var items: [String]
    var showAll: Bool
    
    init(name: String, items: [String], showAll: Bool = false) {
        self.name = name
        self.items = items
        self.showAll = showAll
    }
}

class TableViewController: UITableViewController {
    
    var sections = [
        contentData(name: "Waiting For You", items: ["Jay: 你住的 巷子里 我租了一间公寓","为了想与你不期而遇","高中三年 我为什么","为什么不好好读书","没考上跟你一样的大学","我找了份工作 离你宿舍很近","当我开始学会做蛋饼","才发现你 不吃早餐","喔 你又擦肩而过","你耳机听什么 能不能告诉我"], showAll: false),
        contentData(name: "Waiting For You", items: ["合: 躺在你学校的操场看星空","教室里的灯还亮着你没走","记得 我写给你的情书","都什么年代了","到现在我还在写着","总有一天总有一年会发现","有人默默的陪在你的身边","躺在你学校的操场看星空","也许 我不该在你的世界","当你收到情书","也代表我已经走远"], showAll: false),
        contentData(name: "Waiting For You", items: ["Gary: 学校旁 的广场 我在这等钟声响","等你下课一起走好吗","Jay：弹着琴 唱你爱的歌 暗恋一点都不痛苦","（Gary：一点都不痛苦）","Jay：痛苦的是你","合：根本没看我"], showAll: false),
        contentData(name: "Waiting For You", items: ["Jay：我唱这么走心 却走不进你心里","（Gary：这么走心 进你心里）","Jay：在人来人往","合：找寻着你 守护着你 不求结局","Gary：喔 你又擦肩而过","（Jay：喔 而过）","Jay：我唱告白气球 终于你回了头"], showAll: false),
        contentData(name: "Waiting For You", items: ["合: 躺在你学校的操场看星空","教室里的灯还亮着你没走","记得 我写给你的情书","都什么年代了","到现在我还在写着","总有一天总有一年会发现","有人默默的陪在你的身边","躺在你学校的操场看星空","也许 我不该在你的世界","当你收到情书","也代表我已经走远"], showAll: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //去除尾部多余的空行
        self.title = "等你下课"
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.register(UINib(nibName: "NewTableViewCell", bundle: nil), forCellReuseIdentifier: "NewTableViewCell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return sections[section].items.count
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        通过结构体选择数组：
        //        let data = tableData[indexPath.row]
        //        if data.cellType == "cell1"{
        //
        //        }
        
        let cell:NewTableViewCell = tableView.dequeueReusableCell(withIdentifier: "NewTableViewCell") as! NewTableViewCell
        let item = sections[indexPath.section].items[indexPath.row]
        let textview:UILabel = cell.NewLabel
        textview.text = item
        
        return cell
    }
    

    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as?
            TableViewHeaderView ?? TableViewHeaderView(reuseIdentifier: "header")
        headerView.headerlabel.text = sections[section].name
        headerView.delegate = self
        headerView.section = section
        
        return headerView
    }
    //1添加手势如何传值 view传出来
    //2创建新的文件 用block回调 传值
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sections[indexPath.section].showAll ? 44.0 : 0
    }
}
extension TableViewController: TableViewHeaderDelegate{
    func toggleSection(_ header: TableViewHeaderView, section: Int) {
        let showAll = !sections[section].showAll
        sections[section].showAll = showAll
//        header.setCollapsed(showAll)
        tableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }
}









