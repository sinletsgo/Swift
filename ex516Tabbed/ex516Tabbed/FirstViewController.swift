//
//  FirstViewController.swift
//  ex516Tabbed
//
//  Created by 스마트금융과3 on 2018. 5. 16..
//  Copyright © 2018년 ssw. All rights reserved.
//

import UIKit
    
class FirstViewController: UIViewController {

    @IBOutlet weak var m_dataTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    // AppDelegate에 접근할 수 있게 객체를 만든다.
    //UIApplication 가장 상위객체. 어떤 delegate원하냐 AppDelegate자료형으로 접근하겠다
    // ap는 이제 AppDelegate에서 선언한 cmValue에 ap.cmValue처럼 접근 가능한것
    let ap = UIApplication.shared.delegate as! AppDelegate
    

    
    
     // 화면을 출력할 때 호출된다.(오버라이드 함수)
    override func viewWillAppear(_ animated: Bool) {
        // appDelegate 변수에서 읽어서 화면(텍스트필드)에 표시
        m_dataTextField.text = String(ap.cmValue) //String으로 변환해서 m_dataTextField에 뿌리겠다
        
    }
    
    
    @IBAction func btnClicked(_ sender: Any) {
        //사용자가 입력(버튼 클릭시)시 텍스트필드 값을 appDelegate 변수에 적용(업데이트)
        
        // 키보드를 닫는다.
        m_dataTextField.resignFirstResponder()
        
        //옵셔널 바인딩 “만일 m_dataTextField가 값을 가지고 있다면, 이것을 꺼내서 (1)text에 값을 대입하고, (2) 조건문 블록을 실행하라
        if let text = m_dataTextField.text{ //if let 하나의 문장처럼 사용. 즉 text에 값이 들어갔다면 다음으로.
            
            if let cmValue = Double(text){ //if let보호. text가 Double로 변환이 안되면 cmValue값이 안들어감. 그러면 다음으로 안넘어간다
                //만약 한글로 text에 들어가면 변환이 안되겠지.
                ap.cmValue = cmValue
            }
        }
        
    }
    
    
    

    
    
    

}

