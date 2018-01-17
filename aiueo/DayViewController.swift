//
//  DayViewController.swift
//  aiueo
//
//  Created by 兼子友花 on 2017/06/14.
//  Copyright © 2017年 兼子友花. All rights reserved.
//

import UIKit
import Floaty
import RealmSwift

class DayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    var stampArray: [Stamp] = []
    var selectedStamp: Stamp?
    var isSelected: Bool = false //startTimeが設定されたらtrueになるため
    var startTime: Int = 0
    var endTime: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        // Do any additional setup after loading the view.
        
        //FloatyにstampArrayを読み込む
        let realm = try! Realm()
        //stampArrayとrealm
        stampArray = realm.objects(Stamp.self).map({$0})
        
        let floaty = Floaty()
        floaty.paddingY = 55
        for stamp in stampArray {
            floaty.addItem(stamp.categoryName, icon: UIImage(named: stamp.categoryImageName)! , handler: { (item) in
                //Dayの時間のところにおけるようにする
                self.selectedStamp = stamp
                print(stamp.categoryName)
                
            })
            self.view.addSubview(floaty)
        }
    }
    //Cellの行数を決める
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25

    }
    //Tableviewの中にDayTableCellを置いて文字を入れられるようにする
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DayTableCell") as! DayTableViewCell
        
        cell.label.text = String (indexPath.item)
         //もしindexPath.rowがstartTimeより大きくてendTimeより小さかったら画像を表示
        
        cell.stampImageView.image = UIImage(named: "StampDemo.jpeg")
        return cell
    }
    //cellを押した時
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //選択したcellを取得、stampImageViewを使うためにDayTableViewCell
        let cell = tableView.cellForRow(at: indexPath) as! DayTableViewCell
        
        if isSelected == false {
            isSelected = true
            startTime = indexPath.row
            print("startTime: \(startTime)")
            //選択したセルに画像を反映
            cell.stampImageView.image = UIImage(named: "StampDemo.jpeg")
        }else{
            endTime = indexPath.row
            print("endTime: \(endTime)")
            //スタートとエンドの間の画像を設定
            tableView.reloadData()
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func keisan() {
        
    }
  
    @IBAction func presentEdit() {
        let controller = StampViewController.instantiate()
        self.present(controller, animated: true, completion: nil)
    }
    
//    
//    func tableView(_ tableView: , didSelectRowAt indexPath: ) {
//        NSLog("",stampArray[indexPath.row])

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
