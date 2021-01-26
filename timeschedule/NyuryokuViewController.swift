//
//  NyuryokuViewController.swift
//  timeschedule
//
//  Created by masahiro tono on 2020/09/12.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit
import RealmSwift


class NyuryokuViewController: UIViewController, UITextFieldDelegate , UITableViewDataSource,  UITableViewDelegate{
    
    @IBOutlet var table: UITableView!
    
 
    var saveData: UserDefaults = UserDefaults.standard
    
    var timeArray:Results<Time>!
    
    var addButtonPressed = UIBarButtonItem?.self
    
    var outputValue : String?
    
    var resultHandler: ((String) -> Void)?
    
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeArray = realm.objects(Time.self)
        print(timeArray!)
        
 //       titleTextField.text = outputValue
    
        table.register(UINib(nibName: "CustomTableViewCell", bundle:   nil),forCellReuseIdentifier:"CustomTableViewCell")
        table.dataSource = self
        table.delegate = self
        print("Nyuryoku")
        

//       titleTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("NyuryokuViewController Will Appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("NyuryokuViewController Will Disappear")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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

//    func tapBackButton(_ sender: Any) {
//        guard let text = self.titleTextField.text else { return }
//        if let handler = self.resultHandler {
//            handler(text)
//    }
//        self.dismiss(animated: true, completion: nil)
//    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

 
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        // アイテム削除処理
//        timeArray.remove(at: indexPath.row)
        do {
            let realm = try Realm()
            try! realm.write {
                realm.delete(timeArray[indexPath.row])
        }
        } catch {
        }
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        
       
 
    }
    
//    @IBAction func saveTable() {
//        saveData.set(titleTextField.text ,forKey: "title")
//    }
    @IBAction func addButtonPressed(_ sender: Any) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "新しいアイテム追加", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "リストに追加", style: .default) {(action) in
            
            let time = Time()
            time.title = textField.text!
            try! self.realm.write {
                self.realm.add(time)
            }
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
 

 */






//    @IBAction func byNavicationPush(_ sender: Any) {
//        let nextVC = (self.storyboard?.instantiateViewController(withIdentifier: "View2")as NyuryokuViewController
//        nextVC.text = "fromViewController"
//
//    }


