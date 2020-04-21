//
//  FetchOptions.swift
//  
//
//  Created by Jon Bash on 2020-04-21.
//

import Foundation


struct FetchOptions {
    var predicate: NSPredicate?
    var sorting: Sorting?
}


struct Sorting {
    var key: String
    var ascending: Bool = true
}
