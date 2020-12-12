//
//  NyuryokuViewController.swift
//  timeschedule
//
//  Created by masahiro tono on 2020/09/12.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit

class NyuryokuViewController: UIViewController, UITextFieldDelegate , UITableViewDataSource , UITableViewDelegate {
    
    func ClassItem() {
        var _ : String
        var _: Bool = false
//        init(title: String) {
//        self.title = title
//        }

    }
    init(title: String) {
    self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var itemArray: [Item] = []

    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(UINib(nibName: "CustomTableViewCell", bundle:   nil),forCellReuseIdentifier:"CustomTableViewCell")
        
        table.dataSource = self
        table.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    func tableview(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
        tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell",for: indexPath) as! CustomTableViewCell
        
//        tableView(_ tableView: UITableView, commit, editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//
//            itemArray.remove(at: indexPath.row)
//            let indexPaths = [indexPath]
//            tableView.deleteRows(at: indexPaths, with: .automatic)
//        }
        
//        cell.(nil)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        itemArray.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    @IBOutlet var titleTextField: UITextField!

    var saveData: UserDefaults = UserDefaults.standard
    
    func viewDidRoad() {
        

        titleTextField.text = saveData.object(forKey: "title") as? String
//        contentTableView.text = saveData.object(forKey: "content") as? String
        titleTextField.delegate = self
        // Do any additional setup after loading the view.
        
    }
    
    var addButtonPressed = UIBarButtonItem?.self
    
    @IBAction func addButtonPressed(_ sender: Any) {
       
        var textField = UITextField()
        let alert = UIAlertController(title: "新しいアイテム追加", message: "", preferredStyle: .alert)
                
        let action = UIAlertAction(title: "リストに追加", style: .default) {
            (action) in

         let newItem = itemArray[indexPath.row]

       let newItem: Item = Item(title: textField.text!)
           self.itemArray.append(newItem)
            
            self.tableView.reloadData()
          }
        
        alert.addTextField {
            (alertTextField) in
            alertTextField.placeholder = "新しいアイテム"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
//        tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//
//            itemArray.remove(at: indexPath.row)
//            let indexPaths = [indexPath]
//            tableView.deleteRows(at: indexPaths, with: .automatic)
        
    }
    
    

    
    @IBAction func saveNyuryoku() {
        saveData.set(titleTextField.text, forKey: "title")
//        saveData.set(contentTextView.text, forKey: "content")
        

        let alert: UIAlertController = UIAlertController(title: "保存", message: "保存が完了しました。",preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { action in
                    
                    print("OKボタンが押されました！")
            }
        )
    )
        present(alert, animated: true, completion: nil)
    }

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
      
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("NyuryokuViewController Will Appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("NyuryokuViewController Will Disappear")
    }
    
//    override func viewWillDisappear(_animated: Bool ) {
//        super.viewWillDisappear(animated)
//        print("GraphViewController will disappear")
//    }
//
    
    


}

