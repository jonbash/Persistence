//
//  FetchOptions.swift
//  
//
//  Created by Jon Bash on 2020-04-21.
//

import Foundation


public struct FetchOptions {
    public var predicate: NSPredicate?
    public var sorting: Sorting?
}


public struct Sorting {
    public var key: String
    public var ascending: Bool = true
}
