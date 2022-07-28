//
//  TodoItemTableViewCell.swift
//  TodoApp2
//
//  Created by อัยรัช เพ็งทอง on 28/7/2565 BE.
//

import UIKit

protocol TodoItemTableViewCellDelegate: AnyObject {
    func todoItemTableViewCellDidTapCheckboxButton(cell: TodoItemTableViewCell)
}

class TodoItemTableViewCell: UITableViewCell {
    
    weak var delegate: TodoItemTableViewCellDelegate?
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var checkboxButton: UIButton?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure (item: TodoItem, delegate: TodoItemTableViewCellDelegate?) {
        titleLabel?.text = item.title
        checkboxButton?.setImage(UIImage(named: item.isDone ? "check" : "uncheck"), for: .normal)
        self.delegate = delegate
    }
    
    @IBAction func checkboxButtonDidTap() {
        delegate?.todoItemTableViewCellDidTapCheckboxButton(cell: self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
