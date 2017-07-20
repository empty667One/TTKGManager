//
//  LoginVC.swift
//  TTKG_Merchant
//
//  Created by yd on 16/8/1.
//  Copyright © 2016年 yd. All rights reserved.
//

import UIKit
import Alamofire

class LoginVC: UIViewController {
    var loginModel :TLoginModel!
    @IBOutlet var SecurityBtn: UIButton!
    @IBOutlet var UserTel: UITextField!
    
    @IBOutlet var UserPwd: UITextField!
    
    @IBOutlet var LoginBtn: UIButton!
    
    @IBOutlet var ForgotPwd: UIButton!
    
    @IBOutlet var RegisterBtn: UIButton!
    
    @IBAction func LookPwdBtn(sender: AnyObject) {
        if SecurityBtn.selected {
            UserPwd.secureTextEntry = true
            SecurityBtn.selected = !SecurityBtn.selected
        }else{
            UserPwd.secureTextEntry = false
            SecurityBtn.selected = !SecurityBtn.selected
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        UserPwd.secureTextEntry = true
        UserTel.addTarget(self, action: #selector(LoginVC.textFieldDidChange(_:)), forControlEvents: UIControlEvents.EditingChanged)
        UserPwd.tag = 100
        UserPwd.addTarget(self, action: #selector(LoginVC.textFieldDidChange(_:)), forControlEvents: UIControlEvents.EditingChanged)
        UserPwd.tag = 200
        //测试合并----------123456
    }
    
    @IBAction func LoginBtnClick(sender: AnyObject) {
        if CheckDataTools.checkForMobilePhoneNumber(UserTel.text!){
            
            if CheckDataTools.checkForPasswordWithShortest(6, longest: 12, pwd: UserPwd.text!){
                NSLog("点击了登录按钮")
                RequestForLogin(UserTel.text!, password: UserPwd.text!)
                
            }else{
                let alert = UIAlertView(title: "提示", message: "请输入6到12位有效密码", delegate: nil, cancelButtonTitle: "确定")
                alert.show()
            }
            
        }else{
            let alert = UIAlertView(title: "提示", message: "请输入正确的手机号", delegate: nil, cancelButtonTitle: "确定")
            alert.show()
        }
    }
    
    
    @IBAction func ForgotPwdClick(sender: AnyObject) {
    }
    
    @IBAction func RegisterBtnClick(sender: AnyObject) {
        
        let registerVC =  Register01()
        let nvc1 : UINavigationController = CustomNavigationBar(rootViewController: registerVC)
        
        self.presentViewController(nvc1, animated: false) { () -> Void in
            
        }
        
    }
    
    func textFieldDidChange(text:UITextField){
        if text.tag == 100 {
            self.UserTel.text = text.text
        }
        if text.tag == 200 {
            self.UserPwd.text = text.text
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    

}

extension LoginVC {
    
    func RequestForLogin(phone:String,password:String) {
        let url = serverUrl + "/merchant/login"
        let parameters = ["phone":phone,"password":password]
        Alamofire.request(.POST, url, parameters: parameters)
            .responseString { response -> Void in
                
                switch response.result {
                case .Success:
                    let dict:NSDictionary?
                    do {
                        dict = try NSJSONSerialization.JSONObjectWithData(response.data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
                    }catch _ {
                        dict = nil
                    }
                    NSLog("dict === \(dict?.allKeys)----\(dict?.allValues)")
                    self.loginModel = TLoginModel.init(fromDictionary: dict!)
                    self.view.dodo.style.bar.hideAfterDelaySeconds = 1
                    self.view.dodo.style.bar.locationTop = false
                    
                    if (self.loginModel.code == 0) {
                        self.view.dodo.success(self.loginModel.msg)
                        NSNotificationCenter.defaultCenter().postNotificationName("notifyControllerVC", object: nil)
                    }else{
                        self.view.dodo.error(self.loginModel.msg)
                    }
                    
                case .Failure(let error):
                    print(error)
                }
        }
        
    }
    
}


