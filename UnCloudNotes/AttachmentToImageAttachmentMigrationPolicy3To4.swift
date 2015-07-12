//
//  AttachmentToImageAttachmentMigrationPolicy3To4.swift
//  UnCloudNotes
//
//  Created by hexin on 15/7/12.
//  Copyright (c) 2015年 Ray Wenderlich. All rights reserved.
//

import UIKit
import CoreData

class AttachmentToImageAttachmentMigrationPolicy3To4: NSEntityMigrationPolicy {
    
    override func createDestinationInstancesForSourceInstance(sInstance: NSManagedObject, entityMapping mapping: NSEntityMapping, manager: NSMigrationManager, error: NSErrorPointer) -> Bool {
        let newAttahment = NSEntityDescription.insertNewObjectForEntityForName("ImageAttachment", inManagedObjectContext: manager.destinationContext) as! NSManagedObject
        for propertyMapping in mapping.attributeMappings as! [NSPropertyMapping]{
            let destinationName = propertyMapping.name!
            if let valueExpression = propertyMapping.valueExpression {
                let context: NSMutableDictionary = ["source": sInstance]
                let destinationValue: AnyObject = valueExpression.expressionValueWithObject(sInstance, context: context)
                newAttahment.setValue(destinationValue, forKey: destinationName)
            }
        }
        
        if let image = sInstance.valueForKey("image") as? UIImage {
            newAttahment.setValue(image.size.height, forKey: "height")
            newAttahment.setValue(image.size.width, forKey: "width")
        }
        
        if let body = sInstance.valueForKey("toNote.body") as? NSString {
            newAttahment.setValue(body.substringToIndex(80), forKey: "caption")
        }
        
        manager.associateSourceInstance(sInstance, withDestinationInstance: newAttahment, forEntityMapping: mapping)
        return true
    }
}
