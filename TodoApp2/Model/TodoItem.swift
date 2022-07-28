//
//  TodoItem.swift
//  TodoApp2
//
//  Created by อัยรัช เพ็งทอง on 28/7/2565 BE.
//

import Foundation

class TodoItem: Codable {
    var title: String
    var isDone: Bool
    
    init(title: String, isDone: Bool = false) {
        self.title = title
        self.isDone = isDone
    }
}
