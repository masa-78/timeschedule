//
//  CustomTableViewCell.swift
//  timeschedule
//
//  Created by masahiro tono on 2020/10/03.
//  Copyright © 2020 com.litech. All rights reserved.


import UIKit

class CustomTableViewCell: UITableViewCell, UITextViewDelegate, UITextFieldDelegate{
    var saveData:UserDefaults = UserDefaults.standard
    @IBOutlet var ContentTextView: UITextView!
    @IBOutlet var titleTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func viewDidLoad() {
        titleTextField.delegate = self
        ContentTextView.delegate = self
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        titleTextField.text = textField.text
        return true
    }
    
    
}
