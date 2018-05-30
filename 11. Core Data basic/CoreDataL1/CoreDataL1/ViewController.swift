//
//  ViewController.swift
//  CoreDataL1
//
//  Created by 스마트금융과29 on 2018. 4. 30..
//  Copyright © 2018년 hwy. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        // ui 라던지, 관장하는 총 책임자 . 통해서 여러 접근 가능. 어딘가 접근하기 위함.
        // 저장하기
         let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        
         // access core data by manageable variable
         let context = appDelegate.persistentContainer.viewContext    // core data 접근 가능. 바이블처럼 사용
        
         let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context) //엔터티 테이블생각. 접근해서 넣어줌?
        
        newUser.setValue("황원용3", forKey: "username")
        newUser.setValue("비번", forKey: "password")
        
        
        // insert 동작
        do {
            
            try context.save()
            
            print("Saved")
            
        } catch {
            
            print("There was an error")
            
        }
        
        
        // 읽어오기 select 동작
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users") // request 가 entityName접근하기 위한 객체가 된다
        
        // request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.fetch(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    if let username = result.value(forKey: "username") as? String {
                        
                        print(username)
                        
                    }
                    
                }
                
                
            } else {
                
                print("No results")
                
            }
            
            
        } catch {
            
            print("Couldn't fetch results")
            
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

