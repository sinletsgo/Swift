//
//  ViewController.swift
//  NaverOpenAPI
//
//  Created by 스마트금융과31 on 2018. 4. 18..
//  Copyright © 2018년 hwy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myTextView: UITextView!
    var retStr3:String = ""
    let naverUrl = "https://openapi.naver.com/v1/search/blog?query=" // Naver Open API URL
   
    var timer:Timer?
    var count = 0
    var stopCounter:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func textFieldEnter(_ sender: Any) {
        //print("enter key")
        dataReq()
     //   startTimer()
    }
    
    func dataReq(){
        // Naver Open API 호출
        // 0. 사용자가 입력한 검색어를 받아온다.
        // 1. Naver Open API URL -> String
        // 2. ID, Secret(네이버 발급) -> HTTP Header
        // 3. 1+2 -> GET 방식으로 HTTP 호출
        // 4. Naver서버 -> 응답(response)
        // 5. 응답 -> Parsing(내가 원하는 데이터를 추출)
        // 6. TextView 디스플레이
        
        let usrQuery = myTextField.text
        
        // URL 인코딩 ex> 한국폴리텍대학 -> %ED%99%95 ~~~~~~
        let encodingQuery = usrQuery!.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
        
        // myUrl = URL(http://openapi.naver.com/..... + ?query=%ED%99%95 ....)
        let myUrl = URL(string: (naverUrl + encodingQuery!))!
        
        // HTTP 통신시 세션을 공유한다.
        let session4 = URLSession.shared
        
        // HTTP Request 객체를 만든다.
        let request = NSMutableURLRequest(url: myUrl)
        
        //request.httpMethod = "POST" // POST 방식인 경우
        request.httpMethod = "GET" // GET 방식인 경우
        
        //ID, Secret 설정 -> HTTP 헤더에 설정
        request.setValue("NtF6I1bYeQpw1Z_V_gH0", forHTTPHeaderField: "X-Naver-Client-Id")
        request.setValue("o_tA7AtX2a", forHTTPHeaderField: "X-Naver-Client-Secret")
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData // 캐시 사용안함
        
        let taskTest = session4.dataTask(with: request as URLRequest, completionHandler: onFinish)
        
        taskTest.resume()
        
        //myTextView.text = retStr3
        
    }
    
    func onFinish(data: Data?, response: URLResponse?, error: Error?) {
        // print(data)
        
        do{
            let array = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
            /*    JSON                -> NSDictionary {key:value, key:value, key:value, }
                [
             {key:value, key:value },
             {key:value, key:value },  -> as! NSDictionary
             {key:value, key:value },
             {key:value, key:value },
             ]            */

            // ("----------------------딕셔너리 변환2-------------------")
            //print(array) // dictionary key:value 예> apple: 사과
            
            // ("---------------------KEY가item인 Value를 추출2-------------------")
            //print(array["items"]!) // array["key"] = "value"
 
            // {key:value, key:value, key:value, } ----> ["value","value","value","value",....10items]
            let temp = array["items"] as! NSArray // 배열로 변환
            
            print("---------------------배열의 크기는2 -------------------")
            //print(temp.count) // ["value","value","value","value",....10items]
            
            self.retStr3.removeAll()
            for i in 0..<temp.count{
                var tempArray2 = temp[i] as! NSDictionary
                self.retStr3.append("순번 : \(i)")
                self.retStr3.append("\n")
                self.retStr3.append("블로거네임 : ")
                self.retStr3.append(tempArray2["bloggername"] as! String)
                self.retStr3.append("\n")
                self.retStr3.append("블로거링크 : ")
                self.retStr3.append(tempArray2["bloggerlink"] as! String)
                self.retStr3.append("\n")
                self.retStr3.append("-----------------")
                self.retStr3.append("\n")
            }
            DispatchQueue.main.sync(execute: {
                
                self.myTextView.text = retStr3
                
            })
          
            
            
        } catch {
            print ("JSON Parsing Error")
        }
    }
    
//    func startTimer(){
//        // 1000msec = 1sec, 100msec = 0.1sec
//        self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
//        stopCounter = false
//    }
//
//    @objc func update(){
//
//        print("update")
//
//
//        if(count > 10 || stopCounter == true){
//            self.stopTimer()
//        }
//
//        if  retStr3 != "" {
//
//            myTextView.text = retStr3
//            stopCounter = true
//        } else {
//            count += 1
//        }
//
//    }
//
//    func stopTimer(){
//        self.timer?.invalidate()
//        self.timer = nil
//    }
//
}











