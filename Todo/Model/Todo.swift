//
//  Todo.swift
//  Todo
//
//  Created by YJ Soon 
//

import SwiftUI

struct Todo: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String = ""
    var isCompleted: Bool = false
}
