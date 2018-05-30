//
//  ViewController.swift
//  ex516TableView
//
//  Created by 스마트금융과3 on 2018. 5. 16..
//  Copyright © 2018년 ssw. All rights reserved.
//

import UIKit


//추상클래스 상속 UITableViewDataSource, UITableViewDelegate . 선언. 상속받은
//처음 class 넣어주면 함수 없어서 오류뜬다. 에러창 클릭 해서 fix 클릭하면 자동으로 tableView 함수를 만들어준다
class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate { //낙타식 대문자 표기법
    
    @IBOutlet weak var myTableView: UITableView! //reuseIdentifier 위한 변수
    
    let testArray = ["apple", "pear", "banana", "strawberry"]
    
    let testArray2 = ["사과", "배", "바나나", "딸기"]
    
    
    
    //추상클래스 구현했으면 자동 호출 되는 tableView함수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4 // 4개의 행 보여주겠다
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //IndexPath는 행 뿌려질때 호출
        
        //style 셀의 모양결정, reuseIdentifier 뭘 재사용? tableView 여러개 사용할경우. 기존 메모리 올려놓은거를 재사용하는것, 재사용안하면 성능차이 남.
        //밑에 viewDidLoad 에 자세한 사용법
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "TestCell") //style: .subtitle
        
        
        
        
//        cell.textLabel?.text = "테스트"
        
        print(indexPath.row) // 현재 몇 행인지 정보 보기 위해
        
//        cell.textLabel?.text = testArray[indexPath.row]
        
        //행몇번째 섹션인지 모르겠다! 그럴때 아래처럼 코드 넣으면 쉽게 확인 가능
        cell.textLabel?.text = String(indexPath.section) + ":" + testArray[indexPath.row]
        
        //아래 code 처럼 row를 넣으면 행번호가 앞에 이렇게 0:apple , 1:pear, 2:banana .. 붙음.
//        cell.textLabel?.text = String(indexPath.row) + ":" + testArray[indexPath.row]
        
        
        cell.detailTextLabel?.text = testArray2[indexPath.row] //0:apple  밑에 사과 부분이 detailTextLabel
                                                               //  사과
        
        return cell //cell return 후 위에서 정해준만큼 (4 )다시 함수 반복
    }
    
    
     //4번 섹션 반복하겠다!!  4개 행 * 4번. = 16개
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    
    
    
    //추상함수 구현!  이름그대로 Section 안 header에 "Header" 로 명칭 지정!
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Header"
    }
    
    //Footer 에 "Footer"로 명칭 지정.
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Footer"
    }
    
    
    
    
     //reuseIdentifier 재사용하기 위해선 viewDidLoad 여기서 로드해야!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //관련내용 사이트
        // https://stackoverflow.com/questions/25347406/uitableview-registerclass-with-swift
        // https://www.hackingwithswift.com/example-code/uikit/how-to-register-a-cell-for-uitableviewcell-reuse
        // https://medium.com/ios-seminar/why-we-use-dequeuereusablecellwithidentifier-ce7fd97cde8e
        
        
        //위에 reuseIdentifier: "TestCell" code와 아래 forCellReuseIdentifier: "TestCell" 과
        // 이름이 같으면 사용가능! 재사용하면 더 속도가 빠르다.
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TestCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

