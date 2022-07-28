//
//  AddNewItemViewController.swift
//  TodoApp2
//
//  Created by อัยรัช เพ็งทอง on 28/7/2565 BE.
//

import UIKit

protocol ItemDetailViewControllerDelegate: AnyObject {
    func itemDetailViewController(controller: ItemDetailViewController, didAdd item: TodoItem)
    func itemDetailViewController(controller: ItemDetailViewController, didEdit item: TodoItem)
    func itemDetailViewControllerDidCancel(controller: ItemDetailViewController)
}

class ItemDetailViewController: UIViewController {
    
    var todoItem: TodoItem?
    
    var isInEditMode: Bool {
        todoItem != nil
    }

    weak var delegate: ItemDetailViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let todoItems = todoItem {
            title = "Edit Item"
            titleTextField.text = todoItems.title
            isDoneSwift.setOn(todoItems.isDone, animated: true)
        } else {
            title = "Add New Item"
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        titleTextField.becomeFirstResponder()
    }
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var isDoneSwift: UISwitch!
    
    @IBAction func doneButtonDidTap(_ sender: UIBarButtonItem) {
        guard let title = titleTextField.text, !title.isEmpty else {
            return
        }
        if let todoItems = todoItem {
            todoItems.title = title
            todoItems.isDone = isDoneSwift.isOn
            delegate?.itemDetailViewController(controller: self, didEdit: todoItems)
        } else {
            let todoItem = TodoItem(title: title, isDone: isDoneSwift.isOn)
            delegate?.itemDetailViewController(controller: self, didAdd: todoItem)
        }
    }

    @IBAction func cancelButtonDidTap(_ sender: UIBarButtonItem) {
        delegate?.itemDetailViewControllerDidCancel(controller: self)
    }

}
