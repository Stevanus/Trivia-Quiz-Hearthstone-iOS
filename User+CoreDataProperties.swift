//
//  User+CoreDataProperties.swift
//  Trivia Hearthstone
//
//  Created by Stevanus Iskandar on 12/10/15.
//  Copyright © 2015 Kokatoo Entertainment. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension User {

    @NSManaged var gold: NSNumber?
    @NSManaged var unlocked2: NSNumber?
    @NSManaged var unlocked3: NSNumber?
    @NSManaged var unlocked4: NSNumber?
    @NSManaged var unlocked5: NSNumber?
    @NSManaged var rated: NSNumber?
    @NSManaged var removeads: NSNumber?
    @NSManaged var initialized: NSNumber?

}
