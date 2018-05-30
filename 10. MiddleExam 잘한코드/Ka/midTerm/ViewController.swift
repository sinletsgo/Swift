//
//  ViewController.swift
//  midTerm
//
//  Created by 스마트금융과 on 2018. 4. 25..
//  Copyright © 2018년 스마트금융과. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //1번 문제: label 변수 생성
    @IBOutlet weak var changedNameLabel: UILabel!
    //2번 문제: image 변수 생성
    @IBOutlet weak var imgKopo: UIImageView!
    //3번 문제: switch 변수 생성
    @IBOutlet weak var switchChangedImg: UISwitch!
    //4번 문제: text view 변수 생성
    @IBOutlet weak var textViewWeb: UITextView!
    
    //1번 문제: button 함수 생성
    @IBAction func btnChangedName(_ sender: Any) {
        changedNameLabel.text = "Oh Mi Jin"
    }
    //3번 문제: switch 함수 생성
    @IBAction func funcChanedImg(_ sender: Any) {
        if(switchChangedImg.isOn == true){
            imgKopo.image =  UIImage(named:"kopo.png")
        }
        else{
            imgKopo.image =  UIImage(named:"fintech.jpg")
        }
    }
    
    //4번 문제: text view 초기 화면 로드
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: "https://www.google.com/robots.txt") {
            let urlSession = URLSession.shared
            let task = urlSession.dataTask(with: url, completionHandler: onFinish)
            task.resume()
        }
    }
    //4번 문제 : 후처리 함수 - DispatchQueue 라이브러리 사용
    func onFinish(data: Data?, response: URLResponse?, error: Error?) {
        if let nsstr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) {
            let str = String(nsstr)
            DispatchQueue.main.sync(execute: {
                self.textViewWeb.text = str
            })
        }}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

