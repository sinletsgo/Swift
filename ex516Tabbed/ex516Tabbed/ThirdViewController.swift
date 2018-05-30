//
//  ThirdViewController.swift
//  ex516Tabbed
//
//  Created by 스마트금융과3 on 2018. 5. 16..
//  Copyright © 2018년 ssw. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var m_dataTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let ap = UIApplication.shared.delegate as! AppDelegate
    
    override func viewWillAppear(_ animated: Bool) {
        
        let sunValue = ap.cmValue * 0.33
        m_dataTextField.text = String(sunValue)
    
        
    }

    @IBAction func btnClicked(_ sender: Any) {
        m_dataTextField.resignFirstResponder()
        
        if let text = m_dataTextField.text{
            
            if let sunValue = Double(text){
                ap.cmValue = sunValue / 0.33
            }
        }
    }
    
    
    
    

}
