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
    var saveData: UserDefaults = UserDefaults.standard
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    


//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//    let CustomTableViewCell = segue.destination as! CustomTableViewCell
//    CustomTableViewCell.titleTextField.text = titleTextField.text
//    }
    //    var passedId: Int!
    
    
    func  セルに表示するデータの制御(choice:IndexPath){
        self.titleTextField.text = String((choice.row)+1)
    }
    
    //    @IBOutlet var button1: UIButton!
    //    @IBOutlet var button2: UIButton!
    
 
//    @IBAction func taptransitionButton(_ sender: Any) {
//        let storyboard = self.storyboard!
//        let next = storyboard.instantiateViewController(withIdentifier: "toNextViewController") as! NyuryokuViewController
//        next.outputValue = self.titleTextField.text
//        self.present(next, animated: true)
//    }
//
    @IBAction func action (_ sender: Any) {
        print("action")
    }

    @IBAction func saveTable() {
        saveData.set(titleTextField.text ,forKey: "title")
    }
}
