//
//  TableViewCell.swift
//  timeschedule
//
//  Created by masahiro tono on 2020/09/12.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var titleTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func textFieldShouldReturn(_ titleTextField: UITextField) -> Bool {
        self.titleTextField.text = ""
        return true
    }
   
    func  セルに表示するデータの制御(choice:IndexPath){
        self.titleTextField.text = String((choice.row)+1)
    }

//    @IBAction func action (_ sender: Any) {
//        print("action")
//    }

//    @IBAction func saveTable() {
//        saveData.set(titleTextField.text ,forKey: "title")
//    }
}
