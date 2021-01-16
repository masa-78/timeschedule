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
        self.setViewControllers([getSecond()], direction: .forward, animated: true, completion: nil)
        self.dataSource = self
    }
    // Do any additional setup after loading the view.
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    func getFirst() -> ViewController {
//        return storyboard!.instantiateViewController(withIdentifier: "View2") as! ViewController
//    }
    
    func getSecond() -> NyuryokuViewController {
        return storyboard!.instantiateViewController(withIdentifier: "View2") as! NyuryokuViewController
    }
    
    func getThird() -> GraphViewController {
        return storyboard!.instantiateViewController(withIdentifier: "View3") as! GraphViewController
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: GraphViewController.self){
            return getSecond()
        }else
//        if viewController.isKind(of: NyuryokuViewController.self) {
//            return getFirst()
//        }
//        else
        {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: ViewController.self) {
            return getSecond()
        }else if viewController.isKind(of: NyuryokuViewController.self)
        {
            return getThird()
        } else {
            return nil
        }
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



