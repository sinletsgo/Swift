//
//  ViewController.swift
//  ex504CoreData
//
//  Created by 스마트금융과3 on 2018. 5. 4..
//  Copyright © 2018년 ssw. All rights reserved.
//

import UIKit
import CoreData //import 해주기

class ViewController: UIViewController {

    @IBOutlet weak var saveData: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 변수초기화시 사용
        // viewDidLoad - > viewWillAppear 순으로 load 된다
        
        
        // AppDelegate는 ui 라던지, 관장하는 총 책임자. 이를 통해서 여러 접근 가능. 어딘가 접근하기 위함.
        
        // 저장하기 [START] ----------------------------------------
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        // access core data by manageable variable
        let context = appDelegate.persistentContainer.viewContext    // core data 접근 가능. 바이블처럼 사용

        let newUser = NSEntityDescription.insertNewObject(forEntityName: "UserData", into: context) //엔터티 테이블생각. 접근해서 넣어줌

        newUser.setValue("성우123", forKey: "username")
        newUser.setValue("1234", forKey: "password")

        // insert 동작
        do {

            try context.save()

            print(" CoreData Saved")

        } catch {

            print("There was an error")

        }
        
        // 저장하기 [END] --------------------------
    
        
        
        
        // 여러건 저장하기 [START] ----------------------------------------
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//
//
//        // access core data by manageable variable
//        let context = appDelegate.persistentContainer.viewContext
//
//        //let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
//
//
//        do{
//            let newUser = NSEntityDescription.insertNewObject(forEntityName: "UserData", into: context)
//            newUser.setValue("신1234", forKey: "username")
//            newUser.setValue("비번1234", forKey: "password")
//            try context.save()
//        }catch {
//
//            print("There was an error")
//
//        }
//
//        do{
//            let newUser = NSEntityDescription.insertNewObject(forEntityName: "UserData", into: context)
//            newUser.setValue("신5678", forKey: "username")
//            newUser.setValue("비번5678", forKey: "password")
//            try context.save()
//        }catch {
//
//            print("There was an error")
//
//        }
        
        // 여러건 저장하기 [END] ----------------------------------------
        
        // 복붙 잘해도, 함수 쓰고, 디자인패턴, 점점 커져서 잘 활용하게 된다.  벽돌에서 철제 모듈 쭉~
    
        // 읽어오기 [START] --------------------------------select 동작
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserData") // request 가 entityName접근하기 위한 객체가 된다
        
        // request.returnsObjectsAsFaults = false
        

        // predicate 1 [START] --------------------------------
        // predicate는 조건을 주는거다. 주석처리하고 안해도 되지만, 조건에 맞는것으로 가져오려면 쓰는것
        request.predicate = NSPredicate(format: "username = %@", "성우123") //SELECT * FROM UserData WHERE username - "성우123"  맞는걸 찾으라는것! 쌍으로 가져오기 때문에 password도 같이 읽어온다
        // request.predicate = NSPredicate(format: "password = %@", "1234")
        // predicate 1 [END] --------------------------------s
        
                do {
        
                    let results = try context.fetch(request) // fetch request 결과 가져와서 처리하겠다는것!
        
                    if results.count > 0 { // 0보다 크다는건 데이터가 있다는것, 즉 데이터가 있으면 다음 넘어가 반복한다!
                        
                        for result in results as! [NSManagedObject] { //NSManagedObject 여기서 부터 똑같이 패턴, results는 insert 데이터 결과로써 계속 모아둔다, 그만큼 반복해서 읽어와야 모든 데이터 읽어오는것.
        
                            if let username = result.value(forKey: "username") as? String { // 키값 유저네임 주고 print 찍고
                                print("username: ", username)
        
                            }
                            if let password = result.value(forKey: "password") as? String {
                                
                                print("password: ", password)
                                
                                print("results: ", results)
                                print("result: ", result)
                            }
                            
                            // 지우기 [START] ---------------------------
                            // 지우기 code 주석 처리 후 실행하면 계속 데이터 쌓인다. 주석 해제후 newUser.setValue 주석하고 다시 실행하면 데이터 삭제된것 확인가능
                            
//                            context.delete(result)    commit. 다 지워지니, Core Data 에 남아있지 않음.
//                            do {
//
//                                try context.save()
//
//                            } catch {
//
//                                print("Delete failed")
//
//                            }
                            
                            
                            // 지우기 [END] ---------------------------
                            
                            
                            
                            
                            // 업데이트 [START] ---------------------------
                            // 지우기 주석 처리한뒤 실행해서 업데이트 하고, 재실행하면 업데이트 된 자료가 조회가 된다
                            /*
                            result.setValue("shin sung", forKey: "username")
                            do {

                                try context.save()

                            } catch {

                                print("Rename failed")

                            }
                            */
                            // 업데이트 [END] ---------------------------
                            
                        }
 
 
                    } else {
        
                        print("No results")
 
                    }
 
 
                } catch {
 
                    print("Couldn't fetch results")
 
                }
        
        // 읽어오기 END -----------------------------
        
        
        // predicate 응용 [START] ---------------------------
        // 읽어오기 contains
        // https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/Predicates/Articles/pSyntax.html#//apple_ref/doc/uid/TP40001795-SW1
        print("----------------------------------------------------------------")
        
        let request2 = NSFetchRequest<NSFetchRequestResult>(entityName: "UserData")
        
        var attributeName  = "username" // 포함하는걸 원한다 밑에 %K CONTAINS %@ 로 들어간다
        var attributeValue = "신"
        //NSPredicate predicate   = [NSPredicate predicateWithFormat:@"%K like %@",attributeName, attributeValue]
        
        request2.predicate = NSPredicate(format: "%K CONTAINS %@", attributeName, attributeValue) // SELECT * FORM UserName WHERE username like '%황원용%'  즉 포함하면 가져와라
        
        
        do {
            
            let results = try context.fetch(request2)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    if let username = result.value(forKey: "username") as? String {
                        
                        print(username)
                    }
                    if let pwd = result.value(forKey: "password") as? String {
                        
                        print(pwd)
                    }
                }
            }
        } catch {
            
            print("Couldn't fetch results111")
            
        }
        
    }
    
 
        override func viewWillAppear(_ animated: Bool) {
         //주로 화면 처리 (초기) 에 사용됨. 이때 실행된다
            print("viewWillAppear start")
            
        }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       //  Dispose of any resources that can be recreated.
    }


}

