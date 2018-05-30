//
//  ViewController.swift
//  middleExam
//
//  Created by 스마트금융과3 on 2018. 4. 25..
//  Copyright © 2018년 ssw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 이미지 상수선언
    
    // 주석 잘 다는 습관
    // 이미지 랜덤함수로
    
    
    var m_switch : Bool = false;
    
    @IBOutlet weak var changeLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBOutlet weak var myTextView: UITextView!
    
    @IBOutlet weak var changeLabelFlower: UILabel!
    
    //label 변경
    @IBAction func changeButton(_ sender: Any) {
        changeLabel.text = NSLocalizedString("신성우", comment:"")
        changeLabel.textColor = UIColor.white
        changeLabel.backgroundColor = UIColor.black
        changeLabel.textAlignment = NSTextAlignment.center
        changeLabel.font = UIFont.systemFont(ofSize: 20)
    }
    
    
    // image 변경
    @IBAction func changeImage(_ sender: Any) {
        if (m_switch == true) {
            mySwitch.isOn = true
            mySwitch.onTintColor = UIColor.red
            mySwitch.thumbTintColor = UIColor.yellow
            m_switch = false
            imageView.image = UIImage(named: "3.jpg")
            imageView.contentMode = UIViewContentMode.scaleToFill
            changeLabelFlower.text = NSLocalizedString("이쁜 꽃", comment:"")
            changeLabelFlower.textColor = UIColor.yellow
            changeLabelFlower.backgroundColor = UIColor.cyan
        }
        else
        {
            mySwitch.isOn = false
            mySwitch.onTintColor = UIColor.blue
            mySwitch.thumbTintColor = UIColor.black
            m_switch = true
            imageView.image = UIImage(named: "2.jpeg")
            imageView.contentMode = UIViewContentMode.scaleToFill
            changeLabelFlower.text = NSLocalizedString("사랑스런 꽃", comment:"")
            changeLabelFlower.textColor = UIColor.purple
            changeLabelFlower.backgroundColor = UIColor.white
            
            
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "1.jpg")
        imageView.contentMode = UIViewContentMode.scaleToFill
        
        
        //웹 text 가져오기
        if let url = URL(string: "https://www.google.com/robots.txt") {
            let urlSession = URLSession.shared
            let task = urlSession.dataTask(with: url, completionHandler: onFinish)
            task.resume()
        }
        
    }
    
    

    func onFinish(data: Data?, response: URLResponse?, error: Error?) {
         print(data)
        do{
            if let nsstr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) {
                let str = String(nsstr)
                print("문자열=[\(str)]")

                if let response = response as? HTTPURLResponse {
                    if response.statusCode == 200 {
                        print("Success")
                            DispatchQueue.main.sync(execute: {
                                myTextView.text = str
                            })
                    }
                    else{
                        print("Error")
                    }
                }
            }
        } catch {
            print ("JSON Parsing Error")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

