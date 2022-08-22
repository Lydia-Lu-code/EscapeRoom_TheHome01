//
//  LobbyViewController.swift
//  EscapeRoom_TheHome01
//
//  Created by 維衣 on 2022/2/3.
//

import UIKit

class LobbyViewController: UIViewController {

    @IBOutlet var LobbyButtons: [UIButton]!
    @IBOutlet weak var viewColor: UILabel!
    
//    var times: Double = 0
    var timer: Timer?
    var timerCount: Int = 0
    var setBtnTitle: [String] = ["遊戲開始","讀取存檔","設定"]
    //利用 Timer 來設定每幾秒去執行某個 function/法蘭克的iOS世界
    //https://franksios.medium.com/ios-timer-434d91529cdf
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let barButtonItem = UIBarButtonItem(title: "回到遊戲選單", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = barButtonItem
        
        viewColor.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        viewColor.alpha = 1
        
        for i in 0...setBtnTitle.count - 1 {
            LobbyButtons[i].setTitle(setBtnTitle[i] , for: .normal)
            LobbyButtons[i].isHidden = false
        }
        
        if self.timer != nil {
             self.timer?.invalidate()
            timerCount = 0
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        viewColor.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        viewColor.alpha = 1
         // 將timer的執行緒停止
         if self.timer != nil {
              self.timer?.invalidate()
             timerCount = 0
         }
    }
    
    @IBAction func gamePlay(_ sender: UIButton) {

        switch sender.currentTitle {
        case "遊戲開始":
            self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(henkaSuru), userInfo: nil, repeats: true)
        case "讀取存檔" :
            if let controller =
                storyboard?.instantiateViewController(withIdentifier: "SaveVC"){
                present(controller, animated: false, completion: nil) }
        case "設定" :
            if let controller =
                storyboard?.instantiateViewController(withIdentifier: "SettingsVC"){
                present(controller, animated: false, completion: nil) }
        default:
            break
        }
        
    }
    
    @objc func henkaSuru (){
        timerCount = timerCount + 1
        print("\(timerCount)")
        switch timerCount {
        case 1: viewColor.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
                viewColor.alpha = 0.2
            for i in 0...setBtnTitle.count - 1 { LobbyButtons[i].isHidden = true
            }
                print("time 1")
        case 2: viewColor.backgroundColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
                viewColor.alpha = 0.36
                print("time 2")
        case 3: viewColor.backgroundColor = #colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1)
                viewColor.alpha = 0.52
                print("time 3")
        case 4: viewColor.backgroundColor = #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)
                viewColor.alpha = 0.68
                print("time 4")
        case 5: viewColor.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
                viewColor.alpha = 0.84
                print("time 5")
        case 6,7,8: viewColor.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                viewColor.alpha = 1
                print("time 6")
        case 9: if self.timer != nil {self.timer?.invalidate()}
            if let controller = storyboard?.instantiateViewController(withIdentifier: "LivingRoomVC"){ present(controller, animated: false, completion: nil) }
        default: break
        }
    }
}


