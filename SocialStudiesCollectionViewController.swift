//
//  SocialStudiesCollectionViewController.swift
//  PageMenuDemoStoryboard
//
//  Created by Saahil Chhabria on 21/12/15.
//  Copyright © 2015 CAPS. All rights reserved.
//

import UIKit


class SocialStudiesCollectionViewController: UICollectionViewController {
    var SocialsubjectsArray = ["History","Geography","Civics"]
    var SocialsubImageArray = [UIImage(named: "History"),UIImage(named: "Geography"),UIImage(named: "Civics")]
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.SocialsubjectsArray.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell : MoodCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MoodCollectionViewCell
        
        // Configure the cell
        cell.backgroundImageView.image =  self.SocialsubImageArray[indexPath.row]
        cell.moodTitleLabel.text = self.SocialsubjectsArray[indexPath.row];
        
        return cell
    }
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cs = self.SocialsubjectsArray[indexPath.row]
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
