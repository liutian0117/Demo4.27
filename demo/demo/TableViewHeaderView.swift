//
//  TableViewHeaderVIew.swift
//  demo
//
//  Created by liutian on 2018/5/8.
//  Copyright © 2018年 liutian. All rights reserved.
//

import UIKit

protocol TableViewHeaderDelegate {
    func toggleSection(_ header: TableViewHeaderView, section: Int)
}


class TableViewHeaderView: UITableViewHeaderFooterView {
    
    var delegate: TableViewHeaderDelegate?
    var section: Int = 0
    
    let headerlabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor.lightGray
        headerlabel.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44)
        headerlabel.textColor = UIColor.white
        headerlabel.font = UIFont.systemFont(ofSize: 16)
        headerlabel.textColor = UIColor.white
        headerlabel.textAlignment = .center
        
        contentView.addSubview(headerlabel)

        self.isUserInteractionEnabled = true
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tapHeader(_:))))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func tapHeader(_ gestureRecognizer: UITapGestureRecognizer){
        guard let cell = gestureRecognizer.view as? TableViewHeaderView else{
            return
        }
        delegate?.toggleSection(self, section: cell.section)
    }
    
        func setCollapsed(_ collapsed: Bool) {
            //
            // Animate the arrow rotation (see Extensions.swf)
            //
            headerlabel.rotate(collapsed ? 0.0 : .pi / 2)
        }
}

//extension UIView {
//
//    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
//        let animation = CABasicAnimation(keyPath: "transform.rotation")
//
//        animation.toValue = toValue
//        animation.duration = duration
//        animation.isRemovedOnCompletion = false
//        animation.fillMode = kCAFillModeForwards
//
//        self.layer.add(animation, forKey: nil)
//}
//}
