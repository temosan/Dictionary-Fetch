//
//  Dictionary+Fetch.swift
//  SafetyApp-Swift
//
//  Created by Temosan on 01/08/2019.
//  Copyright © 2019 Temosan. All rights reserved.
//

import Foundation

extension Dictionary {
    func object(forPath path: String?) -> Any? {
        guard let explicitPath = path else { return self }
        
        var paths = explicitPath.components(separatedBy: "/")
        paths.removeFirst()
        
        guard paths.count != 0 else { return nil }
        
        var object: Any? = self
        for path in paths {
            guard object is Dictionary else { return object }
            
            object = (object as? [String: Any])?[path]
            if object == nil { return nil }
        }
        
        return object
    }
}

