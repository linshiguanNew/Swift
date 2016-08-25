//
//  ViewController.swift
//  Swift - UITableView
//
//  Created by xuyangbo on 16/6/3.
//  Copyright © 2016年 xuyangbo. All rights reserved.
//
/*
 1.创建全局实例可以自己创建
 2.单元格的初始化cell为可选值，text的值为可选值，返回的cell必须解析
 3.commitStytle 和 左划的风格字体
 4.hasPrefix为包含哪个字体的开头
 */
import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{

    let tabletView = UITableView()
    var dataArray : [String] = []
    let seachBar = UISearchBar()
    var seachText : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabletView.frame = CGRect(x: 0, y: 64, width: UIScreen.mainScreen().bounds.size.width, height: UIScreen.mainScreen().bounds.size.height - 64)
        tabletView.delegate = self
        tabletView.dataSource = self
        dataArray = ["11111","22222","33333","11111111","222222222222","333333","333333333333","44444","444444444444","555","666666666","6666666666666","77777","777777777","2222222","8888888","99999999","000000","99999999999","99","555","111"]
        seachText = dataArray
        self.view.addSubview(tabletView)
        
        
        seachBar.frame = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.size.width, height: 64)
        seachBar.barStyle = .Default
        seachBar.delegate = self
        self.view.addSubview(seachBar)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seachText.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let ID = "cell"
        
        var cell = tabletView.dequeueReusableCellWithIdentifier(ID)
        
        if cell == nil {
        
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: ID)
        
        }
        cell?.textLabel?.text = seachText[indexPath.row]
        return cell!
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 64
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        self.seachText.removeAtIndex(indexPath.row)
        self.tabletView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
    }

    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "删除"
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tabletView.endEditing(true)
        print("选中了第\(indexPath.row)行")
    }
    
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == " "{
        
        self.seachText = self.dataArray
            
        }else{
        
            self.seachText = []
            
            for str in dataArray{
            
                if str.hasPrefix(searchText){
                
                    self.seachText.append(str)
                
                }
            
            }
            
        }
        self.tabletView.reloadData()
    }
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        seachBar.resignFirstResponder()
    }
}

