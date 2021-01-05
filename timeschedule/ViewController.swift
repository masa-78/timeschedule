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
    
    @IBOutlet var titleTextField: UITextField!
    
    //    var NyuryokuVC:NyuryokuViewController = NyuryokuViewController
    //    var GraphVC:GraphViewController = GraphViewController
    
    let realm = try! Realm()
    //    var passedId: Int!
    //
    //    @IBOutlet var titleTextField: UITextField!
    
    @IBOutlet var table: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        //        var _:NyuryokuViewController = NyuryokuViewController
        //        var _:GraphViewController = GraphViewController
        
        
        
        //        titleTextField.text = (PassedId)
        
        //        table.tableFooterView = UIView(frame: CGRect.zero)
        
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
                self.titleTextField.text = text
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
    
//    @IBAction func taptransitionButton(_ sender: Any) {
//        let storyboard = self.storyboard!
//        let next = storyboard.instantiateViewController(withIdentifier: "toNextViewController") as! NyuryokuViewController
//       next.outputValue = self.titleTextField.text
//        self.present(next, animated: true)
//    }
    
    func taptransition(_ sender: Any) {
        performSegue(withIdentifier: "toNextViewController", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.セルに表示するデータの制御(choice : indexPath)
        
        return cell
    }
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("/(indexPath.row)番目の行が選択されました。")
        print(indexPath.row)
        
        table.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "toNextViewController", sender: indexPath.row)
        
        // セルの選択を解除
        table.deselectRow(at: indexPath, animated: true)
        
        // 別の画面に遷移
        performSegue(withIdentifier: "toNextViewController", sender: nil)
    }
    
    
    //
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    

    
    
}
