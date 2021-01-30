//
//  GraphViewController.swift
//  timeschedule
//
//  Created by masahiro tono on 2020/09/12.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit

class GraphViewController: UIViewController {
    
    @IBOutlet var textRate:UITextField!
    @IBOutlet var labelRate:UILabel! = UILabel()
    @IBOutlet var buttonDraw:UIButton! = UIButton()
    @IBOutlet var chartView: ChartView! = ChartView()
    @ IBOutlet var timeRate:UITextField!
    @IBOutlet var labelRate2:UILabel!
    @IBOutlet var labelRate3:UILabel!
    @IBOutlet var labelRate4:UILabel!

        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chartView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.1).isActive = true
        chartView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        chartView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50.0).isActive = true
        
        
        textRate.layer.cornerRadius = 10
        textRate.layer.borderColor = UIColor.lightGray.cgColor

        textRate.keyboardType = .numberPad
        textRate.text = "0"
          self.view.addSubview(textRate)
         self.view.addSubview(labelRate)
        buttonDraw.setTitleColor(UIColor.blue, for: .normal)
        buttonDraw.addTarget(self, action: #selector(self.touchUpButtonDraw), for: .touchUpInside)
        self.view.addSubview(buttonDraw)
         self.view.addSubview(chartView)
        self.view.addSubview(labelRate2)
        self.view.addSubview(labelRate3)
        self.view.addSubview(labelRate4)
        self.view.addSubview(timeRate)
    
        chartView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        chartView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
        chartView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 300.0).isActive = true
        textRate.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 50.0).isActive = true
        labelRate.bottomAnchor.constraint(equalTo: textRate.bottomAnchor).isActive = true
        buttonDraw.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 20.0).isActive = true
        labelRate2.bottomAnchor.constraint(equalTo: textRate.bottomAnchor).isActive = true
        labelRate3.bottomAnchor.constraint(equalTo: textRate.bottomAnchor, constant: 5.0).isActive = true
        labelRate4.bottomAnchor.constraint(equalTo: timeRate.bottomAnchor, constant: 5.0).isActive = true
        
        changeScreen()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(
            alongsideTransition: nil,
            completion: {(UIViewControllerTransitionCoordinatorContext) in
                self.changeScreen()}
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("GraphViewController Will Appear")
        drawChart()
        self.configureObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("GraphViewController Will Disappear")
        self.removeObserver()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func changeScreen(){
        let screenSize: CGRect = UIScreen.main.bounds
        let widthValue = screenSize.width
        let heightValue = screenSize.height
        
//        textRate.frame = CGRect(x: widthValue/2-170, y: 100, width: 100, height:40)
//        labelRate.frame = CGRect(x: widthValue/2-70, y: 100, width: 40, height: 40)
//        buttonDraw.frame = CGRect(x: widthValue/2-30, y: 100, width: 200, height: 40)
        
        var drawWidth = widthValue * 0.7
        if (widthValue > heightValue){
            drawWidth = heightValue * 0.8
        }
        
        chartView.frame = CGRect(x: widthValue/2-drawWidth/2, y: 60, width: drawWidth, height: drawWidth)
    }
    
    @objc func touchUpButtonDraw(){
        drawChart()
    }

    /**
     グラフを表示
     */
    private func drawChart(){
        let rate = Double(textRate.text!)
        chartView.drawChart(rate: rate!)
    }
//    キーボードずらし
    func configureObserver() {

            let notification = NotificationCenter.default
        notification.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        }

        // Notificationを削除
        func removeObserver() {

            let notification = NotificationCenter.default
            notification.removeObserver(self)
        }
    
    @objc func keyboardWillShow(notification: Notification?) {

        let rect = (notification?.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        let duration: TimeInterval? = notification?.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
            UIView.animate(withDuration: duration!, animations: { () in
                let transform = CGAffineTransform(translationX: 0, y: -(rect?.size.height)!)
                self.view.transform = transform

            })
        }
    
    @objc func keyboardWillHide(notification: Notification?) {

        let duration: TimeInterval? = notification?.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? Double
            UIView.animate(withDuration: duration!, animations: { () in

                self.view.transform = CGAffineTransform.identity
            })
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

            textField.resignFirstResponder()
            return true
        }
}
// override func viewWillDisappear(_ animated: Bool ) {
//       super.viewWillDisappear (animated: true)
//        print("GraphViewController Will Disappear")
//    }



/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


