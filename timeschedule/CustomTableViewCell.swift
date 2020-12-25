//
//  CustomTableViewCell.swift
//  timeschedule
//
//  Created by masahiro tono on 2020/10/03.
//  Copyright © 2020 com.litech. All rights reserved.


import UIKit

class CustomTableViewCell: UITableViewCell, UITextFieldDelegate, UITextViewDelegate{
    var saveData:UserDefaults = UserDefaults.standard
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
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
        contentTextView.delegate = self
    
    }
    
}
