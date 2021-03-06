//
//  PageViewController.swift
//  timeschedule
//
//  Created by masahiro tono on 2020/12/12.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers([getFirst()], direction: .forward, animated: true, completion: nil)
        self.dataSource = self
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getFirst() -> ViewController {
        return storyboard!.instantiateViewController(withIdentifier: "View1") as! ViewController
    }
    
    func getSecond() -> GraphViewController {
        return storyboard!.instantiateViewController(withIdentifier: "View2") as! GraphViewController
    }
    
    func getThird() -> NyuryokuViewController {
        return storyboard!.instantiateViewController(withIdentifier: "View3") as! NyuryokuViewController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        if viewController.isKind(of: NyuryokuViewController.self) {
            return getSecond()
        }
//        else if viewController.isKind(of: GraphViewController.self) {
//            // 2 -> 1
//            return getFirst()
//        }
        else{
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        if viewController.isKind(of: ViewController.self) {
//                    // 1 -> 2
//                    return getSecond()
//                } else
        if viewController.isKind(of: GraphViewController.self)
        {
            return getThird()
        }else{
            return nil
        }
    }

    //    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    //        if viewController is NyuryokuViewController{
    //            return getSecond()
    //        }else if viewController is ViewController{
    //            return getFirst()
    //        }else {
    //          return nil
    //    }
    //
    //    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewcontroller viewController: UIViewController) -> UIViewController? {
    //        if viewController is  ViewController{
    //            return getSecond()
    //        }else if viewController is NyuryokuViewController{
    //            return getThird()
    //        }else {
    //        return nil
    //    }
    //    }
    //    }
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



