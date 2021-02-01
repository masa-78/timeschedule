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

    var saveData: UserDefaults = UserDefaults.standard
    
    @IBOutlet var table: UITableView!
    @IBOutlet var saveButton: UIButton!
    
    @IBAction func saveButton(_ sender: UIButton) {
//       let obj = Time()
//
//
//        try! realm.write {
//            realm.add(obj)
//        }
//        saveData.set(table, forKey: "title")
        
        viewDidLoad()
    }
    
//    @IBAction func addButtonPressed(_ sender: Any) {
//
//        var textField = UITextField()
//        let alert = UIAlertController(title: "新しいアイテム追加", message: "", preferredStyle: .alert)
//        let action = UIAlertAction(title: "リストに追加", style: .default) {(action) in
//
//            let time = Time()
//            time.title = textField.text!
//            try! self.realm.write {
//                self.realm.add(time)
//            }
//        }
//        alert.addTextField {
//            (alertTextField) in
//            alertTextField.placeholder = "新しいアイテム"
//            textField = alertTextField
//        }
//        alert.addAction(action)
//        present(alert, animated: true, completion: nil)
//    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        timeArray = realm.objects(Time.self)
        print(timeArray!)
        //        var _:NyuryokuViewController = NyuryokuViewController
        //        var _:GraphViewController = GraphViewController
   
        //        titleTextField.text = (PassedId)
        
        //        table.tableFooterView = UIView(frame: CGRect.zero)
        
        table.register (UINib(nibName: "TableViewCell", bundle: nil),forCellReuseIdentifier: "TableViewCell")
        
        // Do any additional setup after loading the view.
        
        table.dataSource = self
        
        table.delegate = self
        
//        table = saveData.object(forKey: "title") as? UITableView
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNextViewController" {
            let next = segue.destination as? NyuryokuViewController
            next?.resultHandler = {text in
//                self.titleTextField.text = text
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
         return 15
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)as!
          TableViewCell
//         cell.textLabel?.text = time.title
//         print("bbb")

 //
   //     let time = timeArray[indexPath.row]
 //        cell.textLabel?.text = time.title
        cell.セルに表示するデータの制御(choice:indexPath)
         
         return cell
     }

    func taptransition(_ sender: Any) {
        performSegue(withIdentifier: "toNextViewController", sender: nil)
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return timeArray.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
//        cell.textLabel?.text = time.title
//        print("bbb")

//
//        let time = timeArray[indexPath.row]
//        cell.textLabel?.text = time.title
//        cell.セルに表示するデータの制御(choice : indexPath)
        
//        return cell
//    }
//
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("/(indexPath.row)番目の行が選択されました。")
        print(indexPath.row)

        performSegue(withIdentifier: "toNextViewController", sender: indexPath.row)

        // セルの選択を解除
        table.deselectRow(at: indexPath, animated: true)

    //
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }

    
//    private func updateView() {
//        if segmentedControl.selectedSegmentIndex == 0 {
//            remove (asNyuryokuViewController: GraphViewController)
//            add(asNyuryokuViewController: NyuryokuViewController)
//        }else{
//            remove (asNyuryokuViewController: NyuryokuViewController)
//            add(asNyuryokuViewController: GraphViewController)
//        }
//    }
//
//    private func setupView() {
//        updateView()
//    }
//
//    private func add(asNyuryokuViewController viewController: UIViewController) {
//
//        addChild(viewController)
//
//        view.addSubview(viewController.view)
//
//        viewController.view.frame = view.bounds
//        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//        viewController.didMove(toParent: self)
//    }
//
//    private func remove(asNyuryokuViewController viewController: UIViewController) {
//
//        viewController.willMove(toParent: nil)
//
//        viewController.view.removeFromSuperview()
//
//        viewController.removeFromParent()
//    }
    
    
}
}
   

