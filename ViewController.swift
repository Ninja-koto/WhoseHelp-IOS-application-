//
//  ViewController.swift
//  PageMenuDemoStoryboard
//
//  Created by Saahil Chhabria on 12/21/15.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

import UIKit
import MapKit
var  tranferLocation:CLLocation!
var latitiudeInitial:String!
var longitiudeInitial:String!
class ViewController: UIViewController {
    
    var pageMenu : CAPSPageMenu?
    var manager: OneShotLocationManager?
    
    //new
    override func viewDidAppear(animated: Bool) {
        subjectString = nil
        filterActive = false
        self.navigationController?.hidesBarsOnSwipe = false
    }
    override func viewDidLoad() {
        // MARK: - UI Setup
        self.title = "Subjects"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 22.0/255.0, green: 70.0/255.0, blue: 129.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.hidesBarsOnSwipe = false
        // MARK: - Google Maps User Location Set Up
        manager = OneShotLocationManager()
        var oringinalString:String!
        manager!.fetchWithCompletion {location, error in
            // fetch location or an error
            if let latitude = location {
                oringinalString = "\(latitude)"
                print(oringinalString)
                latitiudeInitial = oringinalString.substringWithRange(Range<String.Index>(start: oringinalString.startIndex.advancedBy(2), end: oringinalString.endIndex.advancedBy(-100)))
//                print(latitiudeInitial)
                longitiudeInitial = oringinalString.substringWithRange(Range<String.Index>(start: oringinalString.startIndex.advancedBy(15), end: oringinalString.endIndex.advancedBy(-88)))
//                print(longitiudeInitial)
            } else if let err = error {
                print(err.localizedDescription)
            }
            self.manager = nil
        }
        subjectString = nil
        filterActive = false
        self.navigationController?.hidesBarsOnSwipe = false
       

        
        // Initialize view controllers to display and place in array
        var controllerArray : [UIViewController] = []
        
        let controller0 : AllCollectionViewController = AllCollectionViewController(nibName: "TestCollectionViewController", bundle: nil)
        controller0.title = "Computer"
        controllerArray.append(controller0)
        
        let controller1 : TestCollectionViewController = TestCollectionViewController(nibName: "TestCollectionViewController", bundle: nil)
        controller1.title = "Science"
        controllerArray.append(controller1)
        let controller2 : LanguagesCollectionViewController = LanguagesCollectionViewController(nibName: "TestCollectionViewController", bundle: nil)
        controller2.title = "Languages"
        controllerArray.append(controller2)
        let controller3 : MusicCollectionViewController = MusicCollectionViewController(nibName: "TestCollectionViewController", bundle: nil)
        controller3.title = "Music"
        controllerArray.append(controller3)
        let controller4 : SocialStudiesCollectionViewController = SocialStudiesCollectionViewController(nibName: "TestCollectionViewController", bundle: nil)
        controller4.title = "Social"
        controllerArray.append(controller4)
        let controller5 : CommerceCollectionViewController = CommerceCollectionViewController(nibName: "TestCollectionViewController", bundle: nil)
        controller5.title = "Commerce"
        controllerArray.append(controller5)
        
        // Customize menu (Optional)
        let parameters: [CAPSPageMenuOption] = [
            .ScrollMenuBackgroundColor(UIColor(red: 22.0/255.0, green: 70.0/255.0, blue: 129.0/255.0, alpha: 1.0)),
            .ViewBackgroundColor(UIColor(red: 246.0/255.0, green: 246.0/255.0, blue: 246.0/255.0, alpha: 1.0)),
            .SelectionIndicatorColor(UIColor.whiteColor()),
            .BottomMenuHairlineColor(UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 80.0/255.0, alpha: 1.0)),
            .MenuItemFont(UIFont(name: "Avenir", size: 16.0)!),
            .MenuHeight(45.0),
            .MenuItemWidth(90.0),
            .CenterMenuItems(true)
        ]
        
        // Initialize scroll menu
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        
        self.addChildViewController(pageMenu!)
        self.view.addSubview(pageMenu!.view)
        
        pageMenu!.didMoveToParentViewController(self)
    }
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.hidesBarsOnSwipe = false
        
        subjectString = nil
        filterGlobalArray.removeAll()
        tempTeacherArray.removeAll()
    }
    
    func didTapGoToLeft() {
        let currentIndex = pageMenu!.currentPageIndex
        
        if currentIndex > 0 {
            pageMenu!.moveToPage(currentIndex - 1)
        }
    }
    
    func didTapGoToRight() {
        let currentIndex = pageMenu!.currentPageIndex
        
        if currentIndex < pageMenu!.controllerArray.count {
            pageMenu!.moveToPage(currentIndex + 1)
        }
    }
	
	// MARK: - Container View Controller
	override func shouldAutomaticallyForwardAppearanceMethods() -> Bool {
		return true
	}
	
	override func shouldAutomaticallyForwardRotationMethods() -> Bool {
		return true
	}
}


