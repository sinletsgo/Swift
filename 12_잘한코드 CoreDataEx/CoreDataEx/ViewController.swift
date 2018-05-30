//
//  ViewController.swift
//  CoreDataEx
//
//  Created by 스마트금융과2 on 2018. 5. 4..
//  Copyright © 2018년 스마트금융과2. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    @IBOutlet weak var TxtField: UITextField!
    

    
    @IBAction func enterTxtField(_ sender: Any) {
        // 저장하기 시작 -------------------------------------------------------------------------------
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        
        // access core data by manageable variable
        let context = appDelegate.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "UserData", into: context)
        
        newUser.setValue(TxtField.text, forKey: "username")
        newUser.setValue("Corea", forKey: "password")
        
        do {
            try context.save()
            
            print("Inserted data is saved")
            
        } catch {
            print("There was an error")
            
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        // 주로 화면 처리를 초기화 하는 함수
        // print("ViewWillAppear")
       
        
        
        
        
        //  시작 -------------------------------------------------------------------------------
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        
        // access core data by manageable variable
        let context = appDelegate.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "UserData", into: context)
        
     
       
        // 읽어오기--------------------------------------------------------------------------------------
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserData")
        
        request.predicate = NSPredicate(format: "password = %@", "Corea")
        
        do {
            //코어 데이터에 접근해서 전체 데이터 읽기
            let results = try context.fetch(request)
            // 1개 이상의 로우가 있다면 if 문 진입
            if results.count > 0 {
                //
                for result in results as! [NSManagedObject] {
                    
                    if let username = result.value(forKey: "username") as? String {
                        TxtField.text = username
                        print("사용자 이전 입력값 \(username)")
                        
                    }
                    
                }
                
            } else {
                print("No results")
                
            }
            
            
        } catch {
            print("Couldn't fetch results")
            
        }
        
        
        
        
    }
    
override func viewDidLoad() {
    super.viewDidLoad()
    //        // Do any additional setup after loading the view, typically from a nib.
    //        // 뷰가 로딩되면 자동으로 함수 작동
    //        // 주로 변수를 초기화 할 때 사용하는 함수
    //        print("ViewDidLoad")
    //
    //
    //
    //        // 저장하기 시작 -------------------------------------------------------------------------------
    //        let appDelegate = UIApplication.shared.delegate as! AppDelegate
    //
    //
    //        // access core data by manageable variable
    //        let context = appDelegate.persistentContainer.viewContext
    //
    //        let newUser = NSEntityDescription.insertNewObject(forEntityName: "UserData", into: context)
    //
    //        newUser.setValue("kopo", forKey: "username")
    //        newUser.setValue("kopo02", forKey: "password")
    //
    //        do {
    //            try context.save()
    //
    //            print("Inserted data is saved")
    //
    //        } catch {
    //            print("There was an error")
    //
    //        }
    //
    //
    //        // 읽어오기--------------------------------------------------------------------------------------
    //
    //        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserData")
    //
    //        // predicate 구현---------------------------------------------------------
    //        // request.returnsObjectsAsFaults = false
    //        // %@는 입력된 문자열을 받는 곳
    //        request.predicate = NSPredicate(format: "username = %@", "o")
    //        // 쿼리문 = > select * from UserData where username = 'o'
    //        // ----------------------------------------------------------------------
    //        // request.returnsObjectsAsFaults = false
    //
    //        do {
    //            //코어 데이터에 접근해서 전체 데이터 읽기
    //            let results = try context.fetch(request)
    //            // 1개 이상의 로우가 있다면 if 문 진입
    //            if results.count > 0 {
    //                //
    //                for result in results as! [NSManagedObject] {
    //
    //                    if let username = result.value(forKey: "username") as? String {
    //
    //                        print(username)
    //                        print("1st if")
    //
    //                    }
    //                    if let username = result.value(forKey: "username") as? String {
    //
    //                        print(username)
    //                        print("2nd if")
    //                    }
    //
    //                // 지우기 시작-------------------------------------------------------------------------
    //
    //                    context.delete(result)
    //
    //                    do {
    //
    //                        try context.save()
    //                        print("The data is now deleted")
    //
    //                    } catch {
    //
    //                        print("Delete failed")
    //
    //                    }
    //
    //               // 지우기 끝남---------------------------------------------------------------------------
    //
    //               // 업데이트 시작--------------------------------------------------------------------------
    ////                    result.setValue("kopo student", forKey: "username")
    ////                    do {
    ////
    ////                        try context.save()
    ////
    ////                    } catch {
    ////
    ////                        print("Rename failed")
    ////
    ////                    }
    //               // 업데이트 끝남---------------------------------------------------------------------------
    //                print("----------------------------------------------------------------")
    //                }
    //
    //            } else {
    //                print("No results")
    //
    //            }
    //
    //
    //        } catch {
    //            print("Couldn't fetch results")
    //
    //        }
    //        // predicate 응용----------------------------------------------------------------
    //
    //        // 읽어오기 contains
    //        //https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/Predicates/Articles/pSyntax.html#//apple_ref/doc/uid/TP40001795-SW1
    //        print("----------------------------------------------------------------")
    //        let request2 = NSFetchRequest<NSFetchRequestResult>(entityName: "UserData")
    //
    //        var attributeName  = "username"
    //        var attributeValue = "ko"
    //
    //
    //        request2.predicate = NSPredicate(format: "%K CONTAINS %@", attributeName, attributeValue)
    //        //select * from userdata whre username like '%검색어%'
    //
    //        do {
    //
    //            let results = try context.fetch(request2)
    //
    //            if results.count > 0 {
    //
    //                for result in results as! [NSManagedObject] {
    //
    //                    if let username = result.value(forKey: "username") as? String {
    //
    //                        print(username)
    //                    }
    //                    if let pwd = result.value(forKey: "password") as? String {
    //
    //                        print(pwd)
    //                    }
    //                }
    //            }
    //        }catch {
    //
    //            print("Couldn't fetch results111")
    //
    //        }
    }
    

}

