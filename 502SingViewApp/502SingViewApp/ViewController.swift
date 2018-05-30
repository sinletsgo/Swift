//
//  ViewController.swift
//  502SingViewApp
//
//  Created by 스마트금융과3 on 2018. 5. 1..
//  Copyright © 2018년 ssw. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    
    //랜덤 생성한 색상값 표시 lable
    @IBOutlet weak var m_colorLable: UILabel!
    
    //GKARC4RandomSource 랜덤 생성 소스
    let m_randomSource = GKARC4RandomSource() //random generate
    var m_colorR = 0 // Red
    var m_colorG = 0 // Green
    var m_colorB = 0 // Blue
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //button
    @IBAction func btnShowColor(_ sender: Any) {

    }
    
    
    // segue 웨이라는 자료. 인지가능.
    // UIStoryboardSegue를  파라미터로 정의. 비상구 구멍에서 자동인지 하도록 애플에서 정해놓은것
    // exit로 returnMainWithSegue 로 연결한 back button을 클릭하면 호출되는 함수
    @IBAction func returnMain(segue: UIStoryboardSegue){
        print("screen #1 Returned!")
    }
    
    
    // viewWillAppear 즉 view 뿌려질때 자동호출 함수
    // 약속된 메서드. 첫화면 뜰때 호출된다 부모메서드 재정의한것. 오버라이드
    override func viewWillAppear(_ animated: Bool) {
        // R  G B 랜덤하게 받아오기
        // 원래 rgb 0~255 지만 랜덤 소스 내에선 256까지 해야 255까지 가져온다.
        m_colorR = m_randomSource.nextInt(upperBound: 256)
        m_colorG = m_randomSource.nextInt(upperBound: 256)
        m_colorB = m_randomSource.nextInt(upperBound: 256)
        
        // 레이블에 3개의 값을 출력
        m_colorLable.text = "R=\(m_colorR), G=\(m_colorG), B=\(m_colorB)"
    }
    
    // 세그웨이 전활할떄, view가 전활될떄, 즉 Modally 될때 실행 함수. 내부에 있는 함수다
    // 즉 다버깅 해보면 2번쨰 화면 넘어갈때 자동으로 호출된다
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("screen #2 호출")
        // 변경될 화면을 추출
        // 2번째 화면 (-> dispColorViewController 클래스)으로 rgb 값 전달하기
        // nextvc 객체다.  segue를 추가화면인 dispColorViewController 로 변환한다!
        let nextvc = segue.destination as! dispColorViewController
        // student student1 = new Student()
        // nextvc = new dispColorViewController()
        
        // 변경될 화면에 있는 변수에 값을 전달 . 여기서 임무 끝 2번째 화면으로 넘어간다
        nextvc.colorRed = m_colorR
        nextvc.colorGreen = m_colorG
        nextvc.colorBlue = m_colorB
        
    }
    
    

    
    
}

