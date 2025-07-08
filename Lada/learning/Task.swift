//
//  Task.swift
//  learning
//
//  Created by Alexander Ponomarev on 8/7/25.
//

import Foundation

struct Task: Codable, Equatable, Identifiable {
    var id = UUID()
    var title: String
    var isCompleted: Bool
    
}
