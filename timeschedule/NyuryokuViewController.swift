//
//  NyuryokuViewController.swift
//  timeschedule
//
//  Created by masahiro tono on 2020/09/12.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit
import RealmSwift

class NyuryokuViewController: UIViewController, UITextFieldDelegate , UITableViewDataSource,  UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    @IBOutlet var titleTextField: UITextField!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    var timeArray:Results<Time>!
    
    var addButtonPressed = UIBarButtonItem?.self
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeArray = realm.objects(Time.self)
        print(timeArray!)
        
        
        table.register(UINib(nibName: "CustomTableViewCell", bundle:   nil),forCellReuseIdentifier:"CustomTableViewCell")
        table.dataSource = self
        table.delegate = self
        print("Nyuryoku")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell",for: indexPath) as! CustomTableViewCell
        
        
        let time = timeArray[indexPath.row]
        cell.textLabel?.text = time.title
        //cell.accessoryType = time.done ? .checkmark : .none
        print("aaa")
        print (time)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let time = Time()
        time.title = "aaa"
        try! realm.write {
            realm.add(time)
        }
        var textField = UITextField()
        let alert = UIAlertController(title: "新しいアイテム追加", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "リストに追加", style: .default) {(action) in
//            self.tableView.reloadData()
    }
        alert.addTextField {
            (alertTextField) in
            alertTextField.placeholder = "新しいアイテム"
            textField = alertTextField
        }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }
    
    //    func tableview(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    //        //tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
    //        tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
    //    }
    
    
    //    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    //        return true
    //    }
    //
    
    //    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    //
    //        timeArray.remove(at: indexPath.row)
    //        let indexPaths = [indexPath]
    //        tableView.deleteRows(at: indexPaths, with: .automatic)
    //
    //        if editingStyle == UITableViewCell.EditingStyle.delete {
    //
    //            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
    //        }

    //    func viewDidRoad() {
    //
    //        titleTextField.text = saveData.object(forKey: "title") as? String
    //        //        contentTableView.text = saveData.object(forKey: "content") as? String
    //        titleTextField.delegate = self
    //        // Do any additional setup after loading the view.
    //
    //    }
    
    //    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) -> UITableViewCell {
    //
    //        timeArray.remove(at: indexPath.row)
    //        let indexPaths = [indexPath]
    //        tableView.deleteRows(at: indexPaths, with: .automatic)
    //
    //        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
    //        let time = timeArray[indexPath.row]
    //        cell.textLabel?.text = time.title
    //        cell.accessoryType = time.done ? .checkmark : .none
    //        return cell
    //    }
    
    //   func saveNyuryoku() {
    //        saveData.set(titleTextField.text, forKey: "title")
    ////        saveData.set(contentTextView.text, forKey: "content")
    //
    //        let alert: UIAlertController = UIAlertController(title: "保存", message: "保存が完了しました。",preferredStyle: .alert)
    //        alert.addAction(
    //            UIAlertAction(
    //                title: "OK",
    //                style: .default,
    //                handler: { action in
    //                    print("OKボタンが押されました！")
    //            }
    //        )
    //    )
    //        present(alert, animated: true, completion: nil)
    //    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }





//    @IBAction func byNavicationPush(_ sender: Any) {
//        let nextVC = (self.storyboard?.instantiateViewController(withIdentifier: "View2")as NyuryokuViewController
//        nextVC.text = "fromViewController"
//
//    }


