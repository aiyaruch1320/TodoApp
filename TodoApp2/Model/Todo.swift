//
//  Todo.swift
//  TodoApp2
//
//  Created by อัยรัช เพ็งทอง on 28/7/2565 BE.
//

import Foundation

class Todo: Codable {
    private var items = [TodoItem]()
    
    var totalItems: Int {
        items.count
    }
    
    func item(at index: Int) -> TodoItem {
        items[index]
    }
    
    func add(item: TodoItem) {
        items.insert(item, at: 0)
    }
    
    func remove(at index: Int) {
        items.remove(at: index)
    }
    
    func index(of item: TodoItem) -> Int? {
        items.firstIndex { $0 === item }
    }
    
    func move(from sourceIndex: Int, to destinationIndex: Int) {
        items.insert((items.remove(at: sourceIndex)), at: destinationIndex)
    }
}
