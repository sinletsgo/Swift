//
//  ViewController.swift
//  L6Test_3
//
//  Created by 스마트금융과29 on 2018. 4. 10..
//  Copyright © 2018년 hwy. All rights reserved.
//

import UIKit

class ViewController: UIViewController/*, UITextFieldDelegate */{

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myTextView: UITextView!
    
    let urlToRequest = "https://openapi.naver.com/v1/search/blog?query="
    
    var retStr1:String = ""
    var retStr2:String = ""
    var timer:Timer?    // 타이머가 있다는건 비동기처리 하고 있다는것
    var count = 0
    var stopCounter:Bool = false
    
    var retStr3:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //self.myTextField.delegate = self
    }

//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//
//        //textField code
//
//        textField.resignFirstResponder()  //if desired
//        performAction()
//        return true
//    }
    
//    func performAction() {
//        //action events
////        dataRequest()
////        startTimer()
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func textFieldEnter(_ sender: Any) {
//        dataRequest()
//        startTimer()
    }
    
    
    
    
    @IBAction func textFieldEnterKey(_ sender: Any) {
        dataRequest() //네이버 api 요청
//        startTimer() // 비동기 작업 시작
    }
    func dataRequest() {
       // let tempData = "한국폴리텍대학교"
        let tempData = myTextField.text //사용자가 검색 입력한 값
        let encodingQuery = tempData!.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)//addingPercentEncoding 함수 호출시 한글 인코딩 해본것처럼 인코딩 값 나온다
        
        let myUrl = URL(string: (urlToRequest + encodingQuery!))!  //요청 쿼리값 입력 ( "https://openapi.naver.com/v1/search/blog?query= 입력값"
        let session4 = URLSession.shared
        let request = NSMutableURLRequest(url: myUrl) // 상수로 지정된 myUrl로 request 보내기
        
        //request.httpMethod = "POST" // POST 방식인 경우
        request.httpMethod = "GET" // GET 방식인 경우
        
        request.setValue("NtF6I1bYeQpw1Z_V_gH0", forHTTPHeaderField: "X-Naver-Client-Id") //네이버 api id
        request.setValue("o_tA7AtX2a", forHTTPHeaderField: "X-Naver-Client-Secret") // api secret
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData //cachePolicy 캐쉬 데이터 무시하고 요청값 받아온다. 그냥 이렇게 씀
        
        // POST 일 경우 아래 코드 형태로 HTTP Body 구성
        //let paramString = "data=Hello"
        //request.httpBody = paramString.data(using: String.Encoding.utf8)
        
        
        
        let task = session4.dataTask(with: request as URLRequest) { (data, response, error) in  //request 결과  data, response, error
            guard let _: Data = data, let _: URLResponse = response, error == nil else { //검증. 데이터 받았으면 밑에 데이터수신으로 가는것 아니면 바로 밑에 error로 간다
                print("*****error")
                return
            }
            
            // 응답받은 데이터를 단순 문자열로 처리할 경우 아래와 같이 처리함
            // let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            
            print("----------------------데이터 수신-------------------")
            print(data!) // 일단 데이터 수신받으면 찍어본다.
           
            do{ //json 형식으로 쓰고 싶으니 아래 코드 넣고 array로 떨어짐
                let array = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                
                print("----------------------딕셔너리 변환-------------------")
                print(array)
                

                print("---------------------KEY가item인 Value를 추출-------------------")
                print(array["items"]!)
                
                
                let temp = array["items"] as! NSArray // 배열로 변환
                print("---------------------배열의 크기는 -------------------")
                print(temp.count)
                
                
               
                
                
                print(temp[0]) //배열 1번쨰 찍어봄, 정확한지 확인
                
//                let tempArray = temp[0] as! NSDictionary
//                print(tempArray["bloggerlink"]!)
//                self.retStr1 = tempArray["bloggerlink"] as! String
//                self.retStr2 = tempArray["bloggername"] as! String
                
                self.retStr3.removeAll()
                
                //블로그 네임, 링크 10개 찍음
                //그러나 ui 쓰레드가 아니라서 에러난다. 자료는 넣지만 화면에 못뿌림. 다른 곳에서 처리를 해야. 비동기처리
                for i in 0..<temp.count{
                    var tempArray2 = temp[i] as! NSDictionary
                    print("배열" , tempArray2)
                   
                    self.retStr3.append("순번 : \(i)") // retStr3 에 계속 append
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
                
                
            } catch {
                print ("JSON Parsing Error")
            }
            
            

        }
        task.resume()
        
        return
    }
    
    
    
    
    
    //startTimer() 받으면 , update 한셋트 자동 호출함
    func startTimer(){
        self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
        stopCounter = false
    }

    @objc func update(){

        print("update")

        //10번 for문 돌아야 또는 stopCounter == true 여야 stopTimer
        if(count > 10 || stopCounter == true){
            self.stopTimer()
        }

        if /* retStr1 != "" || retStr2 != "" || */  retStr3 != "" {
//            myTextView.text = retStr1
//            myTextView.text.append("\n")
//            myTextView.text.append(retStr2)

             myTextView.text = retStr3
             stopCounter = true
        } else {
            count += 1
        }

    }

    func stopTimer(){
        self.timer?.invalidate()
        self.timer = nil
    }
    
    
    
}

