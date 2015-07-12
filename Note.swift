//
//  Note.swift
//  UnCloudNotes
//
//  Created by hexin on 15/7/12.
//  Copyright (c) 2015年 Ray Wenderlich. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Note: NSManagedObject {

    @NSManaged var body: String
    @NSManaged var dateCreated: NSDate
    @NSManaged var displayIndex: NSNumber
    @NSManaged var title: String
    @NSManaged var attachment: NSSet
    
    override func awakeFromInsert()
    {
        super.awakeFromInsert()
        dateCreated = NSDate()
    }

    var image: UIImage? {
        if let image = self.lastestAttachment()?.image {
            return image
        }
        return nil
    }
    
    func lastestAttachment() -> Attachment? {
        var attachmentsToSort = self.attachment.allObjects as! [Attachment]
        if attachmentsToSort.count == 0 {
            return nil
        }
        attachmentsToSort.sort {
            let date1 = $0.dateCreated.timeIntervalSinceReferenceDate
            let date2 = $1.dateCreated.timeIntervalSinceReferenceDate
            return date1 > date2
        }
        return attachmentsToSort.first
    }
}
