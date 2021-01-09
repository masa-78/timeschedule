//
//  PageViewController.swift
//  timeschedule
//
//  Created by masahiro tono on 2020/12/12.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @IBAction func tapsegmentedControl(_ sender: UISegmentedControl) {
        updateView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers([getFirst()], direction: .forward, animated: true, completion: nil)
        self.dataSource = self
    }
    // Do any additional setup after loading the view.
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getFirst() -> ViewController {
        return storyboard!.instantiateViewController(withIdentifier: "View1") as! ViewController
    }
    
    func getSecond() -> NyuryokuViewController {
        return storyboard!.instantiateViewController(withIdentifier: "View2") as! NyuryokuViewController
    }
    
    func getThird() -> GraphViewController {
        return storyboard!.instantiateViewController(withIdentifier: "View3") as! GraphViewController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: GraphViewController) {
            return getSecond()
        }else if viewController.isKind(of: NyuryokuViewController) {
            return getFirst()
        } else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: ViewController) {
            return getSecond()
        }else if viewController.isKind(of: NyuryokuViewController)
        {
            return getThird()
        } else {
            return nil
        }
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
    
    //    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
    //    if viewController is NyuryokuViewController{
    //        return getSecond()
    //    }else if viewController is ViewController{
    //        return getFirst()
    //    }else {
    //      return nil
    //}
    //
    //func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewcontroller viewController: UIViewController) -> UIViewController? {
    //    if viewController is  ViewController{
    //        return getSecond()
    //    }else if viewController is NyuryokuViewController{
    //        return getThird()
    //    }else {
    //    return nil
    //}
    //}
    //}
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    //    extension PageViewController : UIPageViewControllerDataSource {
    
    //        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    //            if viewController.isKindOfClass(GraphViewController) {
    //                return getSecond()
    //            }else if viewController.isKindOfClass(NyuryokuViewController)
    //            {
    //                return getFirst()
    //            }else {
    //              return nil
    //        }
    //
    //        func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewcontroller viewController: UIViewController) -> UIViewController? {
    //            if viewController.isKind(of: ViewController()) {
    //                return getSecond()
    //            }else if viewController.isKind(of: NyuryokuViewController()) {
    //                return getThird()
    //            }else {
    //            return nil
    //        }
    //    }
    
    
}



