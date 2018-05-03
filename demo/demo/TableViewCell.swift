//
//  TableViewCell.swift
//  demo
//
//  Created by liutian on 2018/4/27.
//  Copyright © 2018年 liutian. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellButton: UIButton!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func Action(_ sender: Any) {
        let mainSb = UIStoryboard(name: "ViewController", bundle: nil)
        let mainVc = mainSb.instantiateViewController(withIdentifier: "ViewController")
        let sb = UIStoryboard(name: "TableViewController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "TableViewController")
        mainVc.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
