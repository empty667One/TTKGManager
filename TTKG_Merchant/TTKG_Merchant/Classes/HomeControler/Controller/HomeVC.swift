//
//  HomeVC.swift
//  TTKG_Merchant
//
//  Created by yd on 16/7/29.
//  Copyright © 2016年 yd. All rights reserved.
//

import UIKit
import SnapKit

class HomeVC: UIViewController {

    
    //移除通知
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    var collection : UICollectionView!
    let layout = UICollectionViewFlowLayout()
    
    
    
    //数据接口api
    private var http = HomePageAPI.shareInstance
    
    var pushAD_Data:PushAD_Data!
    var scrollADDatas:[ScrollADData] = []
    var goodsBrandDatas:[GoodsBrandData] = []
    var goodsClassificationDatas:[GoodsClassificationData] = []
    var merchantInfoDatas:[MerchantInfoData] = []
    

    
    
    
    //隐藏状态栏
    override func prefersStatusBarHidden() -> Bool {
        return true;
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        createUI()
        
        //隐藏导航栏
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        //接受通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(HomeVC.HomePageModelChangedProcess), name: "HomePageModelChanged", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(HomeVC.HomePageAPI_SendErrorMsgProcess), name: "HomePageAPI_SendErrorMsg", object: nil)
        
        
        //下拉刷新
        collection.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(HomeVC.dropDownRef))
        
        //上拉加载更多
        self.collection.mj_footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: #selector(HomeVC.pullUpRef))
 
        //请求数据
        dropDownRef()

        
        print(NSUserDefaults.standardUserDefaults().objectForKey("userid"))
    }
    
    func createUI()  {
        

        collection = UICollectionView(frame: CGRect(x: 0 ,y:  0, width: screenWith, height: screenHeigh - 93), collectionViewLayout: layout)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        

        collection.backgroundColor = UIColor(red: 236 / 255, green: 237 / 255, blue: 239 / 255, alpha: 1)
//         collection.backgroundColor = UIColor.whiteColor()
        collection!.delegate = self
        collection!.dataSource = self
        
        
        self.view.addSubview(collection)
        
        collection.registerClass(HomeVCZeroCell.self, forCellWithReuseIdentifier: "ZeroCell")
        collection.registerClass(HomeVCFirstCell.self, forCellWithReuseIdentifier: "FirstCell")
        collection.registerClass(HomeVCSecondCell.self, forCellWithReuseIdentifier: "SecondCell")
        collection.registerNib(UINib(nibName: "HomeVCThirdCell" , bundle: nil), forCellWithReuseIdentifier: "ThirdCell")
        
        collection.registerClass(HomeVCHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "zero_headView")
        collection.registerClass(HomeVCFirstHeaderView.self, forSupplementaryViewOfKind:UICollectionElementKindSectionHeader , withReuseIdentifier: "firstHeaderView")
        
        collection.registerClass(HomeVCSecondHeaderView.self, forSupplementaryViewOfKind:UICollectionElementKindSectionHeader , withReuseIdentifier: "secondHeaderView")
        
        collection.registerClass(HomeVCFooterView.self, forSupplementaryViewOfKind:UICollectionElementKindSectionFooter , withReuseIdentifier: "footerView")
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    //下拉刷新
    func dropDownRef() {
        
        http.requestDefaultDataFromServer(5, areaid: 6)
        
        
    }
    
    //上拉加载更多
    func pullUpRef()  {
        
        print("上拉加载更多")

        http.requestMoreMerchantData(5)
        self.collection.mj_footer.endRefreshing()
    }
    
    //收到通知就可以调用getHomePageDataFromModel获取数据
    func HomePageModelChangedProcess() {
        
 
        self.collection.mj_header.endRefreshing()
        
        let (pushAD_DataTemp,scrollADDatasTemp,goodsBrandDatasTemp,goodsClassificationDatasTemp,merchantInfoDatasTemp) = http.getHomePageDataFromModel()
        
        if let temp  = pushAD_DataTemp {
            
            self.pushAD_Data = temp
           
            print(pushAD_Data.picurl)
        }
        
        if let temp = scrollADDatasTemp {
            
            
            self.scrollADDatas = temp
            print("scrollADDatas = \(temp)")
        }
        if  let temp = goodsBrandDatasTemp {
            
           
            self.goodsBrandDatas =  temp
           
        }
        
        if let temp = goodsClassificationDatasTemp {
            
           
            self.goodsClassificationDatas = temp
        }
        if let temp  = merchantInfoDatasTemp {
            
           self.merchantInfoDatas = temp
           print("merchantInfoDatas = \(temp)")
            
           
        }
        
        self.collection.reloadData()
        

        
        
    }
    
    //显示错误信息，停止上下拉
    func HomePageAPI_SendErrorMsgProcess(){
        
        
    }

}



extension HomeVC :  UICollectionViewDataSource{
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 4
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 1{
            
            return goodsClassificationDatas.count
        }
        if section == 2{
            
            return goodsBrandDatas.count
        }
        if section == 3{
            
//            return merchantInfoDatas.count
            return 3
            
        }else{
            
            return 1
        }
        
}
    
    //设置cell内容
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        if indexPath.section == 0 {
            let cellZero : HomeVCZeroCell = self.collection.dequeueReusableCellWithReuseIdentifier("ZeroCell", forIndexPath: indexPath) as! HomeVCZeroCell
            
            cellZero.backgroundColor = UIColor.whiteColor()
            
            return cellZero
        }
        
        if indexPath.section == 1{
            let cellFirst : HomeVCFirstCell = self.collection.dequeueReusableCellWithReuseIdentifier("FirstCell", forIndexPath: indexPath) as! HomeVCFirstCell
            
            cellFirst.backgroundColor = UIColor.whiteColor()
            
            
            let (name,img) = goodsClassificationDatas[indexPath.row].ex_dataForCellShow()
            
            cellFirst.nameStr = name
            
            cellFirst.iconUrl = img
            
            
            return cellFirst
            
        }
        if indexPath.section == 2{
            let cellSecond : HomeVCSecondCell = self.collection.dequeueReusableCellWithReuseIdentifier("SecondCell", forIndexPath: indexPath) as! HomeVCSecondCell
            
            cellSecond.backgroundColor = UIColor.whiteColor()
            
            let (name, img) = goodsBrandDatas[indexPath.row].ex_ex_dataForCellShow()
            
            cellSecond.name.text = name
            cellSecond.iconUrl = img
            
            return cellSecond
        }else{
            
            let cellThird : HomeVCThirdCell = self.collection.dequeueReusableCellWithReuseIdentifier("ThirdCell", forIndexPath: indexPath) as! HomeVCThirdCell
            
            cellThird.backgroundColor = UIColor.whiteColor()
            
            return cellThird
        }
    }
    
}


extension HomeVC : UICollectionViewDelegate{
    
    func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
       
        if indexPath.section == 0 {
            return false
        }

        return true
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.section == 0 {
            
            print("点击按钮")
        }
        if indexPath.section == 1 {
            
            let num  = indexPath.row
            print("点击了分类\(num)")
        }
        if indexPath.section == 2{
            
            let num  = indexPath.row
            print(num)
            print("点击了品牌\(num)")
        }
    }
    
    
}


extension HomeVC : UICollectionViewDelegateFlowLayout{
    
    //设置头部／尾部视图
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        
        switch kind {
            
        //头部视图
        case UICollectionElementKindSectionHeader:
            if indexPath.section == 0{
                let headerView : HomeVCHeaderView = collection.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "zero_headView", forIndexPath: indexPath) as! HomeVCHeaderView
                
                return headerView
            }
            if indexPath.section == 1{
                let headerView1 : HomeVCFirstHeaderView = collection.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "firstHeaderView", forIndexPath: indexPath) as! HomeVCFirstHeaderView
                
                headerView1.picurl = self.pushAD_Data.picurl
         
                return headerView1
            }
            if indexPath.section == 2 {
                let headerView2 : HomeVCSecondHeaderView = collection.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "secondHeaderView", forIndexPath: indexPath) as! HomeVCSecondHeaderView
                
                //富文本设置
                let attributeString = NSMutableAttributedString(string:"快购品牌")
                
                //设置字体颜色
                attributeString.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(),
                                             range: NSMakeRange(2, 2))
                
               headerView2.titleLabel.attributedText = attributeString

                headerView2.backgroundColor = UIColor(red: 236 / 255, green: 237 / 255, blue: 239 / 255, alpha: 1)
                return headerView2
                
            }else{
                
                let headerView3 : HomeVCSecondHeaderView = collection.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "secondHeaderView", forIndexPath: indexPath) as! HomeVCSecondHeaderView
                
                headerView3.titleLabel.text = "金牌配送商"
                
                headerView3.backgroundColor = UIColor(red: 236 / 255, green: 237 / 255, blue: 239 / 255, alpha: 1)
                return headerView3
            }
        //尾部视图
        case UICollectionElementKindSectionFooter:
            if indexPath.section == 1{
                
                let footerView1 : HomeVCFooterView = collection.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "footerView", forIndexPath: indexPath) as! HomeVCFooterView
                
                footerView1.picurl = self.pushAD_Data.picurl
                
                return footerView1
            }
            if indexPath.section == 2{
                
                let footerView2 : HomeVCFooterView = collection.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "footerView", forIndexPath: indexPath) as! HomeVCFooterView
                
                footerView2.picurl = self.pushAD_Data.picurl
                
                return footerView2
            }else{
                
                return UICollectionReusableView()
            }
            
        default:
            return UICollectionReusableView()
        }

        
    }
    
    //设置item的高度
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        
        if  indexPath.section == 0 {
            let size0 = CGSize(width: screenWith , height: 70)
            return size0
        }
        
        if indexPath.section == 1{
            let size1 = CGSize(width: (screenWith - 3) / 4, height: 150)
            return size1
        }
        if indexPath.section == 2 {
            let size2 = CGSize(width: (screenWith - 3) / 4, height: 100)
            return size2
        }else {
            let size3 = CGSize(width: screenWith, height: 300)
            
            
            return size3
        }
    }
    
    //设置每行间隔
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        if section == 3{
            return 5
        }
        
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        if section == 0{
            
            return 8
        }
        
        return 1
    }
    
    
    //    设置头部视图高度
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 0{
            let size = CGSize(width: screenWith , height: screenWith / 2 + 50)
            return size
        }
        if section == 1 {
            
            guard self.pushAD_Data == nil else{
                let size1 = CGSize(width: screenWith, height: screenWith / 2 - 70)
                return size1
            }
            return CGSizeZero
            
        }else{
            
            let size2 = CGSize(width: screenWith, height: 40)
            return size2
            
        }
        
    }
    
    // 设置尾部视图高度
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        if section == 1 {
            
            guard self.pushAD_Data == nil else{
                let size1 = CGSize(width: screenWith, height: screenWith / 2 - 70)
                return size1
            }
            return CGSizeZero
            
        }
        if section == 2{
            
            guard self.pushAD_Data == nil else{
                let size1 = CGSize(width: screenWith, height: screenWith / 2 - 70)
                return size1
            }
            return CGSizeZero
            
        }else{
            return CGSizeZero
        }
        
    }
    
    

    
}




