//
//  ViewController.swift
//  timeschedule
//
//  Created by masahiro tono on 2020/08/29.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {

    
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
           // セルの選択を解除
           table.deselectRow(at: indexPath, animated: true)
    
           // 別の画面に遷移
           performSegue(withIdentifier: "toNextViewController", sender: nil)
       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue .identifier == "toNextViewController" {
            
            let nextVC = segue.destination as! NyuryokuViewController
            
            
        }
    }
}


