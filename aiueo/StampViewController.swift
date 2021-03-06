//
//  StampViewController.swift
//  aiueo
//
//  Created by 兼子友花 on 2017/06/14.
//  Copyright © 2017年 兼子友花. All rights reserved.
//

import UIKit
import RealmSwift
class StampViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDataSource,UITableViewDelegate {

  
    
    @IBOutlet var table: UITableView!
    @IBOutlet var imageView: UIImageView!
    var stampArray: [Stamp] = []
    

    //Edit.storyboardに反映させる
    static func instantiate() -> UINavigationController {
        let controller = UIStoryboard(name: "Edit", bundle: nil).instantiateInitialViewController()
        as! UINavigationController
        
        return controller
    }
    
    @IBOutlet var collectionView: UICollectionView!
    
    let imageNameArray:[String] = ["StampDemo.jpeg","StampDemo2.jpg","StampDemo3.jpeg","note.jpeg","school.jpeg"]
    
    
    @IBAction func Back() {
        self.dismiss(animated: true, completion: nil)
        
    }

    fileprivate let cellMargin: CGFloat = 9.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm()
        stampArray = realm.objects(Stamp.self).map({$0})

        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNameArray.count
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           
        // stampArray.remove(at: indexPath.row）←stampArrayからしかデータが消えない
            
        //データ上から消す
            let realm = try! Realm()
            
            try! realm.write {
                
                //realm.add(stamp)
                realm.delete(stampArray[indexPath.row])//indecPathは自分が選択したもの
                
            }
            stampArray.remove(at: indexPath.row) //←stampArrayを更新
            tableView.deleteRows(at: [indexPath], with: .fade)//cellを消す

        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
      //StampCollectionCellにimageNameArrayに入れた画像が表示できるようにする
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StampCollectionCell", for: indexPath) as! StampCollectionViewCell
        
        cell.stampImageView.image = UIImage(named: imageNameArray[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfMargin: CGFloat = 8.0
        let width: CGFloat = (collectionView.frame.size.width - cellMargin * numberOfMargin) / 7
        let height: CGFloat = width
        return CGSize(width: width, height: height)
    }
    
   //Segueの名前をつけて一緒に移動するimageNameArrayも移動させる
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToStampnameViewController", sender: imageNameArray[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return cellMargin
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return cellMargin
    }
    
    //Segueの名前がToStampViewControllerのときStampnameViewControllerにimagenameをおく
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToStampnameViewController" {
            let controller = segue.destination as! StampnameViewController
            controller.imageName = sender as! String
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stampArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StampTableCell") as! StampTableViewCell
        
        cell.label.text = stampArray[indexPath.row].categoryName
        cell.stampImageView.image = UIImage(named: stampArray[indexPath.row].categoryImageName)
        
        return cell
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */



