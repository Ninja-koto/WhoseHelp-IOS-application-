//
//  NewFormatTableViewController.swift
//  WhoseHelp_git1
//
//  Created by Saahil Chhabria on 05/01/16.
//  Copyright © 2016 CAPS. All rights reserved.
//

import UIKit
var filterSubject:String!
var filterActive:Bool!
class NewFormatTableViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var rateText:String!
    var rateLabel:String!
    var parameters = [String:String]()
    @IBOutlet var filterButton: UIBarButtonItem!
    @IBOutlet weak var activityTestIndicator: UIActivityIndicatorView!
    @IBOutlet weak var activityTestView: UIView!
    @IBOutlet
    var tableView: UITableView!
    var attributes = [
        NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSFontAttributeName: UIFont(name: "HelveticaNeue-Bold", size: 16)!
    ]
    
    @IBAction func actionFilter(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("showFilter", sender: nil)
        
        
    }
    //Netowk call
    func getTeacherForQuery(){
        var subjectArrayForThisTeacher = [Subjects]()
        let tempLatitude = "12.9748"
        let tempLongitude = "77.5827"
        var ImageForPicture:UIImage!
        let request = NSMutableURLRequest(URL: NSURL(string:URL.getTeachers)!)
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        if (latitiudeInitial == nil && longitiudeInitial == nil) {
            parameters = ["SubjectName":subjectString,"Latitude":tempLatitude,"Longitude":tempLongitude,"Radius":"100"]
            
        } else {
            print(latitiudeInitial)
            print(longitiudeInitial)
        parameters = ["SubjectName":subjectString,"Latitude":latitiudeInitial!,"Longitude":longitiudeInitial!,"Radius":"100"]
        }
        do {
            print(parameters)
            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(parameters, options:[])
        } catch {
            print(error)
            request.HTTPBody = nil
        }
        
        let task = session.dataTaskWithRequest(request) { data, response, error in
            guard data != nil else {
                print("no data found: \(error)")
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.showError()
                })
                return
            }
       
            let json = JSON(data:data!)
            if (json == nil) {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.showError()
                })
            }
            //print(json)
            if let teacherArray = json["details"].array {
                if (teacherArray.isEmpty == true) {
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.showError()
                    })
                }
                for teacher in teacherArray {
                    //print(teacher)
                    let FirstName : String! = teacher["FirstName"].string
                    //print(FirstName!)
                    let LastName :String! = teacher["LastName"].string
                    //print(LastName!)
                    let WorkPosition:String! = teacher["WorkPosition"].string
                    //print(WorkPosition!)
                    let Image :String! = teacher["Image"].string
                    //print(Image!)
                    if (Image == "-1") {
                        ImageForPicture = UIImage(named:"IMG_9390")
                    }
                    else {
                        //print("Else clause\n")
                        let urlImage = "http://128.199.87.170/upload/"+Image
                        //print(urlImage)
                    if let urlForImage = NSURL(string:urlImage) {
                        //print(urlForImage)
                        if let dataForImage = NSData(contentsOfURL:urlForImage){
                        //print(dataForImage)
                        ImageForPicture = UIImage(data: dataForImage)
                           // print(ImageForPicture)
                           
                      }
                    }
                }
                    if let subjectTaught = teacher["Subjects"].array {
                        for sub in subjectTaught {
                            let baserateForSub = sub["BaseRate"].intValue
                            //print(baserateForSub)
                            let experience = sub["Experience"].intValue
                            //print(experience)
                            let yearFee = sub["YearFee"].intValue
                            //print(yearFee)
                            let hourFee = sub["HourFee"].intValue
                            //print(hourFee)
                            let baseType = sub["BaseType"].string
                            //print(baseType)
                            let grade = sub["Grade"].string
                            //print(grade)
                            let monthFee = sub["MonthFee"].intValue
                            //print(monthFee)
                            let semesterFee = sub["SemesterFee"].intValue
                            //print(semesterFee)
                            let subjectName = sub["SubjectName"].string
                            //print(subjectName)
                            let course = sub["Course"].string
                            //print(course)
                            let totalSub = Subjects(bfs: baserateForSub, expe: experience, yf: yearFee, hfee: hourFee, bst: baseType, grde: grade, mthfe: monthFee, semFeer: semesterFee, subnamebro: subjectName, courseBro: course)
                            subjectArrayForThisTeacher.append(totalSub)
                        }
                    }
                    let HomeTutoring :Int! = teacher["HomeTutoring"].intValue
                    //print(HomeTutoring!)
                    let OwnPlace :Int! = teacher["OwnPlace"].intValue
                    //print(OwnPlace!)
                    let OneToOne :Int! = teacher["OneToOne"].intValue
                    //print(OneToOne!)
                    let GroupClasses :Int! = teacher["GroupClasses"].intValue
                    //print(GroupClasses!)
                    let University :String! = teacher["University"].string
                    //print(University!)
                    let Degree :String! = teacher["Degree"].string
                    //print(Degree!)
                    let Branch :String! = teacher["Branch"].string
                    //print(Branch!)
                    let GraduationYear :Int! = teacher["GraduationYear"].intValue
                    //print(GraduationYear!)
                    let CommuLanguage :String! = teacher["CommuLanguage"].string
                    //print(CommuLanguage!)
                    let PhoneNo :String! = teacher["PhoneNo"].string
                    //print(PhoneNo!)
                    let Email :String! = teacher["Email"].string
                    //print(Email!)
                    let Latitude :String! = teacher["Latitude"].string
                    //print(Latitude!)
                    let Longitude :String! = teacher["Longitude"].string
                    //print(Longitude!)
                    let address:String! = teacher["Location"].string
                    //print(address!)
                    let gender:String! = teacher["Gender"].string
                    //print(gender)
                    let teacheR = Teachers(FirstName: FirstName!, LastName: LastName!, WorkPosition: WorkPosition!, Image: Image,HomeTutoring: HomeTutoring!, OwnPlace: OwnPlace!, OneToOne: OneToOne!, GroupClasses: GroupClasses!, University: University!, Degree: Degree!, Branch: Branch!, GraduationYear: GraduationYear!, CommuLanguage: CommuLanguage!, PhoneNo: PhoneNo!, Email: Email!, Latitude: Latitude!, Longitude: Longitude!, imageforpic: ImageForPicture!, teacherInit: address!,sex:gender!,subarray:subjectArrayForThisTeacher)
                    tempTeacherArray.append(teacheR)
                }
            }
            else {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.showError()
                })
            }
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
            })
            
        }
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.tableView.reloadData()
        })
        task.resume()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //Spinning Wheel Error Check and
        activityTestView.hidden = false
        self.activityTestIndicator.startAnimating()
        //hide filter button
        self.navigationItem.rightBarButtonItem?.enabled = false
        //Nav Bar attributes and settings
        self.tabBarController?.tabBar.hidden = true
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationItem.title = "Teachers";
        self.navigationController?.navigationBar.barTintColor = UIColor(red:CGFloat(22)/255, green:CGFloat(70)/255, blue:CGFloat(129)/255, alpha: CGFloat(100))
        self.navigationController?.navigationBar.titleTextAttributes = attributes
        self.navigationController?.navigationBar.translucent = false
        if (subjectString.isEmpty == false) {
            let qos = Int(QOS_CLASS_USER_INITIATED.rawValue)
            dispatch_async(dispatch_get_global_queue(qos, 0)) { () -> Void in
                self.getTeacherForQuery()
            }
        }

        self.navigationController?.hidesBarsOnSwipe = false
       
        // Do any additional setup after loading the view.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempTeacherArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("newformatcell") as! NewFormatTableViewCell
        let row = indexPath.row
        var tec : Teachers

        tec = tempTeacherArray[row]
        cell.tecaherName.text =  "Prof" + " " + tec.firstName
        cell.qualification.text = subjectString
        cell.distance.text = tec.workPosition
        if( tec.subArray[row].baseForsubject != nil && tec.subArray[row].mnthFee == -1 && tec.subArray[row].semFee == -1  && tec.subArray[row].mnthFee == -1) {
            rateText = String(tec.subArray[row].baseForsubject)
            rateLabel = "Month"
        }
        else if  (tec.subArray[row].hrfee != nil && tec.subArray[row].baseForsubject == nil && tec.subArray[row].semFee == -1  && tec.subArray[row].mnthFee == -1 ) {
            rateText = String(tec.subArray[row].hrfee)
            rateLabel = "Hour"
        }
        else if  (tec.subArray[row].semFee != nil && tec.subArray[row].baseForsubject == nil && tec.subArray[row].hrfee == -1  && tec.subArray[row].mnthFee == -1) {
            rateText = String(tec.subArray[row].semFee)
            rateLabel = "Semester"
        }
        else {
            rateText = "0"
            rateLabel = "0"
        }
        cell.rate.text = "₹" + rateText + " / " + rateLabel
        cell.profileImage.image = tec.properImage
        self.activityTestView.hidden = true
        self.activityTestIndicator.stopAnimating()
        self.navigationItem.rightBarButtonItem?.enabled = true
        //print(tempTeacherArray[row].subArray[row].subNameForTeach)
        return cell
    }
    func showError() {
        let alertController = UIAlertController(title: "Error", message: "The Particular subject is not available Or You are currently not connected to the internet", preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title: "OK", style: .Default) { (UIAlertAction) -> Void in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.navigationController?.popViewControllerAnimated(true)
            })
        }
        alertController.addAction(defaultAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showDetail", sender: indexPath);
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showDetail") {
            if let destination = segue.destinationViewController as? Detail_FinalViewController {
                if let tecIndex = tableView.indexPathForSelectedRow?.row {
                    let tec1 : Teachers
                    tec1 = tempTeacherArray[tecIndex]
                    destination.firstName = tec1.firstName
                    destination.lastName = tec1.lastName
                    destination.WorkPosition = tec1.workPosition
                    destination.Image = tec1.image
                    destination.SubjectName = tec1.subArray[tecIndex].subNameForTeach
                    destination.Grade = tec1.subArray[tecIndex].grd
                    destination.Course = tec1.subArray[tecIndex].crse
                    destination.BaseRate = tec1.subArray[tecIndex].baseForsubject
                    destination.HomeTutoring = tec1.hometutoring
                    destination.OwnPlace = tec1.ownplace
                    destination.OneToOne = tec1.onetone
                    destination.GroupClasses = tec1.groupclasses
                    destination.University = tec1.university
                    destination.Degree = tec1.degree
                    destination.Branch = tec1.branch
                    destination.GraduationYear = tec1.graduationyear
                    destination.CommuLanguage = tec1.commulanguage
                    destination.PhoneNo = tec1.phoneNumber
                    destination.Email = tec1.email
                    destination.Latitude = tec1.latitude
                    destination.Longitude = tec1.longitude
                    destination.imageForFinalView = tec1.properImage
                    destination.address = tec1.teacherModel
                    destination.fullTeacher = tec1
                    
            }
        }
    }

}
}