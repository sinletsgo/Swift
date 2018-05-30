//
//  ViewController.swift
//  rockPaperScissors
//
//  Created by 스마트금융과17 on 2018. 4. 4..
//  Copyright © 2018년 Hanmin Lee. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    let randomSource = GKARC4RandomSource()
    
    @IBOutlet weak var computerImageView: UIImageView!
    
    @IBOutlet weak var playerImageView: UIImageView!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var LabelMe: UILabel!
    
    @IBOutlet weak var LabelComputer: UILabel!
    
    var winCountMe:Int = 0
    var winCountCom:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 180도의 라디안을 구합니다...
        let angle:CGFloat = CGFloat((180.0 * Double.pi) / 180.0)
        print("radian angle = ", angle)
        // 이미지 뷰를 회전시킵니다...
        computerImageView.transform = CGAffineTransform(rotationAngle: angle)
    }

    @IBAction func tabStart() {
        // 이미지 뷰에 바위를 출력합니다.
        computerImageView.image = UIImage(named: "rock.png")
        playerImageView.image = UIImage(named: "rock.png")
        // 레이블에 "가위 바위 ...." 를 출력합니다.
        messageLabel.text = "가위 바위 ...."
    }
    
    @IBAction func tabScissors() {
        playerImageView.image = UIImage(named: "scissors.png")
        doComputer(player: 0)
    }
    
    @IBAction func tabRock() {
        playerImageView.image = UIImage(named: "rock.png")
        doComputer(player: 1)
    }
    
    @IBAction func tabPaper() {
        playerImageView.image = UIImage(named: "paper.png")
        doComputer(player: 2)
    }
    var comStat = 0
    var msg = ""
    
    func doComputer(player:Int) {
        // 0~2 범위의 랜덤 값을 구합니다.
        let computer = randomSource.nextInt(upperBound: 3)
        if(comStat==0){
            switch computer {
            case 0:
                //가위
                computerImageView.image = UIImage(named: "scissors.png")
                switch player {
                case 0: //가위
                    msg = "다시!"
                    comStat = 0
                case 1: //바위
                    msg = "공격하세요!"
                    comStat = 2
                case 2: //보
                    msg = "제 공격입니다~"
                    comStat = 1
                default:
                    break
                }
                
            case 1:
                //바위
                computerImageView.image = UIImage(named: "rock.png")
                switch player {
                case 0: //가위
                    msg = "제 공격입니다~"
                    comStat = 1
                case 1: //바위
                    msg = "다시!"
                    comStat = 0
                case 2: //보
                    msg = "공격하세요!"
                    comStat = 2
                default:
                    break
                }
                
            case 2:
                //보
                computerImageView.image = UIImage(named: "paper.png")
                switch player {
                case 0: //가위
                    msg = "공격하세요!"
                    comStat = 2
                case 1: //바위
                    msg = "제 공격입니다~"
                    comStat = 1
                case 2: //보
                    msg = "다시!"
                    comStat = 0
                default:
                    break
                }
                
            default:
                break
            }
            
            
        }else if(comStat == 1){
            switch computer {
            case 0:
                //가위
                computerImageView.image = UIImage(named: "scissors.png")
                switch player {
                case 0: //가위
                    msg = "제가 이겼네요 ^^"
                    comStat = 0
                    winCountCom += 1
                case 1: //바위
                    msg = "공격해보세요!"
                    comStat = 2
                case 2: //보
                    msg = "또 제가 공격이네요 ㅋ"
                    comStat = 1
                default:
                    break
                }
                
            case 1:
                //바위
                computerImageView.image = UIImage(named: "rock.png")
                switch player {
                case 0: //가위
                    msg = "또 제가 공격이네요 ㅋ"
                    comStat = 1
                case 1: //바위
                    msg = "제가 이겼네요 ^^"
                    comStat = 0
                    winCountCom += 1
                case 2: //보
                    msg = "공격해보세요!"
                    comStat = 2
                default:
                    break
                }
                
            case 2:
                //보
                computerImageView.image = UIImage(named: "paper.png")
                switch player {
                case 0: //가위
                    msg = "공격해보세요!"
                    comStat = 2
                case 1: //바위
                    msg = "또 제가 공격이네요 ㅋ"
                    comStat = 1
                case 2: //보
                    msg = "제가 이겼네요 ^^"
                    comStat = 0
                    winCountCom += 1
                default:
                    break
                }
                
            default:
                break
            }
        }else if(comStat == 2){
            switch computer {
            case 0:
                //가위
                computerImageView.image = UIImage(named: "scissors.png")
                switch player {
                case 0: //가위
                    msg = "잘하시네요 ^^"
                    comStat = 0
                    winCountMe += 1
                case 1: //바위
                    msg = "계속 공격하세요!"
                    comStat = 2
                case 2: //보
                    msg = "이제 제 차례네요 ㅎㅎ"
                    comStat = 1
                default:
                    break
                }
                
            case 1:
                //바위
                computerImageView.image = UIImage(named: "rock.png")
                switch player {
                case 0: //가위
                    msg = "이제 제 차례네요 ㅎㅎ"
                    comStat = 1
                case 1: //바위
                    msg = "잘하시네요 ^^"
                    comStat = 0
                    winCountMe += 1
                case 2: //보
                    msg = "계속 공격하세요!"
                    comStat = 2
                default:
                    break
                }
                
            case 2:
                //보
                computerImageView.image = UIImage(named: "paper.png")
                switch player {
                case 0: //가위
                    msg = "계속 공격하세요!"
                    comStat = 2
                case 1: //바위
                    msg = "이제 제 차례네요 ㅎㅎ"
                    comStat = 1
                case 2: //보
                    msg = "잘 하시네요 ^^"
                    comStat = 0
                    winCountMe += 1
                default:
                    break
                }
                
            default:
                break
            }
        }
        
        messageLabel.text = msg
        
        result()
    }
    
    func result(){
        
        LabelMe.text = String(winCountMe)
        LabelComputer.text = String(winCountCom)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

