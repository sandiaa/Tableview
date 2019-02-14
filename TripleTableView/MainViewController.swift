//
//  MainViewController.swift
//  TripleTableView
//
//  Created by Admin on 19/12/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var tableView1: UITableView!
    @IBOutlet var lcTable1Width: NSLayoutConstraint!
    
    @IBOutlet var lcTable2Height: NSLayoutConstraint!
    @IBOutlet var lcTable2Width: NSLayoutConstraint!
    @IBOutlet var tableView2: UITableView!
    @IBOutlet var tableView3: UITableView!
    let studentsName = ["abc","def","hij","klm","hddd","dhdj","dnd","hdjgj","djbdk"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView1.tableFooterView = UIView()
        tableView2.tableFooterView = UIView()
        tableView3.tableFooterView = UIView()
        tableView1.register(UINib(nibName: "Table1Cell", bundle: nil), forCellReuseIdentifier: "Table1Cell")
          tableView2.register(UINib(nibName: "Table2Cell", bundle: nil), forCellReuseIdentifier: "Table2Cell")
          tableView3.register(UINib(nibName: "Table3Cell", bundle: nil), forCellReuseIdentifier: "Table3Cell")
        tableView1.delegate = self
        tableView1.dataSource = self
        tableView2.delegate = self
        tableView2.dataSource = self
        tableView3.delegate = self
        tableView3.dataSource = self
    }
   
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentsName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableView1{
            let  cell = tableView1.dequeueReusableCell(withIdentifier: "Table1Cell") as! Table1Cell
            
            return cell
        }
        else if tableView == tableView2 {
            let cell = tableView2.dequeueReusableCell(withIdentifier: "Table2Cell") as! Table2Cell
            return cell
        }
        else {
            let cell = tableView3.dequeueReusableCell(withIdentifier: "Table3Cell") as! Table3Cell
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView1.selectRow(at: indexPath, animated: false, scrollPosition: UITableView.ScrollPosition.none)
        tableView2.selectRow(at: indexPath, animated: false, scrollPosition: UITableView.ScrollPosition.none)
        tableView3.selectRow(at: indexPath, animated: false, scrollPosition: UITableView.ScrollPosition.none)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView == tableView1 {
            tableView2.contentOffset = tableView1.contentOffset
            tableView3.contentOffset = tableView1.contentOffset
        }
        else if scrollView == tableView2 {
            tableView1.contentOffset = tableView2.contentOffset
            tableView3.contentOffset = tableView2.contentOffset
        }
        
        else {
            tableView1.contentOffset = tableView3.contentOffset
            tableView2.contentOffset = tableView3.contentOffset
            scrollView.contentOffset = tableView3.contentOffset
        }
    }
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lcTable1Width.constant = view.frame.width/5
        lcTable2Width.constant = 1450
        lcTable2Height.constant = scrollView.frame.height
      //   scrollView.scrollsToTop = false
        view.layoutIfNeeded()
        
        
        scrollView.contentSize = CGSize(width: 1450, height: 0)
        scrollView.bounces = false
    }
    
}
