//
//  DetailViewController.swift
//  ex530MasterDetail
//
//  Created by 스마트금융과3 on 2018. 5. 30..
//  Copyright © 2018년 ssw. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //detailDescriptionLabel 디테일뷰에 레이블 있었던 부분
    @IBOutlet weak var detailDescriptionLabel: UILabel!

    
    @IBOutlet weak var m_imgView: UIImageView!
    
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
//            if let label = detailDescriptionLabel {
//                label.text = detail.description
//            }
            
            // detail 통해 받아온 파일명(fireworks001)에 .jpg를 붙여서 UI이미지 객체를 만들어서
            // UIImageView 컴포넌트(m_imgView)에 전달하면 된다.
            // c언어 포인터 개념? if let으로 m_imgView 가져와서 이미지에 접근해야 한다.
            if let imageView = m_imgView{
                let fileName = "\(detail).jpg"
                imageView.image = UIImage(named: fileName)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
        
        title = "불꽃놀이" // Detail title 바꿀 수 있다.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //마스터뷰 에서 넘어올때 이곳에 자료 넘겨줌. 그리고 configureView() 호출함
    //as AnyObject? 바꿨으니 여기도 AnyObject 바꿔준다
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

