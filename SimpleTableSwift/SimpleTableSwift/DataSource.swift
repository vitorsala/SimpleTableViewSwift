//
//  dataSource.swift
//  SimpleTableSwift
//
//  Created by Vitor Kawai Sala on 10/04/15.
//  Copyright (c) 2015 Vitor Kawai Sala. All rights reserved.
//

import UIKit

class DataSource: NSObject {
    static let sharedInstance = DataSource()

    private var _data : Array<String> = []
    var data : Array<String>!{
        return _data
    }

    func addObject(object:String){
        _data.append(object)
    }

    func insert(object:String, atIndex: Int){
        _data.insert(object, atIndex: atIndex)
    }

    func removeObject(index: Int){
        _data.removeAtIndex(index)
    }
}
