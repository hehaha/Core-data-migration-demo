//
//  ImageAttachment.swift
//  UnCloudNotes
//
//  Created by hexin on 15/7/12.
//  Copyright (c) 2015年 Ray Wenderlich. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class ImageAttachment: Attachment {

    @NSManaged var caption: String
    @NSManaged var width: NSNumber
    @NSManaged var height: NSNumber
    @NSManaged var image: UIImage?

}
