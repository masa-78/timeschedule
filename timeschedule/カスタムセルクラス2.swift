//
//  カスタムセルクラス2.swift
//  timeschedule
//
//  Created by masahiro tono on 2020/09/26.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit

class customcell2: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet var Label: UILabel!

    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    var saveData: UserDefaults = UserDefaults.standard
   
    @IBAction func savebutton() {
        saveData.set(titleTextField.text, forKey: "title")
        saveData.set(contentTextView.text, forKey: "content")
    }
    
}


