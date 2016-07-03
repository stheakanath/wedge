//
//  NewsfeedData.swift
//  Wedge
//
//  Created by Kuriakose Sony Theakanath on 7/3/16.
//  Copyright © 2016 Kuriakose Sony Theakanath. All rights reserved.
//

import UIKit

class NewsfeedData {
    let url : String
    let name : String
    let price : String // modify this to be a int later for comparisons
    let location : String // modify this to be a UILocation later
    let date : String // modify this to be a NSDate later
    
    init(url : String, name : String) {
        self.url = url
        self.name = name
        self.price = name
        self.location = "Hello"
        self.date = "hello"
    }
}
