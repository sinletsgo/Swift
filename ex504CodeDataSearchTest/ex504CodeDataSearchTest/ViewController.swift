//
//  ViewController.swift
//  ex504CodeDataSearchTest
//
//  Created by 스마트금융과3 on 2018. 5. 4..
//  Copyright © 2018년 ssw. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
 
    
    // Text
    @IBOutlet weak var MyTextField: UITextField!
    
    
    // text 입력 후 enter 치면 실행되는 영역
    @IBAction func MyTextFieldEnter(_ sender: Any) {
     
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let newdata = NSEntityDescription.insertNewObject(forEntityName: "SearchData", into: context)
        
        newdata.setValue( MyTextField.text, forKey: "testdata") //MyTextField.text 입력값을 save
        newdata.setValue("Corea", forKey: "password")  //password 값 설정해서 맨 마지막 입력된 데이터 가져오려고 구상
        
        do {
            
            try context.save()
            
            print(" CoreData Saved")
            
        } catch {
            
            print("There was an error")
            
        }
        
    
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("ViewWillAppear")
        
        //  시작 -------------------------------------------------------------------------------
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        
        // access core data by manageable variable
        let context = appDelegate.persistentContainer.viewContext
        
        let newdata = NSEntityDescription.insertNewObject(forEntityName: "SearchData", into: context)
        
        // 읽어오기--------------------------------------------------------------------------------------
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "SearchData") // SearchData
        
        request.predicate = NSPredicate(format: "password = %@", "Corea") // password = Corea 의미.
        // 즉 select * from SearchData where password = "Corea"
        
        
        do {
            //코어 데이터에 접근해서 전체 데이터 읽기
            let results = try context.fetch(request) // TOAD에서처럼 이렇게 된다 ->select * from SearchData where password = "Corea"
                                                      // {("aaa","Corea"),("bbb","Corea"),("ccc","Corea"),("ddd","Corea"),....}
            // 1개 이상의 로우가 있다면 if 문 진입
            if results.count > 0 {  // 주석 처럼 데이터 입력되었으면 4개가 들어오겠지
                //
                for result in results as! [NSManagedObject] { // result
                    
                    if let testdata = result.value(forKey: "testdata") as? String {
                        MyTextField.text = testdata //predicate 해서 마지막으로 CoraData 입력창에 입력된 값(testdata)을 현재 입력창에 대입시키고 출력~!
                        print("사용자 이전 입력값 \(testdata)")
                        
                        // 사실 좋은 프로그래밍은 아니다 내부 프로그램 로직?이 마지막에 입력한게 마지막으로 순서가 되게 했기에 이게 되는거지, 내부에서 순서가 바뀌거나 다르게 되면 corea 로 검색한게 마지막데이터가 아닐수 있다.
                        // coredata에 인덱스를 주어서 입력값마다 값매겨서 비교하는 로직을 추가시키는것이 좋다
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
        // Do any additional setup after loading the view, typically from a nib.
        
//        MyTextField.text = "hello"
    

        
      }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


     
}

