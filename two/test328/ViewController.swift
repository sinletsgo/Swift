//
//  ViewController.swift
//  test328
//
//  Created by 스마트금융과3 on 2018. 3. 28..
//  Copyright © 2018년 ssw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //변수 이곳에 선언하는게 맞음
    var m_switch : Bool = false;
    var m_image : Bool = false;
    
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var m_button: UIButton!
    
    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBOutlet weak var mySlider: UISlider!
    
    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var myTextView: UITextView!
    
    @IBOutlet weak var myImageView: UIImageView!
    

    @IBOutlet weak var i: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view, typically from a nib.
        // 처음 호출되었을 때 여기서 여러가지 할 수 있다
        myTextField.text = "hello world"
        myTextField.placeholder = "여기에 입력해보셔요!"
        myTextField.textColor = UIColor.white
        myTextField.backgroundColor = UIColor.black
        myTextField.textAlignment = NSTextAlignment.center
        myTextField.font = UIFont.systemFont(ofSize: 24)
        myTextField.keyboardType = UIKeyboardType.emailAddress
        myTextField.returnKeyType = UIReturnKeyType.done
        
        
        //이미지 불러오기
        myImageView.image = UIImage(named: "54375.jpg")
        myImageView.contentMode = UIViewContentMode.scaleAspectFit  //이미지 원본비율이냐 같은것
        
//        myImageView.contentMode = UIViewContentMode.scaleToFill  //이미지 늘려주네
        
        //
        myTextView.text = "프로그래밍 세계에 오신걸 환영해요"
        myTextView.textColor = UIColor.white
        myTextView.backgroundColor = UIColor.black
        myTextView.textAlignment = NSTextAlignment.left
        myTextView.font = UIFont(name: "AmericanTypewriter", size: 20)
        myTextView.isEditable = true
        myTextView.keyboardType = UIKeyboardType.URL
        myTextView.returnKeyType = UIReturnKeyType.send
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
  
    
    // 첫버튼 이벤트
    @IBAction func funcB(_ sender: Any) {
        // UIButton : 사용자가 누르면 무언가 하고 싶을 때
        m_button.setTitle("눌러주세요", for: UIControlState.normal)
        m_button.isEnabled = true  //한번 클릭 후 계속 동작여부.. false 하면 클릭 후 동작안함
        m_button.isSelected = false // 바탕색이 사라짐..
        
        myLabel.text = NSLocalizedString("Hello", comment:"")
        myLabel.textColor = UIColor.red
        myLabel.backgroundColor = UIColor.blue
        myLabel.textAlignment = NSTextAlignment.center
        myLabel.font = UIFont.systemFont(ofSize: 22)
        myLabel.numberOfLines = 0
        
        if let text =  myLabel.text{
            print(text)
            
        }
    }
    
    
    // 스위치
    @IBAction func SwitchC(_ sender: Any) {
        // UISwitch : 활성화 또는 비활성화를 선택할 때
        if (m_switch == true) {
            mySwitch.isOn = true
            mySwitch.onTintColor = UIColor.red
            mySwitch.thumbTintColor = UIColor.yellow
            m_switch = false
        }
        else
        {
            mySwitch.isOn = false
            mySwitch.onTintColor = UIColor.blue
            mySwitch.thumbTintColor = UIColor.black
            m_switch = true
        }
    }
    
    
    //슬라이더
    @IBAction func funcSlider(_ sender: Any) {
        mySlider.minimumValue = 0
        mySlider.maximumValue = 100
        
        mySlider.minimumTrackTintColor = UIColor.black
        mySlider.maximumTrackTintColor = UIColor.gray
        mySlider.isContinuous = true  //true 면 움직일때마다 계속 값 프린트
       // mySlider.value = 20. //값을 줄 수 있는것. 예시,
        print(mySlider.value)
    }
    
    
    @IBAction func closeButton(_ sender: Any) {
        print("Close Button clicked ok!")
        
        // alert 사용법 : https://stackoverflow.com/questions/24022479/how-would-i-create-a-uialertview-in-swift
        let alert = UIAlertController(title: "alert test!", message: myTextView.text, preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
         myTextView.resignFirstResponder()  //testview 창 빠져나감
    }
    
    
    
    //텍스트 입력하다가 closeButton 버튼 클릭하면서 빠져나오면 아래 프린트
    @IBAction func textFieldEditingEnd(_ sender: Any) {
        print("텍스트필드 입력 종료")
        print(myTextField.text)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    // 이미지변경 버튼 이벤트
    @IBAction func changeImageButton(_ sender: Any) {
        if (m_image == true) {
            myImageView.image = UIImage(named: "54375.jpg")
            myImageView.contentMode = UIViewContentMode.scaleAspectFit
            m_image = false
        }
        else
        {
            myImageView.image = UIImage(named: "h.jpeg")
            myImageView.contentMode = UIViewContentMode.scaleAspectFit
            m_image = true
        }
        
    }
    

    
    
    
    
    
    }
    
    
    


