//
//  SubjectsTaughtByTeacher.swift
//  WhoseHelp_git1
//
//  Created by Saahil Chhabria on 30/01/16.
//  Copyright © 2016 saahil chhabria. All rights reserved.
//

import Foundation



class Subjects {
    var baseForsubject:Int!
    var exp:Int!
    var yearfeefoteach:Int!
    var hrfee:Int!
    var bstype:String!
    var grd:String!
    var mnthFee:Int!
    var semFee:Int!
    var subNameForTeach:String!
    var crse:String!
    init(bfs:Int!,expe:Int!,yf:Int!,hfee:Int!,bst:String!,grde:String!,mthfe:Int!,semFeer:Int!,subnamebro:String!,courseBro:String!) {
        
        self.baseForsubject = bfs
        self.exp = expe
        self.yearfeefoteach = yf
        self.hrfee = hfee
        self.bstype = bst
        self.grd = grde
        self.mnthFee = mthfe
        self.semFee = semFeer
        self.subNameForTeach = subnamebro
        self.crse = courseBro
    
        
        
    }
}