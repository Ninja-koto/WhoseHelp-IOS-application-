//
//  Teachers.swift
//  WhoseHelp_1.0_Test
//
//  Created by Saahil Chhabria on 23/10/15.
//  Copyright © 2015 WhoseHelp. All rights reserved.
//

import Foundation
import UIKit

class Teachers {
    var firstName:String!
    var lastName:String!
    var workPosition:String!
    var image:String!
    var subjectname:String!
    var baserate:Int!
    var grade:String!
    var course:String!
    var hometutoring:Int!
    var ownplace:Int!
    var onetone:Int!
    var groupclasses:Int!
    var university:String!
    var degree:String!
    var branch:String!
    var graduationyear:Int!
    var commulanguage:String!
    var phoneNumber:String!
    var properImage:UIImage!
    var email:String!
    var latitude:String!
    var longitude:String!
    var teacherModel:String!
    var gender:String!
    var subArray = [Subjects]()
    init(FirstName:String!,LastName:String,WorkPosition:String!,Image:String!,HomeTutoring:Int!,OwnPlace:Int!,OneToOne:Int!,GroupClasses:Int!,University:String!,Degree:String!,Branch:String!,GraduationYear:Int!,CommuLanguage:String!,PhoneNo:String!,Email:String!,Latitude:String!,Longitude:String!,imageforpic:UIImage,teacherInit:String!,sex:String!,subarray:[Subjects]) {
        self.firstName = FirstName;
        self.lastName = LastName;
        self.workPosition = WorkPosition
        self.image = Image
        self.hometutoring = HomeTutoring
        self.ownplace = OwnPlace
        self.onetone = OneToOne
        self.groupclasses = GroupClasses
        self.university = University
        self.degree = Degree
        self.branch = Branch
        self.graduationyear = GraduationYear
        self.commulanguage = CommuLanguage
        self.phoneNumber = PhoneNo
        self.email = Email
        self.latitude = Latitude
        self.longitude = Longitude
        self.properImage = imageforpic
        self.teacherModel = teacherInit
        self.gender = sex
        self.subArray = subarray
    }
}