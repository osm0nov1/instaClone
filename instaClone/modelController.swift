//
//  model.swift
//  instaClone
//
//  Created by Rashit Osmonov on 16/2/22.
//

import Foundation
class InstaModel{
    var name: String? = nil
    var publicImage: String? = nil
    var profileImage: String? = nil
    
    init(name: String, publicImage: String, profileImage: String){
        self.name = name
        self.publicImage = publicImage
        self.profileImage = profileImage
    }
    
    init(name: String,profileImage: String){
        self.name = name
        self.profileImage = profileImage
    }
    
}
