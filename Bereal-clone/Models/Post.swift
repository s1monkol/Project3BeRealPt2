//
//  Post.swift
//  Bereal-clone
//
//  Created by Semen Kolesnykov on 2/16/25.
//

import Foundation
import ParseSwift

struct Post: ParseObject {
    
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?

    
    var caption: String?
    var user: Users?
    var imageFile: ParseFile?
}
