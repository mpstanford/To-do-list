//
//  Category.swift
//  Get Shit Done
//
//  Created by Madison Stanford-Geromel on 5/29/18.
//  Copyright © 2018 Madison Stanford-Geromel. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
