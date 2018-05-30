//
//  ViewController.swift
//  ex411-2
//
//  Created by 스마트금융과3 on 2018. 4. 11..
//  Copyright © 2018년 ssw. All rights reserved.
//

import UIKit
import SafariServices  //Safari 모듈 호출

class ViewController: UIViewController, SFSafariViewControllerDelegate{ //SFSafariViewControllerDelegate class 상속
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func tapBtnSafari(_ sender: Any) {
        print("호출되었습니다")
        if let myurl = URL(string: "https://www.naver.com") {
            // url이 nil이 아니라면 SFSafariViewController를 출력
            
            // 공식 같이 약속한 대로 아래 코드 넣으면 사파리 웹 불러 온다
            let vc = SFSafariViewController(url: myurl)
            vc.delegate = self
            present(vc, animated: true, completion: myCallBack)    //myCallBack 은 정상적으로 브라우저가 다 열리면 실행
            // "Open with safari view controller", to see the content now being displayed inside a SFSafariViewController instance.
        }
    }
    
    func myCallBack(){
        print("safari 브라우저 열림")
    }
    
    // 브라우저 닫으면 safariViewControllerDidFinis(class에서 약속되있는 매서드다) 를 실행한다!  우클릭 jump to defintion 가면 이미 class에 정의되있음
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        print("Safari Close")
    }
    
    
    
    
    
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBAction func imgLoadingBtn(_ sender: Any) {
        // 이미지 출처 : https://pixabay.com/ko/.  // 무료 이미지 많은 고화질
        //버튼 눌렀을때, url 가져와야!
        let stringURL = "https://cdn.pixabay.com/photo/2017/04/10/15/06/japan-2218781_1280.jpg" //https 만 허용. 보안정책 풀어야 뿌려줌
        if let url = URL(string: stringURL) {
            // url이 nil이 아니라면 변환
            if let data = NSData(contentsOf: url) { //NSData 정석. 이렇게 씀. 이것도 jump to.. 하면 class 유추가능
                // 변환된 data를 출력
                myImageView.image = UIImage(data: data as Data) //Data 자료형으로 변환하겠다. 공식이다
            }
        }
    }

    
    
    
    @IBAction func buttonTextLoad(_ sender: Any) {
        //요청하기!
        // 1. URL -> request ---- server ---> Response (text file: .txt)

        // robots.txt : 구글의 봇이 자신의 웹 페이지를 어떻게 크롤하고 색인붙이는 지를 제어해주는 파일인 'robots.txt'을 활용해 구글에 특정 폴더와 디렉토리는 크롤할 필요가 없음을 말해주는 것이다.
        // 즉 허용, 비허용 등을 정의해준다.
     
        if let url = URL(string: "https://www.google.com/robots.txt") {
            // url이 nil이 아니라면 URLSession 객체 생성
            let urlSession = URLSession.shared  //공식. URLSession를 shared한다고 생각
            // 비동기다. 우선 읽으라고 지시해놓고 조금 후 데이터를 읽어들이는 태스크를 완료하면 completionHandler 처리가 수행된다
            let task = urlSession.dataTask(with: url, completionHandler: onFinish)  //urlSession개체를 만들어서 실행
            task.resume()  //request -> ---SERVER ---> response : onFinish --> text data
        }
    }
    
    //요청에 대해 응답받은 데이터! 처리하는 메서드
    // 2. respone -> var text:String -> alert popup
    //똑같이 라이브러리 처럼 복사 붙여넣기 하는것. 하면서 수정하는거다. 외워서 쓰는 사람 없음.
    //단순한것!
    // 읽어들이기를 완료했을 때 호출할 메서드(이름은 자유)
    func onFinish(data: Data?, response: URLResponse?, error: Error?) {
        // Raw 데이터를 UTF8 문자열로 변환
        if let nsstr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) { //utf8 지금 산업표준 거의 웹에선 문제없다
            // UTF8 문자열로 변환되면 일반적인 문자열로 변환
            let str = String(nsstr)
            // 문자열 출력
            print("문자열=[\(str)]")
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 200 { //성공하면 code는 200
                    print("Success")
                    
                    // alert 사용법 : https://stackoverflow.com/questions/24022479/how-would-i-create-a-uialertview-in-swift
                    let alert = UIAlertController(title: "결과", message: str, preferredStyle: UIAlertControllerStyle.alert)
                    
                    // add an action (button)®®
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    alert.addAction(UIAlertAction(title: "??", style: UIAlertActionStyle.default, handler: nil))
                    
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                }
                else{ // 404 page not found. 503 internal server error, 403 forbidden..
                    print("Error" + "\(response.statusCode)")   //response.statusCode 까지 넣으면 오류 코드 보여준다
                }
            }
        }
        
    }
    
    
    
    
    
    
    
    
    
    


}

