//
//  SecondViewController.swift
//  ex516Tabbed
//
//  Created by 스마트금융과3 on 2018. 5. 16..
//  Copyright © 2018년 ssw. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var m_dataTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    let ap = UIApplication.shared.delegate as! AppDelegate
    
    override func viewWillAppear(_ animated: Bool) {
        let inchValue = ap.cmValue * 0.3937
        m_dataTextField.text = String(inchValue)
        
    }
    
    
    @IBAction func btnClicked(_ sender: Any) {
        m_dataTextField.resignFirstResponder()
        
        if let text = m_dataTextField.text{
            
            if let inchValue = Double(text){
                ap.cmValue = inchValue / 0.3937
            }
        }
        
        
    }
    
}


