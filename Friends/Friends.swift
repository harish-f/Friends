//
//  File.swift
//  freindsApp
//
//  Created by HARISH RAM BAGHAVATH stu on 18/6/22.
//

import Foundation

struct Friend: Identifiable, Equatable {
    var id = UUID()
    
    var name: String
    var icon: String
    var school: String
    var cursedImage: String
    
    var attack: Double
    var defense: Double
    
    var types: [FriendType]
}
