//
//  ViewController.swift
//  ex411
//
//  Created by 스마트금융과3 on 2018. 4. 11..
//  Copyright © 2018년 ssw. All rights reserved.
//

import UIKit
import WebKit //WebKit 로드 해야 webView 사용시 오류 안난다

class ViewController: UIViewController {
    
    @IBOutlet weak var myWebView: WKWebView!
    
    @IBOutlet weak var depView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        //현재 WebView 방식
        let myURL = URL(string: "https://www.apple.com") // url 객체 생성
        let myRequest = URLRequest(url: myURL!) //!로 url이 정상이면 상수에 저장
        myWebView.load(myRequest) // 웹 로드!
        
        
        // 예전 WebView 방식
        // url이 정상일때만 들어간다. 더 안전한 패턴. http 사이트는 안들어가진다, info.plist 에서 수정하면 가능
        if let url = URL(string: "http://www.NAVER.com") {
//        if let url = URL(string: "https://www.apple.com") {
            // url이 nil이 아니라면 출력합니다.
            let urlreq = URLRequest(url: url)
            depView.loadRequest(urlreq)
        }
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}





