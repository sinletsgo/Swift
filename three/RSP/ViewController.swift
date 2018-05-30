//
//  ViewController.swift
//  RSP
//
//  Created by 스마트금융과3 on 2018. 4. 4..
//  Copyright © 2018년 ssw. All rights reserved.
//

import UIKit
import GameplayKit
class ViewController: UIViewController {
    let randomSource = GKARC4RandomSource()
    
    
    @IBOutlet weak var computerImageView: UIImageView!
    
    
    @IBOutlet weak var playerImageView: UIImageView!
    
    
    @IBOutlet weak var messageLabel: UILabel!
    
    
    @IBOutlet weak var labelMe: UILabel!
    
    @IBOutlet weak var labelCom: UILabel!
    
    var winCountMe:Int = 0
    var winCountCom:Int = 0
    
    
    
    @IBAction func tapStart(_ sender: Any) {
        computerImageView.image = UIImage(named: "rock.png")
        playerImageView.image = UIImage(named: "rock.png")
        messageLabel.text = "가위 바위...."
    }
    
    
    @IBAction func tapScissors(_ sender: Any) {
        playerImageView.image = UwIImage(named: "scissors.png")
        doComputer(player: 0)
    }
    
    @IBAction func tapRock(_ sender: Any) {
        playerImageView.image = UIImage(named: "rock.png")
        doComputer(player: 1)
    }
    
    @IBAction func tapPaper(_ sender: Any) {
        playerImageView.image = UIImage(named: "paper.png")
        doComputer(player: 2)
    }
    
    
    //
    func doComputer(player: Int) {
        let computer = randomSource.nextInt(upperBound: 3)
        var msg = ""
        
        
        switch computer {
            // 가위
        case 0:
            computerImageView.image=UIImage(named : "scissors.png")
            switch player{
            case 0:  //가위
                msg = "비겼습니다"
            case 1:  //주먹
                msg = "victory!"
                winCountMe += 1
            case 2:  //보
                msg = "loser!"
                winCountCom += 1
            default:
                break
            }
        case 1:
            // 바위
            computerImageView.image = UIImage(named: "rock.png")
            switch player {
            case 0: // 가위
                msg = "졌습니다ㅠㅁㅜ"
                winCountCom += 1
            case 1: // 바위
                msg = "비겼어요!"
            case 2: // 보
                msg = "you winner!"
                winCountMe += 1
            default:
                break
            }
        case 2:
            // 보
            computerImageView.image = UIImage(named: "paper.png")
            switch player {
            case 0: // 가위
                msg = "아싸 승"
                winCountMe += 1
            case 1: // 바위
                msg = "졌잘싸.."
                winCountCom += 1
            case 2: // 보
                msg = "똑같은거 내지마!"
            default:
                break
            }
            
        default:
            break
        }
        messageLabel.text = msg
        result()
    }
    
    func result(){
        
        labelMe.text = String(winCountMe)
        labelCom.text = String(winCountCom)
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // https://www.hackingwithswift.com/example-code/uikit/how-to-scale-stretch-move-and-rotate-uiviews-using-cgaffinetransform
        // 180도의 라디안을 구합니다.
        let angle:CGFloat = CGFloat((180.0 * Double.pi) / 180.0)
        
        print("radian angle = ", angle)
        // 이미지 뷰를 회전시킵니다.
        computerImageView.transform = CGAffineTransform(rotationAngle: angle)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

