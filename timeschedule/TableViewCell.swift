//
//  TableViewCell.swift
//  timeschedule
//
//  Created by masahiro tono on 2021/02/24.
//  Copyright © 2021 com.litech. All rights reserved.
//

import UIKit
import RealmSwift

    class TableViewCell: UITableViewCell,UITextFieldDelegate{
        @IBOutlet var titleTextField: UITextField!
        @IBOutlet var Datefield: UITextField!
        var time: Time!
        
        let realm = try! Realm()
        
        var timeArray: Results<Time>!
        
        override func awakeFromNib() {
            super.awakeFromNib()
            titleTextField.delegate = self
            timeArray = realm.objects(Time.self)
            // Initialization code
        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            print("タップされました")
            // Configure the view for the selected state
        }
     
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            titleTextField.resignFirstResponder()
        }
        
        func textFieldShouldReturn(_ titleTextField: UITextField) -> Bool {
    //        self.titleTextField.text = ""
            titleTextField.resignFirstResponder()
                try! realm.write {
                    time.title = titleTextField.text!
                    realm.add(time)
                }
            return true
        }
        
        func  セルに表示するデータの制御(choice:IndexPath){
            time = timeArray[choice.row]
            self.titleTextField.text = time.title
        }
    }

