//
//  ViewController.swift
//  CoreData_Naver
//
//  Created by 스마트금융과10 on 2018. 5. 4..
//  Copyright © 2018년 jung. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myTextView: UITextView!
    
    let naverUrl = "https://openapi.naver.com/v1/search/blog?query="
    var retStr3:String = ""
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //읽어오기 [START]-----------------------------------------------
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "TextData")
        let context = appDelegate.persistentContainer.viewContext
        do{
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject]{
                    if let textdata = result.value(forKey: "textdata") as? String{
                        myTextField.text = textdata
                    }
                    
                }
                dataReq(inputParam: myTextField.text!)
            }else{
                print("No results")
            }
        } catch {
            print("Couldn't fetch results")
        }
        
        //읽어오기 [END]--------------------------------------------------
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func enterKeyTxtField(_ sender: Any) {
        
        //저장하기 [START]-----------------------------------------------
        
        let context = appDelegate.persistentContainer.viewContext
        let newData = NSEntityDescription.insertNewObject(forEntityName: "TextData", into: context)
        
        newData.setValue(myTextField.text, forKey: "textdata")
        
        
        do{
            try context.save()
            print("CoreData Saved")
        } catch{
            print("There was an error")
        }
        
        //저장하기 [END]-------------------------------------------------
        
        dataReq(inputParam: myTextField.text!)
    }
    
    
    func dataReq(inputParam: String){
        let userQuery = inputParam//myTextField.text
        
        //URL 인코딩  ex> 한국폴리텍대학 -> %ED%99%95~~~
        let encodingQuery = userQuery.addingPercentEncoding(withAllowedCharacters: .urlUserAllowed)
        
        //myUrl = URL(http://openapi.naver.com/.....+ ?query=%ED%99%95....)
        let myUrl = URL(string: (naverUrl + encodingQuery!))!
        
        //HTTP 통신시 세션을 공유한다.
        let session4 = URLSession.shared
        
        //HTTP Request 객체를 만든다.
        let request = NSMutableURLRequest(url: myUrl)
        
        //request.httpMethod = "POST" //POST 방식인 경우
        request.httpMethod = "GET"    //GET 방식인 경우
        
        //ID, Secret 설정 -> HTTP 헤더에 설정
        request.setValue("UJ7dmJw3j1CSvt6KZkok",forHTTPHeaderField: "X-Naver-Client-Id")
        request.setValue("pcVIB6jrQI", forHTTPHeaderField: "X-Naver-Client-Secret")
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData      //캐시 사용안함
        
        let taskTest = session4.dataTask(with: request as URLRequest, completionHandler: onFinish)
        
        taskTest.resume()
    }
    
    func onFinish(data: Data?, response: URLResponse?, error: Error?) {
        do{
            
            let array = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
            
            //------------------딕셔너리 변환---------------------------
            print(array)    // dictionaty key : value   예> apple:사과
            
            //-----------------KEY가 item인 Value를 추출-----------------
            print(array["items"]!) // array["key"] = "value"
            
            // {key:value, key:value, key:value}   ----> ["value", "value", "value",.....10items]
            let temp = array["items"] as! NSArray // 배열로 변환
            print(temp.count)  //["value","value","value",.....10items]  : 10
            
            self.retStr3.removeAll()
            for i in 0..<temp.count{
                let tempArray2 = temp[i] as! NSDictionary
                self.retStr3.append("순번 : \(i)")
                self.retStr3.append("\n")
                self.retStr3.append("블로거네임 : ")
                self.retStr3.append(tempArray2["bloggername"] as! String)
                self.retStr3.append("\n")
                self.retStr3.append("블로거링크 : ")
                self.retStr3.append(tempArray2["bloggerlink"] as! String)
                self.retStr3.append("\n")
                self.retStr3.append("-----------------")
                self.retStr3.append("\n")
            }
            
            //main thread가 아닌 곳에서 뭔가 처리를 하고 싶을 때
            DispatchQueue.main.sync(execute: {
                self.myTextView.text=retStr3
            })
        } catch {
            print ("JSON Parsing Error")
        }
        
    }

    
}

