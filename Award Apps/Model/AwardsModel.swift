//
//  AwardsModel.swift
//  Award Apps
//
//  Created by Rizki Yusnil on 23/12/19.
//  Copyright © 2019 Rizki Yusnil. All rights reserved.
//

import UIKit

class AwardsModel: NSObject {
    
    var type   : String  = ""
    var price  : Int     = 0
    var point  : String? = ""
    var image  : String? = ""
    var product  : String? = ""
    
    init(type:String, price:Int, point:String, image:String, product: String) {
        self.type = type
        self.price = price
        self.point = point
        self.product = product
        self.image = image
    }
    
}

