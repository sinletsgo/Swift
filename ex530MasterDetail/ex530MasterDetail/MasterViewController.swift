//
//  MasterViewController.swift
//  ex530MasterDetail
//
//  Created by 스마트금융과3 on 2018. 5. 30..
//  Copyright © 2018년 ssw. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
//    var objects = [Any]()
//    var objects = ["a", "b"]
    var objects = ["fireworks001", "fireworks002", "fireworks003", "fireworks004",
                   "fireworks005", "fireworks006", "fireworks007"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // edit button
//        navigationItem.leftBarButtonItem = editButtonItem
        
        
        // + button
//        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
//        navigationItem.rightBarButtonItem = addButton
//        if let split = splitViewController {
//            let controllers = split.viewControllers
//            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
//        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // + button 이벤트 처리 부분
//    @objc
//    func insertNewObject(_ sender: Any) {
//        objects.insert(NSDate(), at: 0)
//        let indexPath = IndexPath(row: 0, section: 0)
//        tableView.insertRows(at: [indexPath], with: .automatic)
//    }

    // MARK: - Segues
    //티테일뷰 넘어갈때 셋팅하는곳
    // 넘어갈때 자동 호출
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow { // 선택한 row 부분
                let object = objects[indexPath.row] //as! NSDate // 강제변환부분 주석처리
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object as AnyObject? //  이 부분도 AnyObject 로 수정함//detailItem 에 object 데이터 넣어서 전달
                
                //DetailViewController 에 왼쪽 위에 돌아가기 버튼 구성해주는 code 맞나?
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View
    //
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1 // 1개 행 보여준다
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count //objects count 만큼 반복한다 여기선 7개니까 7번
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // find cell 해보면. Cell이라는 id를 가진게 곧 Master에 Title 이다. 가져왔으면 밑으로 내려가서 우리가 만든 데이터를 리턴하면서 cell을 구성하는것
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        //NSDate 주석처리. 문자열로 바꿨으니까.
        //print(indexPath) //[0,0], [0,1], [0,2]....
        let object = objects[indexPath.row] //as! NSDate //NSDate 시간. objects에 데이터가 있다. 위에 변수있음. row값 10개면 10번 호출 0 a , 1 b호출 2번호출
        cell.textLabel!.text = object.description //object 가져와서 text로 뿌려준다
        return cell //자체 함수내에서 tableView을 자동으로 호출한다. return 하면서 cell을 구성하는것!
    }
    
    
    
//    // cell에 edit 가능여부
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//    
//    // edit delete 등 이벤트 처리부분
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            objects.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//        }
//    }


}

