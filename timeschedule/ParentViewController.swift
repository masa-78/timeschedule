//
//  ParentViewController.swift
//  timeschedule
//
//  Created by masahiro tono on 2021/01/04.
//  Copyright © 2021 com.litech. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController {

    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @IBAction func tapsegmentedControl(_ sender: UISegmentedControl) {
        updateView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    private lazy var ViewController: ViewController = { 
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "View1") as!
            ViewController
        add(asNyuryokuViewController: viewController)
        return viewController
    }()
    
    private lazy var NyuryokuViewController: NyuryokuViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "View2") as! NyuryokuViewController
        add(asNyuryokuViewController: viewController)
        return viewController
    }()
    
    //    var GraphViewController:((UInt) -> UInt)!
    
    private lazy var GraphViewController: GraphViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "View3") as! GraphViewController
        add(asNyuryokuViewController: viewController)
        return viewController
    }()
    
    private func updateView() {
        if segmentedControl.selectedSegmentIndex == 0 {
            remove (asNyuryokuViewController: GraphViewController)
            add(asNyuryokuViewController: NyuryokuViewController)
        }else{
            remove (asNyuryokuViewController: NyuryokuViewController)
            add(asNyuryokuViewController: GraphViewController)
        }
    }
    
    private func setupView() {
        updateView()
    }
    
    private func add(asNyuryokuViewController viewController: UIViewController) {
        
        addChild(viewController)
        
        view.addSubview(viewController.view)
        
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        viewController.didMove(toParent: self)
    }
    
    private func remove(asNyuryokuViewController viewController: UIViewController) {
        
        viewController.willMove(toParent: nil)
        
        viewController.view.removeFromSuperview()
        
        viewController.removeFromParent()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
