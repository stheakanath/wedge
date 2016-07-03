//
//  NewsfeedViewController.swift
//  Wedge
//
//  Created by Kuriakose Sony Theakanath on 7/3/16.
//  Copyright © 2016 Kuriakose Sony Theakanath. All rights reserved.
//

import UIKit

class NewsfeedViewController: UITableViewController {
    var data : JSON = []
    var imageData = [UIImage?](count: 20, repeatedValue: nil)
    
    override func viewWillAppear(animated: Bool) {
        self.data = JSON(data: Request().getNewsfeed())["results"]
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("feedItem", forIndexPath: indexPath) as! FeedItem
        
        cell.eventName.text = self.data[indexPath.row]["name"].stringValue
        cell.eventPrice.text = "$90"
        cell.eventLocation.text = self.data[indexPath.row]["_embedded"]["venues"][0]["city"]["name"].stringValue
//        if (self.imageData[indexPath.row] != nil) {
//            print("hi")
//            cell.eventPicture.image = self.imageData[indexPath.row]!
//            cell.eventPicture.clipsToBounds = true
//            cell.eventPicture.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, 93)
//            cell.eventPicture.contentMode = UIViewContentMode.ScaleAspectFill


//        } else {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                print("ho")
                let data = NSData(contentsOfURL: NSURL(string: self.data[indexPath.row]["images"][2]["url"].stringValue)!)
                dispatch_async(dispatch_get_main_queue(), {
                    cell.eventPicture.image = UIImage(data: data!)
                    cell.eventPicture.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, 93)
                    self.imageData[indexPath.row] = cell.eventPicture.image

                });
            }
//        }

        cell.eventDate.text = self.data[indexPath.row]["dates"]["start"]["localDate"].stringValue
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        
//        cell.setNeedsLayout()
        return cell
    }

}
