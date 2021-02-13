//
//  ViewController.swift
//  timeschedule
//
//  Created by masahiro tono on 2020/08/29.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource{
    
    var timeArray:Results<Time>!
    
    var addButtonPressed = UIBarButtonItem?.self
    
    let realm = try! Realm()
    
//    var saveData: UserDefaults = UserDefaults.standard
    
    @IBOutlet var table: UITableView!
    @IBOutlet var saveButton: UIButton!
    
    @IBAction func saveButton(_ sender: Any) {
        
//                saveData.set(table, forKey: "title")

        self.dismiss(animated: true,completion: nil)
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        timeArray = realm.objects(Time.self)
        print(timeArray!)

        
        table.register (UINib(nibName: "TableViewCell", bundle: nil),forCellReuseIdentifier: "TableViewCell")
        
        // Do any additional setup after loading the view.
        
        table.dataSource = self
        
        table.delegate = self

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNextViewController" {
            let next = segue.destination as? NyuryokuViewController
            next?.resultHandler = {text in
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewController Will Appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ViewController Will Disappear")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)as!
            TableViewCell

        cell.セルに表示するデータの制御(choice:indexPath)

        
        return cell
    }
 
    func taptransition(_ sender: Any) {
        performSegue(withIdentifier: "toNextViewController", sender: nil)
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("/(indexPath.row)番目の行が選択されました。")
        print(indexPath.row)
        
        performSegue(withIdentifier: "toNextViewController", sender: indexPath.row)
        
        // セルの選択を解除
        table.deselectRow(at: indexPath, animated: true)
        
        //
//        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return 300
//        }

    }
}

class TableViewCell: UITableViewCell,UITextFieldDelegate{
    @IBOutlet var titleTextField: UITextField!
    
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
