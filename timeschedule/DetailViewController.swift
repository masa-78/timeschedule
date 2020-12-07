//
//  DetailViewController.swift
//  timeschedule
//
//  Created by masahiro tono on 2020/12/05.
//  Copyright © 2020 com.litech. All rights reserved.
//
import UIKit
import Foundation

class DetailViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

@IBOutlet var SegmentedButton: UISegmentedControl!

func setup(){
    self.view.addSubview(NyuryokuViewController.view)
    self.view.addSubview(GraphViewController.view)
}

@IBAction func SegmentedButton(_ sender: UISegmentedControl) {
    
    switch sender.selectedSegmentIndex {
    case 0:
        self.view.bringSubviewToFront(NyuryokuViewController.view)
    case 1:
        self.view.bringSubviewToFront(GraphViewController.view)
    default:
        print("")
    }
    
}


//    private func add(asNyuryokuViewController viewController: UIViewController) {
//
////        addNyuryokuViewController(ViewController)
//
//        view.addSubview(viewController.view)
//
//        viewController.view.frame = view.bounds
//        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//        viewController.didMove(toParent: self)
//    }
    
//    private func remove(asNyuryokuViewController viewController: UIViewController) {
//
//        viewController.willMove(toParent: nil)
//
//        viewController.view.removeFromSuperview()
//
//        viewController.removeFromParent()
//    }
//
//    private func remove(asGraphViewController viewController: UIViewController) {
//
//        viewController.willMove(toParent: nil)
//
//        viewController.view.removeFromSuperview()
//
//        viewController.removeFromParent()
//    }
    
    private lazy var NyuryokuViewController: NyuryokuViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "View2") as! NyuryokuViewController
        add(asNyuryokuViewController:  viewController)
        return viewController
    }()
    
//    var GraphViewController:((UInt) -> UInt)!
    
    private lazy var GraphViewController: GraphViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "View3") as! GraphViewController
        add(asNyuryokuViewController:  viewController)
        return viewController
    }()
    
    private func setupView() {
        updateView()
    }

    
    private func updateView() {
        if SegmentedButton.selectedSegmentIndex == 0 {
            remove (asNyuryokuViewController: GraphViewController)
            add(asNyuryokuViewController: NyuryokuViewController)
         }else{
            remove (asNyuryokuViewController: NyuryokuViewController)
    add(asNyuryokuViewController: GraphViewController)
         }
        }
    @IBAction func tapSegmentedControl(_ sender: UISegmentedControl) {
        updateView()
    }
    
    private func add(asNyuryokuViewController viewController: UIViewController) {
        
//        addNyuryokuViewController(ViewController)
        
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
}
