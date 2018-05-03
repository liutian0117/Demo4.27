import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet weak var dueDateLabel: UILabel!
    
    //日期选择器显示状态
    var datePickerVisible:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "添加任务"
        //去除尾部多余的空行
        self.tableView.tableFooterView = UIView(frame:CGRect.zero)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //选择cell的row之后
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        //当执行到日期选择器上一行的时候，可以判断是否要显示日期选择器了
        if indexPath.section == 0 && indexPath.row == 1{
            if !datePickerVisible{
                self.showDatePicker()
            }else{
                self.hideDatePicker()
            }
        }
        
        print(indexPath.row)
    }
    
    //显示日期选择器
    func showDatePicker(){
        //日期选择器的状态设为打开
        datePickerVisible = true
        
        let indexPathDatePicker = IndexPath(row: 2, section: 0)
        self.tableView.insertRows(at: [indexPathDatePicker],
                                  with: .automatic)
        
    }
    
    //隐藏日期选择器
    func hideDatePicker(){
        if datePickerVisible {
            //日期选择器的状态设为关闭
            datePickerVisible = false
            let indexPathDatePicker = IndexPath(row: 2, section: 0)
            self.tableView.deleteRows(at: [indexPathDatePicker],
                                      with: .fade)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //设置cell
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //因为日期选择器的位置在日期显示Label下面。它的位置就是第2个section  和第3个row
        if indexPath.section == 0 && indexPath.row == 2{
            //用重用的方式获取标识为DatePickerCell的cell
            var cell = tableView.dequeueReusableCell(withIdentifier: "DatePickerCell")
                as UITableViewCell?
            //如果没找到就创建一个
            if cell == nil {
                //创建一个标识为DatePickerCell的cell
                cell = UITableViewCell(style: .default,
                                       reuseIdentifier: "DatePickerCell")
                //设置cell的样式
                cell?.selectionStyle = .none
                //创建日期选择器
                let datePicker = UIDatePicker(frame: CGRect(x:0, y:0, width:320,
                                                            height:216))
                //给日期选择器的tag
                datePicker.tag = 100
                //将日期选择器区域设置为中文，则选择器日期显示为中文
                datePicker.locale = Locale(identifier: "zh_CN")
                //将日期选择器加入cell
                cell?.contentView.addSubview(datePicker)
                //注意：action里面的方法名后面需要加个冒号“：”
                datePicker.addTarget(self, action:#selector(dateChanged(_:)),
                                     for: .valueChanged)
            }
            return cell!
        }else{
            return super.tableView(tableView, cellForRowAt: indexPath)
        }
    }
    
    //日期选择器响应方法
    @objc func dateChanged(_ datePicker: UIDatePicker){
        //更新提醒时间文本框
        let formatter = DateFormatter()
        //日期样式
        formatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        self.dueDateLabel.text = formatter.string(from: datePicker.date)
    }
    
    //根据日期选择器的隐藏与否决定返回的row的数量
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        
        if section == 0  && datePickerVisible{
            return 3
        }else{
            return super.tableView(tableView, numberOfRowsInSection: section)
            
        }
    }
    
    //因为日期选择器插入后会引起cell高度的变化，所以要重新设置
    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        //当渲染到达日期选择器所在的cell的时候将cell的高度设为217
        if indexPath.section == 0 && indexPath.row == 2{
            return 216.0
        }else{
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
    }
    
    //当覆盖了静态的cell数据源方法时需要提供一个代理方法。
    //因为数据源对新加进来的日期选择器的cell一无所知，所以要使用这个代理方法
    override func tableView(_ tableView: UITableView,
                            indentationLevelForRowAt indexPath: IndexPath) -> Int {
        if indexPath.section == 0 && indexPath.row == 2{
            //当执行到日期选择器所在的indexPath就创建一个indexPath然后强插
            let newIndexPath = IndexPath(row: 0, section: indexPath.section)
            return super.tableView(tableView, indentationLevelForRowAt: newIndexPath)
        }else{
            return super.tableView(tableView, indentationLevelForRowAt: indexPath)
        }
    }
}
