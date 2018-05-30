//
//  ViewController.swift
//  buttonTest
//
//  Created by 스마트금융과29 on 2017. 12. 19..
//  Copyright © 2017년 hwy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    
    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBOutlet weak var mySlider: UISlider!
    
    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var myTextView: UITextView!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBAction func tapTouchDown(_ sender: Any) {
        // UIButton : 사용자가 누르면 무언가 하고 싶을 때
        myButton.setTitle("눌러주세요", for: UIControlState.normal)
        myButton.isEnabled = true
        myButton.isSelected = true
    }
    @IBAction func tapBtn() {
        // myLabel.text = "안녕하세요?"
        
        // UILabel : 간단한 문자를 화면에 출력할 때
        // myLabel.text = "안녕하세요!"
        myLabel.text = NSLocalizedString("Hello", comment:"")
        
        myLabel.textColor = UIColor.blue
        myLabel.backgroundColor = UIColor.cyan
        myLabel.textAlignment = NSTextAlignment.center
        myLabel.font = UIFont.systemFont(ofSize: 20)
        myLabel.numberOfLines = 0
        
        print(myLabel.text)
        if let text = myLabel.text {
            print(text)
        }
    }
    @IBAction func switchChanged(_ sender: Any) {
        // UISwitch : 활성화 또는 비활성화를 선택할 때
        mySwitch.isOn = true
        mySwitch.onTintColor = UIColor.red
        mySwitch.thumbTintColor = UIColor.yellow
        
        
    }
    @IBAction func sliderChanged(_ sender: Any) {
        
        // UISlider : 슬라이드해서 값을 입력할 때
        mySlider.minimumValue = 0
        mySlider.maximumValue = 100
        //mySlider.value = 20
        mySlider.minimumTrackTintColor = UIColor.blue
        mySlider.maximumTrackTintColor = UIColor.red
        mySlider.isContinuous = true
    }
    @IBAction func sliderEditingEnd(_ sender: Any) {
        print(mySlider.value)
    }
    @IBAction func sliderTouchExit(_ sender: Any) {
        print(mySlider.value)
    }

    
    @IBAction func textFieldDidEndOnExit(_ sender: Any) {
        
        print("텍스트필드 입력 종료")
        print(myTextField.text)
    }
    
    @IBAction func closeBtn(_ sender: UIButton) {
        print("Close Button clicked")
        myTextView.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myTextField.text = "안녕하세요!"
        myTextField.placeholder = "여기에 입력해주세요!"
        myTextField.textColor = UIColor.blue
        myTextField.backgroundColor = UIColor.cyan
        myTextField.textAlignment = NSTextAlignment.center
        myTextField.font = UIFont.systemFont(ofSize: 24)
        myTextField.keyboardType = UIKeyboardType.emailAddress
        myTextField.returnKeyType = UIReturnKeyType.done
        
        
        // UITextView : 긴 글자를 출력하거나 입력받을 때
        myTextView.text = "안녕하세요!"
        myTextView.textColor = UIColor.blue
        myTextView.backgroundColor = UIColor.cyan
        myTextView.textAlignment = NSTextAlignment.right
        myTextView.font = UIFont(name: "AmericanTypewriter", size: 20)
        myTextView.isEditable = true
        myTextView.keyboardType = UIKeyboardType.URL
        myTextView.returnKeyType = UIReturnKeyType.send
        
        myImageView.image = UIImage(named: "TestBerry.jpg")
        myImageView.contentMode = UIViewContentMode.scaleAspectFit
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

