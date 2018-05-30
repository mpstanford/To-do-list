//
//  Item.swift
//  Get Shit Done
//
//  Created by Madison Stanford-Geromel on 5/29/18.
//  Copyright © 2018 Madison Stanford-Geromel. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
