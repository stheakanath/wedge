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
        print("hello")
        self.data = JSON(data: Request().getNewsfeed())["results"]
    }
    
    override func viewDidLoad() {
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
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

            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                let data = NSData(contentsOfURL: NSURL(string: self.data[indexPath.row]["images"][2]["url"].stringValue)!)
                dispatch_async(dispatch_get_main_queue(), {
                    if (data != nil) {
                        cell.eventPicture.image = UIImage(data: data!)
                        cell.eventPicture.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, 93)
                        self.imageData[indexPath.row] = cell.eventPicture.image

                    }

                });
            }

        cell.eventDate.text = self.data[indexPath.row]["dates"]["start"]["localDate"].stringValue
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! FeedItem
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("detailed") as! TicketViewController
        let _ = vc.view
        vc.title = cell.eventName.text
        vc.eventPicture.image = cell.eventPicture.image
        vc.eventName.text = cell.eventName.text
        vc.eventDate.text = cell.eventDate.text
        vc.eventLocation.text = cell.eventLocation.text
        self.navigationController?.pushViewController(vc, animated: true)

    }

}
