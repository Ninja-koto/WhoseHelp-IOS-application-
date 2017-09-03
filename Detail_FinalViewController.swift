//
//  Detail_FinalViewController.swift
//  WhoseHelp_1.0_Test
//
//  Created by Saahil Chhabria on 11/10/15.
//  Copyright © 2015 WhoseHelp. All rights reserved.
//

import UIKit
import MapKit
class Detail_FinalViewController: UIViewController {
    var teacherLocation:String!
    var attributes = [
        NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSFontAttributeName: UIFont(name: "HelveticaNeue-Bold", size: 16)!
    ]
    var firstName:String!
    var lastName:String!
    var WorkPosition:String!
    var Image:String!
    var Aboutme:String!
    var SubjectName:String!
    var Grade:String!
    var Course:String!
    var BaseRate:Int!
    var HomeTutoring:Int!
    var OwnPlace:Int!
    var OneToOne:Int!
    var GroupClasses:Int!
    var University:String!
    var Degree:String!
    var Branch:String!
    var GraduationYear:Int!
    var CommuLanguage:String!
    var PhoneNo:String!
    var Email:String!
    var Latitude:String!
    var Longitude:String!
    var imageForFinalView:UIImage!
    var address:String!
    var fullTeacher:Teachers!
    
    //Outlet
    @IBOutlet var pictureDetail: UILabel!
    @IBOutlet var courseLabel: UILabel!
    @IBOutlet var gradeLabel: UILabel!
    @IBOutlet var imageOnStoryBoard: UIImageView!
   
    
    //Outlets
    @IBOutlet weak var pictureTitle: UILabel!
    @IBOutlet weak var view1Header1Title1: UILabel!
    @IBOutlet weak var attributeView1: UILabel!
    @IBOutlet weak var view2Header2Title2: UILabel!
    @IBOutlet weak var attributeView2: UILabel!
    @IBOutlet weak var secondAttributeView2: UILabel!
    @IBOutlet weak var View3Header2Title3: UILabel!
    @IBOutlet weak var View4Header4Tiltle4: UILabel!
    @IBOutlet weak var attributeView4: UILabel!
    @IBOutlet weak var secondAttributeView4: UILabel!
    @IBOutlet weak var View4Header4Title5: UILabel!
    @IBOutlet weak var attributeView5: UILabel!
    @IBOutlet weak var scroll_view: UIScrollView!
    //Methods
    @IBOutlet weak var attributeView3: UILabel!
    @IBOutlet var atmyhome: UILabel!
    @IBOutlet var commulang: UILabel!
    @IBOutlet var atteachershome: UILabel!
    @IBAction func showMao(sender: UIButton) {
        // 1
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .ActionSheet)
        
        // 2
        let googleAction = UIAlertAction(title: "Open in Google Maps", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            if (UIApplication.sharedApplication().canOpenURL(NSURL(string:"comgooglemaps://")!)) {
                let  position = CLLocationCoordinate2DMake(Double(self.Latitude)!,Double(self.Longitude)!)
//                let marker = GMSMarker(position: position)
//                marker.title = "Hello World"
//                marker.map = mapView_
             let location = "comgooglemaps://?center=\(self.Latitude),\(self.Longitude)&zoom=20&views=street"
                print(location)
                UIApplication.sharedApplication().openURL(NSURL(string:
                    location)!)
            }  else {
                let alert = UIAlertController(title: "Error", message: "Google maps not installed", preferredStyle: UIAlertControllerStyle.Alert)
                let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(ok)
                self.presentViewController(alert, animated:true, completion: nil)
            }
           
        })
        let AppleMaps = UIAlertAction(title: "Open in Apple Maps", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            let regionDistance:CLLocationDistance = 10000
            let coordinates = CLLocationCoordinate2DMake(Double(self.Latitude)!, Double(self.Longitude)!)
            let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
            let options = [
                MKLaunchOptionsMapCenterKey: NSValue(MKCoordinate: regionSpan.center),
                MKLaunchOptionsMapSpanKey: NSValue(MKCoordinateSpan: regionSpan.span)
            ]
            let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = self.address
            mapItem.openInMapsWithLaunchOptions(options)

        })
        let cancel = UIAlertAction(title: "Cancel", style: .Default, handler:nil)
        
        // 4
        optionMenu.addAction(cancel)
        optionMenu.addAction(googleAction)
        optionMenu.addAction(AppleMaps)
        
        // 5
        self.presentViewController(optionMenu, animated: true, completion: nil)
        

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.teacherLocation =  "comgooglemaps://?center = \(self.Latitude),\(self.Longitude) &zoom=14&views=traffic"
//        print(self.teacherLocation)
//        print(self.Latitude)
//        print(self.Longitude)
        self.scroll_view.contentSize = CGSize(width: 600,height:900)
        self.pictureTitle.text = self.firstName
        self.view1Header1Title1.text = "Subjects"
        self.pictureDetail.text = self.WorkPosition
        if(self.fullTeacher.subArray.count > 0) {
        self.attributeView1.text = self.fullTeacher.subArray[0].subNameForTeach + " / " + self.fullTeacher.subArray[0].crse
        }
        else {
            self.attributeView1.text = self.navigationController?.title
        }
        if(self.fullTeacher.subArray.count > 2 || self.fullTeacher.subArray.count == 2) {
            self.gradeLabel.text = self.fullTeacher.subArray[1].subNameForTeach + " / " + self.fullTeacher.subArray[1].crse
        }
        else {
            self.gradeLabel.text = "----------"
        }
        if(self.fullTeacher.subArray.count > 3 || self.fullTeacher.subArray.count == 3) {
           self.courseLabel.text = self.fullTeacher.subArray[2].subNameForTeach + " / " + self.fullTeacher.subArray[2].crse
        }
        else {
            self.courseLabel.text = "----------"
        }
        
        self.view2Header2Title2.text = "Class Details"
        if ( self.OneToOne == 1) {
            self.attributeView2.text = "Individual Classes" + "-" + "Yes"
        }
        else {
            self.attributeView2.text = "Individual Classes" + "-" + "No"
        }
        if ( self.GroupClasses == 1) {
            self.secondAttributeView2.text = "Group Classes" + "-" + "Yes"
        }
        else {
            self.secondAttributeView2.text = "Group Classes" + "-" + "No"
        }
        if ( self.OwnPlace == 1) {
            self.atteachershome.text = "At Tutors Place" + "-" + "Yes"
        }
        else {
            self.atteachershome.text = "At Tutors Place" + "-" + "No"
        }
        if ( self.HomeTutoring == 1) {
            self.atmyhome.text = "At My Home" + "-" + "Yes"
        }
        else {
            self.atmyhome.text = "At My Home" + "-" + "No"
        }
        
        self.View3Header2Title3.text = "Education"
        self.attributeView3.text = self.University + " " + ", " + self.Degree
        self.View4Header4Tiltle4.text = "Contact"
        self.attributeView4.text = self.PhoneNo
        self.secondAttributeView4.text = self.Email
        self.commulang.text = "Speaks in" + "," + self.CommuLanguage
        self.View4Header4Title5.text = "Location"
        self.attributeView5.text = self.address
        self.imageOnStoryBoard.image = self.imageForFinalView
        imageOnStoryBoard.layer.borderWidth = 1
        imageOnStoryBoard.layer.masksToBounds = false
        imageOnStoryBoard.layer.borderColor = UIColor.blackColor().CGColor
        imageOnStoryBoard.layer.cornerRadius = imageOnStoryBoard.frame.height/2
        imageOnStoryBoard.clipsToBounds = true
        self.navigationController?.hidesBarsOnSwipe = false
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated:Bool) {
        self.navigationController?.navigationBar.barTintColor = UIColor(red:CGFloat(22)/255, green:CGFloat(70)/255, blue:CGFloat(129)/255, alpha: CGFloat(100))
        self.navigationController?.navigationBar.titleTextAttributes = attributes
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.hidesBarsOnSwipe = false
    }
    override func viewDidAppear(animated:Bool) {
        super.viewDidAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
        self.navigationController?.navigationBar.barTintColor = UIColor(red:CGFloat(22)/255, green:CGFloat(70)/255, blue:CGFloat(129)/255, alpha: CGFloat(100))
        self.navigationController?.navigationBar.titleTextAttributes = attributes
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.hidesBarsOnSwipe = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
