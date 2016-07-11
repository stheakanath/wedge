//
//  TicketViewController.swift
//  Wedge
//
//  Created by Kuriakose Theakanath on 7/11/16.
//  Copyright © 2016 Kuriakose Sony Theakanath. All rights reserved.
//

import UIKit

class TicketViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventPicture: UIImageView!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventLocation: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let data = ["General Admission", "Mezzaine", "Orchestra", "VIP"]
    let price = ["$200", "$250", "$300", "$500"]
    
    var index : NSIndexPath!
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellprice", forIndexPath: indexPath) as! TicketPriceCell
        cell.ticketType.text = data[indexPath.row]
        cell.price.text = price[indexPath.row]
        cell.numStepper.hidden = true
        cell.details.hidden = true
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (index != nil) {
            tableView.cellForRowAtIndexPath(index)?.viewWithTag(1000)?.hidden = true
            tableView.cellForRowAtIndexPath(index)?.viewWithTag(2000)?.hidden = true
        }
        index = indexPath
        
        tableView.cellForRowAtIndexPath(indexPath)?.viewWithTag(2000)?.hidden = false
        tableView.cellForRowAtIndexPath(indexPath)?.viewWithTag(1000)?.hidden = false
        
        tableView.beginUpdates()
        tableView.endUpdates()
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if (index == nil) {
            return 100
        } else if indexPath == index {
            return 150
        } else {
            return 100
        }
    }

    
}
