//
//  time.swift
//  timeschedule
//
//  Created by masahiro tono on 2020/11/28.
//  Copyright © 2020 com.litech. All rights reserved.
//

import Foundation
import RealmSwift

class Time: Object {
    
    @objc dynamic var name = ""//時間
    @objc dynamic var title = ""
}

//class Task: Object {
//    @objc dynamic var content: String = ""
//    let list = List<Task>()
//}


