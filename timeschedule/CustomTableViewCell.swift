//
//  CustomTableViewCell.swift
//  timeschedule
//
//  Created by masahiro tono on 2020/10/03.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell, UITextFieldDelegate{

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet var Label:UILabel!
        
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    var saveData:UserDefaults = UserDefaults.standard
    
    func viewDidLoad() {
    
    titleTextField.delegate = self
    
    }
    

}
