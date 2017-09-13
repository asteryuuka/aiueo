//
//  MonthViewController.swift
//  aiueo
//
//  Created by 兼子友花 on 2017/06/14.
//  Copyright © 2017年 兼子友花. All rights reserved.
//

import UIKit

class MonthViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet var collectionView:UICollectionView!
   
    
    fileprivate let cellMargin: CGFloat = 9.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
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
        return 31
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MonthCollectionCell", for: indexPath) as! MonthCollectionViewCell
        cell.label.text = String (indexPath.item + 1)
        
        return cell
    }
    
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfMargin: CGFloat = 8.0
        let width: CGFloat = (collectionView.frame.size.width - cellMargin * numberOfMargin) / 7
        let height: CGFloat = width 
        return CGSize(width: width, height: height)
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return cellMargin
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return cellMargin
    }

    
    @IBAction func Week() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func Year() {
        
    }
    
    @IBAction func keisan() {
        
    }

    //日付を選択したら選択したDayに移動する
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


