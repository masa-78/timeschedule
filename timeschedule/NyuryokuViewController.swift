//
//  NyuryokuViewController.swift
//  timeschedule
//
//  Created by masahiro tono on 2020/09/12.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit

class NyuryokuViewController: UIViewController, UITextFieldDelegate , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(UINib(nibName: "customTableViewCell", bundle: nil),forCellReuseIdentifier:"customTableViewCell")
        
        table.dataSource = self
        table.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell",for: indexPath) as! CustomTableViewCell
        cell.titleTextField?.text = "title！"
        return cell
    }
    
  

    @IBOutlet var titleTextField: UITextField!

    
    var saveData: UserDefaults = UserDefaults.standard
    
    func viewDidRoad() {
        

        titleTextField.text = saveData.object(forKey: "title") as? String
//        contentTextView.text = saveData.object(forKey: "content") as? String

        // Do any additional setup after loading the view.
        
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
      
    
    
}
