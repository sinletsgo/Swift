//
//  ViewController.swift
//
//
//  Created by 스마트금융과 on 2018. 4. 25..
//  Copyright © 2018년. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    
    var m_switch:Bool = false
    
    let randomSource = GKARC4RandomSource()
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myBtn: UIButton!
    @IBOutlet weak var myImgView: UIImageView!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var myTextView: UITextView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        myImgView.image = UIImage(named: "KoreaFlag.jpg")
        if let url = URL(string: "https://www.google.com/robots.txt") {
            let urlSession = URLSession.shared
            let task = urlSession.dataTask(with: url, completionHandler: onFinish)
            task.resume()
        }
    }
    
    func onFinish(data: Data?, response: URLResponse?, error: Error?) {
        if let nsstr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) {
            let str = String(nsstr)
            print("문자열=[\(str)]")
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    
                    
                    DispatchQueue.main.sync(execute: {
                        self.myTextView.text = str
                    })
                    
                }
                else{
                    print("Error" + "\(response.statusCode)")
                }
            }
        }
    }
    
    
    @IBAction func myButton(_ sender: Any) {
        myLabel.text = "이한민"
    }
    
    
    @IBAction func funcSwitchChanged(_ sender: Any) {
    
        
        if(m_switch == true)
        {
            mySwitch.isOn = true
            doComputer()
            m_switch = false
            
        }
        else
        {
            mySwitch.isOn = false
            doComputer()
            m_switch = true
        }
    }
    
    func doComputer() {
        let computer = randomSource.nextInt(upperBound: 8)
        switch computer {
        case 0:
            myImgView.image = UIImage(named: "KoreaFlag.jpg")
            
        case 1:
            myImgView.image = UIImage(named: "CanadaFlag.jpg")
            
        case 2:
            myImgView.image = UIImage(named: "USFlag.jpg")
        
        case 3:
            myImgView.image = UIImage(named: "England.jpeg")
            
        case 4:
            myImgView.image = UIImage(named: "India.jpeg")
        
        case 5:
            myImgView.image = UIImage(named: "Jamaica.jpeg")
        
        case 6:
            myImgView.image = UIImage(named: "Japan.jpeg")
            
        case 7:
            myImgView.image = UIImage(named: "Senegal.jpeg")
            
       
        default:
            break
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
