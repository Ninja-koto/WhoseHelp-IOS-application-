//
//  AllCollectionViewController.swift
//  PageMenuDemoStoryboard
//
//  Created by Saahil Chhabria on 24/12/15.
//  Copyright © 2015 CAPS. All rights reserved.
//

import UIKit
var tempTeacherArray = [Teachers]()
var subjectString:String!


class AllCollectionViewController: UICollectionViewController {
    var AllsubjectsArray = ["C","C++","Java","Web Development","IOS Development","Android Development"]
    var AllsubImageArray = [UIImage(named: "C"),UIImage(named: "C++"),UIImage(named: "Java"),UIImage(named: "Web Development"),UIImage(named: "IOS Development"),UIImage(named: "Android Developer")]
    var attributes = [
        NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSFontAttributeName: UIFont(name:"HelveticaNeue-Bold",size: 16)!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.registerNib(UINib(nibName: "MoodCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        let cellWidth = ((UIScreen.mainScreen().bounds.width) - 32 - 30 ) / 4
        let cellLayout = collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        cellLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
    }
    override func viewWillAppear(animated: Bool) {
        tempTeacherArray.removeAll()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return AllsubjectsArray.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell : MoodCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MoodCollectionViewCell
        
        // Configure the cell
        
        cell.backgroundImageView.image =  self.AllsubImageArray[indexPath.row]
        cell.moodTitleLabel.text = self.AllsubjectsArray[indexPath.row];
        return cell
    }
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cs = self.AllsubjectsArray[indexPath.row]
        subjectString = cs
        if (subjectString.isEmpty == false) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("newFormatTableViewController") as! NewFormatTableViewController
            self.navigationController?.pushViewController(vc, animated: true)
           
            }
        else {
            print("subject string empty")
        }
    }

}
