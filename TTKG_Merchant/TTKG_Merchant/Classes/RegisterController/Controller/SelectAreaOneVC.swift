//
//  SelectAreaOneVC.swift
//  TTKG_Merchant
//
//  Created by yd on 16/8/3.
//  Copyright © 2016年 yd. All rights reserved.
//

import UIKit

class SelectAreaOneVC: UIViewController {

    var leftTableView = UITableView()
    var rightTableView = UITableView()
    var areaData : [ListData] = []
    var cityData : [ListCity] = [ ]
    
    var address = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("areaData=\(areaData.count)\(areaData.description)")
        setNavBar()
        self.edgesForExtendedLayout = UIRectEdge.None
        leftTableView = UITableView(frame: CGRect(x: 0, y: 0, width: screenWith/3, height: screenHeigh - 64), style: UITableViewStyle.Plain)
        leftTableView.delegate = self
        leftTableView.dataSource = self
        leftTableView.tag = 100
        leftTableView.registerNib(UINib(nibName: "SelectAreaCell", bundle: nil), forCellReuseIdentifier: "SelectAreaCell")
        self.view.addSubview(leftTableView)

        rightTableView = UITableView(frame: CGRect(x: leftTableView.frame.maxX, y: 0, width: screenWith - (screenWith/3), height: screenHeigh - 64), style: UITableViewStyle.Plain)
        rightTableView.delegate = self
        rightTableView.dataSource = self
        rightTableView.tag = 200
        rightTableView.registerNib(UINib(nibName: "SelectAreaCell", bundle: nil), forCellReuseIdentifier: "SelectAreaCell")
        self.view.addSubview(rightTableView)
    }
    
    func setNavBar(){
        
        
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 50/255, green: 133/255, blue: 255/255, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: UIBarButtonItemStyle.Plain, target: self, action: #selector(SelectAreaOneVC.backUpController))
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.whiteColor()
    }

    func backUpController(){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

extension SelectAreaOneVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 100 {
            return areaData.count
        }else {
            return self.cityData.count
        }
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if tableView.tag == 100 {
            let leftCell : SelectAreaCell = self.leftTableView.dequeueReusableCellWithIdentifier("SelectAreaCell", forIndexPath: indexPath) as! SelectAreaCell
            leftCell.nameText.text = self.areaData[indexPath.row].provincename
            return leftCell
        }else{
            let rightCell : SelectAreaCell = self.rightTableView.dequeueReusableCellWithIdentifier("SelectAreaCell", forIndexPath: indexPath) as! SelectAreaCell
            rightCell.nameText.text = self.cityData[indexPath.row].cityname
            
            return rightCell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("indexPath = \(indexPath.row)")
        
        if tableView.tag == 100 {
            
            self.cityData = self.areaData[indexPath.row].citys
            self.address = self.areaData[indexPath.row].provincename
            rightTableView.reloadData()
        }else {
            let selectAreaVC02 = SelectAreaTwoVC()
            self.address += self.cityData[indexPath.row].cityname
            selectAreaVC02.countrysData = self.cityData[indexPath.row].countrys
            selectAreaVC02.lastAddress = self.address
            self.navigationController?.pushViewController(selectAreaVC02, animated: true)
            
        }
        
        
    }
}





