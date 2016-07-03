//
//  Request.swift
//  Wedge
//
//  Created by Kuriakose Sony Theakanath on 7/3/16.
//  Copyright © 2016 Kuriakose Sony Theakanath. All rights reserved.
//

import UIKit


class Request: NSObject {
    func getNewsfeed() -> NSData {
        return NSData(contentsOfURL: NSURL(string: "https://vibe-driver.herokuapp.com/api/events?zip_code=10011&num_results=20")!)!
    }
}
