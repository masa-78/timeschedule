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

    var timeArray:Results<Time>!
    
    let realm = try! Realm()
    //    var passedId: Int!
    //
    //    @IBOutlet var titleTextField: UITextField!
    
    @IBOutlet var table: UITableView!
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
    
    func taptransition(_ sender: Any) {
        performSegue(withIdentifier: "toNextViewController", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
//
//        let time = timeArray[indexPath.row]
//        cell.textLabel?.text = time.title
        cell.セルに表示するデータの制御(choice : indexPath)
        
        return cell
    }
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("/(indexPath.row)番目の行が選択されました。")
        print(indexPath.row)
  
        performSegue(withIdentifier: "toNextViewController", sender: indexPath.row)
        
        // セルの選択を解除
        table.deselectRow(at: indexPath, animated: true)
        
        // 別の画面に遷移
//        performSegue(withIdentifier: "tothirdViewController", sender: nil)
//    }
    
    
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
