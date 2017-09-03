//
//  SearchViewController.swift
//  WhoseHelp_git1
//
//  Created by Saahil Chhabria on 23/01/16.
//  Copyright © 2016 CAPS. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,UITextFieldDelegate {
    
    var attributes = [
        NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSFontAttributeName: UIFont(name: "HelveticaNeue-Bold", size: 16)!
    ]
    @IBAction func rewindHome(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion:nil)
    }
    var searchString:String!
    @IBOutlet var searchText: UITextField!
    
    
    @IBAction func search(sender: UIButton) {
        if(self.searchText.text?.isEmpty == false) {
            self.searchString = self.searchText.text
            subjectString = self.searchString
            if (subjectString.isEmpty == false || subjectString != nil) {
                self.performSegueWithIdentifier("showSearchResult", sender: nil)
                
            }
            else {
                self.showError()
            }
            
        }
        else {
            self.showError()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchText.delegate = self
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationItem.title = "Search";
        self.navigationController?.navigationBar.barTintColor = UIColor(red:CGFloat(22)/255, green:CGFloat(70)/255, blue:CGFloat(129)/255, alpha: CGFloat(100))
        self.navigationController?.navigationBar.titleTextAttributes = attributes
        self.navigationController?.navigationBar.translucent = false
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
    override func viewWillAppear(animated: Bool) {
        subjectString = nil
        tempTeacherArray.removeAll()
    }
    func showError() {
        let alertController = UIAlertController(title: "Error", message: "Sorry, Try Again", preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title: "OK", style: .Default) { (UIAlertAction) -> Void in
        }
        alertController.addAction(defaultAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
}
