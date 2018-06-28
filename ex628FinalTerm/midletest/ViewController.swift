//
//  ViewController.swift
//  midletest
//
//  Created by 스마트금융과12 on 2018. 4. 25..
//  Copyright © 2018년 스마트금융과12. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {

    var m_switch : Bool = false;
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var yourLabel: UILabel!
    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBOutlet weak var myImgView: UIImageView!
    @IBOutlet weak var myTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func onFinish(data: Data?, response : URLResponse?, error: Error?){
        //Raw 데이터를 utf8  문자열로 변환
        if let nsstr = NSString(data:data!,encoding:String.Encoding.utf8.rawValue) {
            //UTF* 문자열로 변환되면 일반적은 문자열로 변환
            let str = String(nsstr)
            //문자열 출력
            print("문자열=[\(str)")
            
            if let response = response as? HTTPURLResponse{
                if response.statusCode == 200 {
                    print("success")
                        DispatchQueue.main.sync(execute: {
                        myTextView.text = str
                    })
                }
                else{
                    print("Error" + "\(response.statusCode)")
                }
            }
        }
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func myButton(_ sender: Any) {
        yourLabel.text="This is a Test."
    }
    @IBAction func swchChange(_ sender: Any) {
        if  (m_switch == true) {
            mySwitch.isOn = true
            m_switch = false
            myImgView.image  = UIImage(named: "1.png")

            
            if let url = URL(string : "https://www.google.com/robots.txt"){
                let urlSession = URLSession.shared
                let task = urlSession.dataTask(with : url, completionHandler : onFinish)
                task.resume()
            }
            
            
            
        }
        else {
            mySwitch.isOn = false
            m_switch = true
            myImgView.image = UIImage(named: "2.jpg")
            
        
            if let url1 = URL(string : "https://www.w3.org/Search/9605-Indexing-Workshop/ReportOutcomes/Spidering.txt"){
                let urlSession1 = URLSession.shared
                let task1 = urlSession1.dataTask(with : url1, completionHandler : onFinish)
                task1.resume()
            }
            
            
            
            
        }
    }
    }
    
    





