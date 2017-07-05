//
//  DayViewController.swift
//  aiueo
//
//  Created by 兼子友花 on 2017/06/14.
//  Copyright © 2017年 兼子友花. All rights reserved.
//

import UIKit

class DayViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var table:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DayTableCell") as! DayTableViewCell
    
        cell.label.text = String (indexPath.item)
       
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Month() {
        
    }
    
    @IBAction func Year() {
        
    }
    
    @IBAction func keisan() {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
