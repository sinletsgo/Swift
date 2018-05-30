//
//  ViewController.swift
//  midterm
//
//  Created by 스마트금융과 on 2018. 4. 25..
//  Copyright © 2018년 . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 컴포넌트 연결
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var myTextView: UITextView!
   
    // 변수 및 상수 정의
    var counter = 1
    let myName1 = "gildong Hong"
    let myName2 = "홍길동"
    let myName3 = "홍c"
    let switchOnImage = "transform.jpg"
    let switchOffImage = "whowins.jpg"
    let textUrl = "https://www.google.com/robots.txt"
    
    // 버튼 클릭시 동작
    @IBAction func touch_Button(_ sender: Any) {
        if counter % 3 == 1 {
            myLabel.text = myName1
            counter += 1
        } else if counter % 3 == 2 {
            myLabel.text = myName2
            counter += 1
        } else {
            myLabel.text = myName3
            counter += 1
        }
    }
    
    // 스위치 On/Off시 동작
    @IBAction func switchOnOff(_ sender: Any) {
        if mySwitch.isOn == true {
            myImageView.image = UIImage(named: switchOnImage)
        } else {
            myImageView.image = UIImage(named: switchOffImage)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // ImageView에 이미지 출력하기
        myImageView.image = UIImage(named: switchOnImage)
        
        if let url = URL(string: textUrl) {
            let urlSession = URLSession.shared
            let task = urlSession.dataTask(with: url, completionHandler: onFinish)
            task.resume()
        }
    }

    // TextView에 텍스트 출력하기
    func onFinish(data: Data?, response: URLResponse?, error: Error?) {
        if let nsStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue){
            let str = String(nsStr)
            
            if let response = response as? HTTPURLResponse{
                if response.statusCode == 200 {
                    DispatchQueue.main.sync(execute: {
                        self.myTextView.text = str
                    })
                } else {
                    print ("Error " + "\(response.statusCode)")
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

