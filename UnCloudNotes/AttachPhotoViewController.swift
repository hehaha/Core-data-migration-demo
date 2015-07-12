//
//  AttachPhotoViewController.swift
//  UnCloudNotes
//
//  Created by Richard Turton on 26/07/2014.
//  Copyright (c) 2014 Ray Wenderlich. All rights reserved.
//

import UIKit
import CoreData

class AttachPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var note : Note?
    
    lazy var imagePicker : UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.sourceType = .PhotoLibrary
        picker.delegate = self
        self.addChildViewController(picker)
        return picker
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imagePicker.view)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imagePicker.view.frame = view.bounds
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let note = self.note {
            let attachment = NSEntityDescription.insertNewObjectForEntityForName("ImageAttachment", inManagedObjectContext: note.managedObjectContext!) as! ImageAttachment
            attachment.dateCreated = NSDate()
            attachment.toNote = note
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            attachment.image = image
            attachment.height = image.size.height
            attachment.width = image.size.width
            attachment.caption = (note.body as NSString).substringToIndex(80)
        }
        navigationController?.popViewControllerAnimated(true)
    }
}
