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
        print(self.data[indexPath.row]["name"])
        cell.eventName.text = self.data[indexPath.row]["name"].stringValue
        cell.eventPrice.text = "$90"
        cell.eventLocation.text = self.data[indexPath.row]["_embedded"]["venues"]["city"].stringValue
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            let data = NSData(contentsOfURL: NSURL(string: self.data[indexPath.row]["images"][0]["url"].stringValue)!)
            dispatch_async(dispatch_get_main_queue(), {
                cell.eventPicture.image = UIImage(data: data!)
            });
        }

//        cell.eventDate.text = self.data[indexPath.row]["venues"]["city"].stringValue
        return cell
    }

}
