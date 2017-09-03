//
//  FilterViewController.swift
//  WhoseHelp_git1
//
//  Created by Saahil Chhabria on 21/01/16.
//  Copyright © 2016 CAPS. All rights reserved.
//

import UIKit
var filterGlobalArray = [Teachers]()
var completeString:String!
class FilterViewController:
UIViewController,UITextFieldDelegate {
    var onetoone:String!
    var group:String!
    var atMyPlace:String!
    var tutorPlace:String!
    var male:String!
    var searchCourse:String!
    var intSlider:String!
    var female:String!
    var dualGender:String!
    var attributes = [
        NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSFontAttributeName: UIFont(name: "HelveticaNeue-Bold", size: 16)!
    ]
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var distanceLabel: UILabel!
    @IBAction func sliderValueChanged(sender: UISlider) {
            self.distanceLabel.text = String(Int(sender.value)) + "~" + "Km"
    }
    
    @IBAction func rewindBack(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
  
    var filterArray = [String]()
    var filterSQLstring = "SubjectName = '\(subjectString)'  "
    @IBAction func applyFiler(sender: UIBarButtonItem) {
        
        if (oneTooneSwitch.on == true) {
            self.onetoone = "AND TeacherDetails.OneToOne = 1"
            self.filterArray.append(onetoone)
        }
        
        if(groupClassesSwitch.on == true) {
            self.group = "AND TeacherDetails.GroupClass = 1 "
            self.filterArray.append(group)
        }
        if(atMyPlaceSwitch.on == true) {
            self.atMyPlace = "AND TeacherDetails.HomeTutoring = 1 "
            self.filterArray.append(atMyPlace)
        }
        if(tutorsPlaceSwitch.on == true) {
            self.tutorPlace = "AND TeacherDetails.OwnPlace = 1 "
            self.filterArray.append(tutorPlace)
        }
        if(maleSwitch.on == true && femaleSwitch.on == false) {
            self.male = "AND TeacherDetails.Gender = 'Male'"
            self.filterArray.append(male)
        }
        if(femaleSwitch.on == true && maleSwitch.on == false) {
            self.female = "AND TeacherDetails.Gender = 'Female'"
            self.filterArray.append(female)
        }
        if(maleSwitch.on == true && femaleSwitch.on == true) {
            self.dualGender = "AND (TeacherDetails.Gender = 'Female' OR TeacherDetails.Gender = 'Male')"
            self.filterArray.append(dualGender)
        }
        if (coursesSearch.text!.isEmpty == false) {
            let searchCourse = "AND Course = '\(coursesSearch.text!)'"
            self.filterArray.append(searchCourse)
        }
        if(distanceSlider.value.isZero) {
            print("slider is zero")
            return
        }
        else {
            let intSlider = "HAVING distance < \(String(distanceSlider.value))"
            self.filterArray.append(intSlider)
        }
        if (self.filterArray.isEmpty == false) {
        completeString = self.filterSQLstring + self.filterArray.joinWithSeparator(" ")
            if ( completeString.isEmpty == false) {
                filterSubject = completeString
              self.performSegueWithIdentifier("showFilterTableView", sender:nil)
            }
            else {
                print("Error in string")
            }
        }
        else {
            print("Filter Array is Empty")
        }
        
        
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    //Outlets
    @IBOutlet var coursesSearch: UITextField!
    
    @IBOutlet var oneTooneSwitch: UISwitch!
    
    @IBOutlet var groupClassesSwitch: UISwitch!
    
    @IBOutlet var atMyPlaceSwitch: UISwitch!
    
    @IBOutlet var tutorsPlaceSwitch: UISwitch!
    @IBOutlet var distanceSlider: UISlider!
    
    
    @IBOutlet var femaleSwitch: UISwitch!
    @IBOutlet var maleSwitch: UISwitch!
    
    
    
    func showError() {
        let alertController = UIAlertController(title: "Error", message: "The Particular Filter Option is not available", preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title: "OK", style: .Default) { (UIAlertAction) -> Void in
            self.filterArray.removeAll()
            completeString = nil
            filterSubject = nil        }
        alertController.addAction(defaultAction)
        presentViewController(alertController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        coursesSearch.delegate = self
        self.distanceLabel.text = "~2Km"
        //NavBar Properties
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationItem.title = "Filter";
        self.navigationController?.navigationBar.barTintColor = UIColor(red:CGFloat(22)/255, green:CGFloat(70)/255, blue:CGFloat(129)/255, alpha: CGFloat(100))
        self.navigationController?.navigationBar.titleTextAttributes = attributes
        self.navigationController?.navigationBar.translucent = false
        //Set Scroll content size
        self.scrollView.contentSize = CGSize(width: 600, height: 800)
        filterSubject = nil
        completeString = nil
        self.onetoone = nil
        self.group = nil
        self.male = nil
        self.female = nil
        self.searchCourse = nil
        self.intSlider = nil
        self.atMyPlace = nil
        self.tutorPlace = nil
        //tap recognizer for keyboard dismiss
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
    override func viewWillAppear(animated: Bool) {
        self.filterArray.removeAll()
        filterGlobalArray.removeAll()
        completeString = nil
        filterSubject = nil
        filterActive = false
        self.onetoone = nil
        self.group = nil
        self.male = nil
        self.female = nil
        self.searchCourse = nil
        self.intSlider = nil
        self.atMyPlace = nil
        self.tutorPlace = nil
        
    }
    override func viewDidAppear(animated: Bool) {
        self.filterArray.removeAll()
        filterGlobalArray.removeAll()
        completeString = nil
        filterSubject = nil
        filterActive = false
        self.onetoone = nil
        self.group = nil
        self.male = nil
        self.female = nil
        self.searchCourse = nil
        self.intSlider = nil
        self.atMyPlace = nil
        self.tutorPlace = nil
    }

}
