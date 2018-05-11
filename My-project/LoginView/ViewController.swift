//
//  ViewController.swift
//  LoginView
//
//  Created by liutian on 2018/4/10.
//  Copyright © 2018年 liutian. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITextFieldDelegate{
    
    // 控件声明 绑定布局
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var user: UILabel!
    @IBOutlet weak var userTest: UITextField!
    @IBOutlet weak var password: UILabel!
    @IBOutlet weak var passwordTest: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet var loginview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // userTest.placeholder = "手机号或邮箱"
        // userTest.contentVerticalAlignment = .center
        // passwordTest.placeholder = "请输入登录密码"
        // 输入内容会变成小黑点（密码输入属性）
        passwordTest.isSecureTextEntry = true
        // passwordTest.contentVerticalAlignment = .center
        
        //设置数据源代理
        userTest.delegate = self
        passwordTest.delegate = self
        button.layer.cornerRadius = 10
        
    }
    // 设置登录按钮点击事件，通过sb和vc的name及identifiter跳转到指定页面
    @IBAction func loginButtonClick(_ sender: Any) {
        let tableViewID =   UIStoryboard(name: "tableViewController", bundle: nil)
        let tableViewvc =   tableViewID.instantiateViewController(withIdentifier: "tableViewController")
        //self.navigationController?.present(tableViewvc, animated: true, completion: nil)
        self.navigationController?.pushViewController(tableViewvc, animated: true)
    }
    //    实现textField的监听方法，使账号密码的长度符合要求（6-10位）的时候button才可用。
    //    注释 range：    UITextField控件中光标选中的字符串，即被替换的字符串；
    //        range.length为0时，表示在位置range.location插入string。
    //        string：    替换字符串；
    //        tring.length为0时，表示删除。
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        guard let text = userTest.text else{
            return true
        }
        guard let text2 = passwordTest.text else{
            return true
        }
        let textLength = ((text.lengthOfBytes(using: String.Encoding.utf8)) - (range.length) + string.lengthOfBytes(using: String.Encoding.utf8))
        let passwordLength = ((text2.lengthOfBytes(using: String.Encoding.utf8)) - (range.length) + string.lengthOfBytes(using: String.Encoding.utf8))
        if textLength <= 10 && textLength >= 6{
            if passwordLength <= 10 && passwordLength >= 6
            {
                button.isEnabled = true
                self.button.alpha = 1
                button.backgroundColor = UIColor.orange
            } else {
                button.isEnabled = false
                self.button.alpha = 0.4
                button.backgroundColor = UIColor.gray
            }
        } else {
            button.isEnabled = false
            self.button.alpha = 0.4
            button.backgroundColor = UIColor.gray
        }
        return true
        
    }
    
    
    
}

