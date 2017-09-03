//
//  CommerceCollectionViewController.swift
//  WhoseHelp_git1
//
//  Created by Saahil Chhabria on 01/02/16.
//  Copyright © 2016 saahil chhabria. All rights reserved.
//

import UIKit



class CommerceCollectionViewController: UICollectionViewController {

    var commerceArray = ["Business Studies","Economics","Finance", "Accounts"]
    var commerceImage = [UIImage(named: "Business Studies"),UIImage(named: "Economics"),UIImage(named: "Finance"),UIImage(named: "Accounts")]
    var attributes = [
        NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSFontAttributeName: UIFont(name:"HelveticaNeue-Bold",size: 18)!
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
        return commerceArray.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell : MoodCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MoodCollectionViewCell
        
        // Configure the cell
        
        cell.backgroundImageView.image =  self.commerceImage[indexPath.row]
        cell.moodTitleLabel.text = self.commerceArray[indexPath.row];
        return cell
    }
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cs = self.commerceArray[indexPath.row]
        subjectString = cs
        if (subjectString.isEmpty == false) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("newFormatTableViewController") as! NewFormatTableViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
            //}
        }
        else {
            print("subject string empty")
        }
    }


}
