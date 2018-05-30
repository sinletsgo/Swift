//
//  ViewController.swift
//  ex418_1
//
//  Created by 스마트금융과3 on 2018. 4. 18..
//  Copyright © 2018년 ssw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myTextView: UITextView!
    let urlToRequest = "https://openapi.naver.com/v1/search/blog?query=" //Naver Open API URL
    
    var timer:Timer?    // 타이머가 있다는건 비동기처리 하고 있다는것
    var count = 0
    var stopCounter:Bool = false
    
    var retStr3:String = "" // 요청에 대해 응답 받은 값 넣을 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additiona¡l setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func textFieldEnter(_ sender: Any) {//엔터키 누르면
        print("엔터키 호출")
        dataRequest() //네이버 api 요청
        startTimer() // 비동기 작업 시작
    }
    func dataRequest() {
        // Naver Open API 호출
        // 0. 사용자가 입력한 검색어를 받아온다
        // 1. Naver Open API URL -> String
        // 2. ID, Secret(네이버 발급) -> HTTP Header
        // 3. 1+2 --> GET 방식으로 HTTP 호출
        // 4. Naver 서버 -> 응답(response)
        // 5. 응답 -> Parsing(내가 원하는 데이터를 추출)
        // 6. TextView 디스플레이
        
        
        // let tempData = "한국폴리텍대학교"
        let tempData = myTextField.text //사용자가 검색 입력한 값
        // URL 인코딩 ex> 한국폴리텍대학 -> %ED%99%95 ~~~~
        let encodingQuery = tempData!.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)//addingPercentEncoding 함수 호출하며 인코딩
        
        //요청 쿼리값 입력 ( "https://openapi.naver.com/v1/search/blog?query= 입력값"
        let myUrl = URL(string: (urlToRequest + encodingQuery!))!
        
        //HTTP 통신시 세션을 공유한다
        // !번외: 세션? 반영구적이고 상호작용적인 정보 교환
        // 서버에서는 30분간 자주 사용하는 것? 자신의 자산을 사용할 수 있게 사용자를 메모리에 올려서 세션시간을 준다. 사용안하면 만료시켜서 메모리 늘린다
        // 클라이언트에는 쿠키. 이걸 서버에선 쿠키 정보 보고 취향 등 파악
        let session4 = URLSession.shared
        
        //HTTP Request 객체를 만든다
        let request = NSMutableURLRequest(url: myUrl) // 상수로 지정된 myUrl로 request 보내기
        
        //request.httpMethod = "POST" // POST 방식인 경우
        request.httpMethod = "GET" // GET 방식인 경우
        
        //ID, Secret 설정 --> HTTP 헤더에 설정
        request.setValue("u7J2FnD5IUKhb_Upl9A9", forHTTPHeaderField: "X-Naver-Client-Id") //네이버 api id
        request.setValue("OCI6cVAbdJ", forHTTPHeaderField: "X-Naver-Client-Secret") // api secret
        
        //캐시 사용 안함. cachePolicy 캐쉬 데이터 무시하고 요청값 받아온다. 호출 할떄마다 매번 똑같은 정보일지라도 새롭게 받겠다! 원래 똑같은 정보면 캐시 데이터 사용
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        
        // POST 일 경우 아래 코드 형태로 HTTP Body 구성
        //let paramString = "data=Hello"
        //request.httpBody = paramString.data(using: String.Encoding.utf8)
        
        
       // let taks2 = session4.dataTask(with: request as URLResponse, completionHandler: onFinish) // onFinish(data, response, error)
        
        
        // 우선 task로 가지고 있고 밑에 task.resume()로 내려가서 다시 실행되면서 우선 요청(비동기) 보내놓는것. 그리고 응답을 받으면 그때서야 순서대로 아래 코드 실행
        // 중요한건 요청 보내놓고 응답을 못받았으면, 바로 myTextView에 아무것도 넣을 데이터가 없는거다. 그러니 타이머 이용해서 응답을 받아야만 데이터를 보여주려고 비동기처리를 하겠다는것.
        let task = session4.dataTask(with: request as URLRequest) { (data, response, error) in  //request 결과  data, response, error
            // 밑에 _ 건 안쓰는 변수일경우 이렇게 사용.
            guard let _: Data = data, let _: URLResponse = response, error == nil else { //검증. 데이터 받았으면 밑에 데이터수신으로 가는것 아니면 바로 밑에 error로 간다
                print("*****error")
                return
            }

            // 응답받은 데이터를 단순 문자열로 처리할 경우 아래와 같이 처리함
            // let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)

            print("----------------------데이터 수신-------------------")
            print(data!) // 일단 데이터 수신받으면 찍어본다.


            do{ //json 형식, Dictionary로 변환 아래 코드 넣고 array로 떨어짐
                // try, catch 한쌍. 만약 json ,Dictionary 오류나면 try가 잡아서 catch문으로 내려가서 실행된다
                let array = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
    
//                                  * Json              -->     NSDictionary {key:value, key:value, key:value, }
                //             [
                //             {key:value, key:value },
                //             {key:value, key:value },  -> as! NSDictionary
                //             {key:value, key:value },
                //             {key:value, key:value },
                //
                //             */
                
                // 꼭 딕셔너리로 안할 수 있는데, 연구가 필요. 아래에서 오류가 나니까.
                print("----------------------딕셔너리 변환-------------------")
                print(array) //Dictionary key: value 예> apple : 사과


                print("---------------------KEY가item인 Value를 추출-------------------")
                print(array["items"]!) // array["key"] = value
                //{key:value, key:value, key:value, }  ---> ["value","value","value","value",......10items ]
                
                let temp = array["items"] as! NSArray // 다시.. 배열로 변환
                print("---------------------배열의 크기는 -------------------")
                print(temp.count)
                // ["value","value","value","value",......10items ]


                print(temp[0]) //배열 1번쨰 찍어봄, 정확한지 확인

                //                let tempArray = temp[0] as! NSDictionary
                //                print(tempArray["bloggerlink"]!)
                //                self.retStr1 = tempArray["bloggerlink"] as! String
                //                self.retStr2 = tempArray["bloggername"] as! String
                
                // retStr3 기존 데이터 지우고 다시. 안그러면 계속 append 붙기때문에.
                self.retStr3.removeAll()

                //블로그 네임, 링크 10개 찍음
                //그러나 ui 쓰레드가 아니라서 에러난다. 자료는 넣지만 화면에 못뿌림. 다른 곳에서 처리를 해야. 비동기처리
                for i in 0..<temp.count{
                    //tempArray2 를 만든건 위에서 만든 temp 배열에서 bloggername, bloggerlink 이 2개를 가져오려고 만든거다.(Dictionary 형식으로 바꿔야 가져오기 쉽기 때문)
                    var tempArray2 = temp[i] as! NSDictionary
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


            } catch { //try가 잡으면 이리로 내려와서 아래 메세지 실행
                print ("JSON Parsing Error")
            }
        }
        task.resume() //반복

        return
    }

    // timer  없으면 null 값으로 데이터를 못 받아온다
    //startTimer() 받으면 , update 한셋트 자동 호출함
    //startTimer는 사용자가 검색하려고 엔터칠때 시작됨
    func startTimer(){
        self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
        stopCounter = false
    }



    @objc func update(){

        print("update")

        //10번 for문 도는 동안.. 응답못받을까.. stopCounter == true 여야 stopTimer
        // 10은 임의로 준것. 5번이여도 될것같으면 넣으면 되는것
        if(count > 10 || stopCounter == true){
            self.stopTimer()
        }

        if /* retStr1 != "" || retStr2 != "" || */  retStr3 != "" { //이걸 넣은 이유는 응답이 안오거나, 빈값으로 데이터가 들어올수도 있기에
            //            myTextView.text = retStr1
            //            myTextView.text.append("\n")
            //            myTextView.text.append(retStr2)
            
            //데이터가 들어왔으면 myTextView.text 에 넣고 , stopCounter = true 되면서 타이머 종료될것
            myTextView.text = retStr3
            stopCounter = true
        } else {
            count += 1
        }

    }

    func stopTimer(){
        self.timer?.invalidate() //invalidate 타이머 무력화
        self.timer = nil
    }


}




    


