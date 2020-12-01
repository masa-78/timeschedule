//
//  ViewController.swift
//  timeschedule
//
//  Created by masahiro tono on 2020/08/29.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {

    
    var NyuryokuVC:NyuryokuViewController = NyuryokuViewController()
    var GraphVC:GraphViewController = GraphViewController()
    
    let realm = try! Realm()
//    var passedId: Int!
//
//    @IBOutlet var titleTextField: UITextField!
    
    
    
    @IBOutlet var table: UITableView!
    
    @IBOutlet var SegmentedButton: UISegmentedControl!
    
    func setup(){
        self.view.addSubview(NyuryokuVC.view)
        self.view.addSubview(GraphVC.view)
    }
    
    @IBAction func SegmentedButton(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            self.view.bringSubviewToFront(NyuryokuVC.view)
        case 1:
            self.view.bringSubviewToFront(GraphVC.view)
        default:
            print("")
        }
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
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

//    @IBAction func nyuryoku(_ sender: Any){
//
//        let storyboard: UIStoryboard = self.storyboard!
//
//        let nextView = storyboard.instantiateViewController(withIdentifier: "View2") as! NyuryokuViewController
//
//        self.present(nextView,animated: true,completion: nil)
//    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        //cell.セルに表示するデータの制御　(choice : indexPath)
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("/(indexPath.row)番目の行が選択されました。")
//        print(indexPath.row)
//
//        table.deselectRow(at: indexPath, animated: true)
//
//        performSegue(withIdentifier: "toNextViewController", sender: indexPath.row)
//    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//           // セルの選択を解除
//           table.deselectRow(at: indexPath, animated: true)
//
//           // 別の画面に遷移
//           performSegue(withIdentifier: "toNextViewController", sender: nil)
//        }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if segue .identifier == "toNextViewController" {
//
//            _ = segue.destination as! NyuryokuViewController
//
//
//        }
//    }
//
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    private func add(asNyuryokuViewController viewController: UIViewController) {
        
//        addNyuryokuViewController(ViewController)
        
        view.addSubview(viewController.view)
        
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        viewController.didMove(toParent: self)
    }
    
    private lazy var NyuryokuViewController: NyuryokuViewController = {
        let storyboard = UIStoryBoard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(WithIdentifier: "View2") as! NyuryokuViewController
        add(asNyuryokuViewController:  viewController)
        return viewController
    }()
    
    private lazy var GraphViewController: GraphViewController = {
        let storyboard = UIStoryBoard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(WithIdentifier: "View3") as! GraphViewController
        add(asGraphViewController:  GraphViewController)
        return viewController
    }()
    
    private func updateView() {
        if UISegmentedControl.selectedSegmentedIndex == 0 {
            remove(GraphViewController)
            add(asNyuryokuViewController: NyuryokuViewController)
        }else{
            remove(NyuryokuViewController)
            add(asNyuryokuViewController: GraphViewController
            }
        }
    @IBAction func tapSegmentedControl(_ sender: UISegmentedControl) {
        updateView()
    }
    
    private func setupView() {
        updateView()
    }


}
