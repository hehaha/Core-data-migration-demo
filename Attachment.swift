//
//  Attachment.swift
//  UnCloudNotes
//
//  Created by hexin on 15/7/12.
//  Copyright (c) 2015年 Ray Wenderlich. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Attachment: NSManagedObject {

    @NSManaged var dateCreated: NSDate
    @NSManaged var image: UIImage?
    @NSManaged var toNote: Note

}
