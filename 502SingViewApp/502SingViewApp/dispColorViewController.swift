//
//  dispColorViewController.swift
//  502SingViewApp
//
//  Created by 스마트금융과3 on 2018. 5. 1..
//  Copyright © 2018년 ssw. All rights reserved.
//

import UIKit
import GameplayKit

class dispColorViewController: UIViewController {
    
    // 1번 화면에서 보내준값 받는 변수
    var colorRed = 0;
    var colorGreen = 0;
    var colorBlue = 0;
    
    @IBOutlet weak var m_colorLable: UILabel!
    
    // new random start
    let m_randomSource = GKARC4RandomSource() //random generate
    var m_colorR = 0 // Red
    var m_colorG = 0 // Green
    var m_colorB = 0 // Blue
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(colorRed)
        print(colorGreen)
        print(colorBlue) //잘 받아오고 있음 확인 가능
        
        let backColor = UIColor(red: CGFloat(colorRed) / 256.0, green: CGFloat(colorGreen) / 256.0, blue: CGFloat(colorBlue) / 256.0, alpha: 1.0)
        view.backgroundColor = backColor 
        
        
        //각 변수에 random number 대입
        m_colorR = m_randomSource.nextInt(upperBound: 256)
        m_colorG = m_randomSource.nextInt(upperBound: 256)
        m_colorB = m_randomSource.nextInt(upperBound: 256)
//        // 레이블에 3개의 값을 출력
        m_colorLable.text = "R=\(m_colorR), G=\(m_colorG), B=\(m_colorB)"
        
    }
    
    //3번에서 2번 seque 호출시 실행되는 함수
    @IBAction func returnMain2(segue: UIStoryboardSegue){
        print("screen #2 Returned!")
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("screen #2 호출")

        // 2번 화면 입장에서는 view가 전활될때 1번인지, 3번인지 헷갈린다. subViewController 강제형변환 시키면 오류난다
        // 그래서 if문으로 ? 넣어주어서 subViewController로 강제 형변환 해보고 문제 없으면 값 넣고 실패하면 밖으로 나옴.
        // 그러면 1번화면 넘어갈 때 오류 없이 넘어갈 수 있다.
        // 실제 코딩시 이렇게 사용하는 경우 종종 있다. 무조건 에러 없이 넘어가게 할떄!
        
        //  let nextvc = segue.destination as! subViewController // 무조건 강제형변환!
        
        if let nextvc = segue.destination as? subViewController {
            nextvc.colorRed = m_colorR
            nextvc.colorGreen = m_colorG
            nextvc.colorBlue = m_colorB
        }
        
    }
    
    
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


