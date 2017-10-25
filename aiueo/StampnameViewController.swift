//
//  StampnameViewController.swift
//  aiueo
//
//  Created by 兼子友花 on 2017/06/14.
//  Copyright © 2017年 兼子友花. All rights reserved.
//

import UIKit
import RealmSwift

class StampnameViewController: UIViewController{
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var textField: UITextField!
    
    var imagename: String!
    
    
    @IBAction func kansei() {
        
     
      
        
        //何も名前をつけていない時に登録できないようにする
        if textField.text == "" {
            //Alert
            let alert = UIAlertController(title: "保存できません", message: "名前を入力して下さい", preferredStyle: .alert)
            //OK
            alert.addAction(
                UIAlertAction(title: "OK",
                              style:UIAlertActionStyle.default,
                              handler: { action in
                                print("OKボタン押した")
                }
                )
            )
            present(alert, animated: true, completion: nil)
            
        }else{
            
            let stamp: Stamp = Stamp()
            stamp.id = Stamp.lastId()
            stamp.categoryName = textField.text!
            stamp.stampImageName = "border.jpeg"
            
            let realm = try! Realm()
            
            try! realm.write {
                
                realm.add(stamp)
                
            }
            
            //Alert
            let alert = UIAlertController(title: "Success", message: "保存が完了しました", preferredStyle: .alert)
            //OK
            alert.addAction(
                UIAlertAction(title: "OK",
                              style:UIAlertActionStyle.default,
                              handler: { action in
                                print("OKボタン押した")
                }
                )
            )
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //imageViewの画像で選ばれたimagenameをUIImageに出す
        imageView.image = UIImage(named: imagename)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
