//
//  Task.swift
//  AppToDoList
//
//  Created by Leonardo Alves Viana on 26/08/25.
//

import Foundation

struct Task: Identifiable, Codable{
    var id: UUID = UUID()
    var title: String
    var isCompleted: Bool = false
}
