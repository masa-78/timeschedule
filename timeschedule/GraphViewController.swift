//
//  GraphViewController.swift
//  timeschedule
//
//  Created by masahiro tono on 2020/09/12.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit

class GraphViewController: UIViewController {
    
     var textRate:UITextView = UITextView()
    private let labelRate:UILabel = UILabel()
    private let buttonDraw:UIButton = UIButton()
    private let chartView:ChartView = ChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textRate.layer.cornerRadius = 10
        textRate.layer.borderColor = UIColor.lightGray.cgColor
        textRate.layer.borderWidth = 0.5
        textRate.keyboardType = .numberPad
        textRate.text = ""
        textRate.font = UIFont.systemFont(ofSize: 16)
        self.view.addSubview(textRate)
        labelRate.text = "%"
        self.view.addSubview(labelRate)
        buttonDraw.setTitle("グラフ表示", for: .normal)
        buttonDraw.setTitleColor(UIColor.blue, for: .normal)
        buttonDraw.addTarget(self, action: #selector(self.touchUpButtonDraw), for: .touchUpInside)
        self.view.addSubview(buttonDraw)
        
        self.view.addSubview(chartView)
        
        changeScreen()
        
        print(textRate)
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
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("GraphViewController Will Disappear")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func changeScreen(){
        let screenSize: CGRect = UIScreen.main.bounds
        let widthValue = screenSize.width
        let heightValue = screenSize.height
        
        textRate.frame = CGRect(x: widthValue/2-170, y: 100, width: 100, height:40)
        labelRate.frame = CGRect(x: widthValue/2-70, y: 100, width: 40, height: 40)
        buttonDraw.frame = CGRect(x: widthValue/2-30, y: 100, width: 200, height: 40)
        
        var drawWidth = widthValue * 0.8
        if (widthValue > heightValue){
            drawWidth = heightValue * 0.8
        }
        
        chartView.frame = CGRect(x: widthValue/2-drawWidth/2, y: 150, width: drawWidth, height: drawWidth)
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


