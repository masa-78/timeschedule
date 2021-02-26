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
    
    @IBOutlet var titleTextField: UITextField!

    let cellIdentifier = "TableViewCell"
    
    let data: [String] = ["日付"]
//    @IBAction func moveAnotherStoryboard(_ sender: Any) {
//        let storyboard: UIStoryboard = UIStoryboard(name: "View1", bundle: nil)//遷移先のStoryboardを設定
//        let nextView = storyboard.instantiateViewController(withIdentifier: "View2") as! GraphViewController//遷移先のViewControllerを設定
//        self.navigationController?.pushViewController(nextView, animated: true)//遷移する
//    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        timeArray = realm.objects(Time.self)
        print(timeArray!)
        
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
//        table.register (UINib(nibName: "TableViewCell", bundle: nil),forCellReuseIdentifier: "TableViewCell")
        
        // Do any additional setup after loading the view.
        table.dataSource = self
        table.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNextViewController" {
            if (table.indexPathForSelectedRow?.row) != nil{
                _ = segue.destination as! GraphViewController
            //            next.resultHandler = {text in
            //            }
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
        let cell = table.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
//            as!TableViewCell
        _ = data[indexPath.row]
//        cell.titleTextField.text = text
//        cell.セルに表示するデータの制御(choice:indexPath)
        return cell
    }
    
    func taptransition(_ sender: Any) {
        performSegue(withIdentifier: "toNextViewController", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("/(indexPath.row)番目の行が選択されました。")
        print(indexPath.row)
        
        // セルの選択を解除
        table.deselectRow(at: indexPath, animated: true)
//        indexpath.row
        performSegue(withIdentifier: "toNextViewController", sender: nil)
        
//        let storyboard: UIStoryboard = UIStoryboard(name: "View1", bundle: nil)//遷移先のStoryboardを設定
//        let nextView = storyboard.instantiateViewController(withIdentifier: "View2") as! GraphViewController//遷移先のViewControllerを設定
//        self.navigationController?.pushViewController(nextView, animated: true)//遷移する
    }
    //  キーボードずらし
    func configureObserver() {
        let notification = NotificationCenter.default
        notification.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        print("Notificationを発行")
    }
    
    // Notificationを削除
    func removeObserver() {
        let notification = NotificationCenter.default
        notification.removeObserver(self)
    }
    
    @objc func keyboardWillShow(notification: Notification?) {
        let rect = (notification?.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        let duration: TimeInterval? = notification?.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
        UIView.animate(withDuration: duration!, animations: { () in
            let transform = CGAffineTransform(translationX: 0, y: -(rect?.size.height)!)
            self.view.transform = transform
        })
    }
    
    @objc func keyboardWillHide(notification: Notification?) {
        let duration: TimeInterval? = notification?.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? Double
        UIView.animate(withDuration: duration!, animations: {
            self.view.transform = CGAffineTransform.identity
        })
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
        //         Initialization code
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

