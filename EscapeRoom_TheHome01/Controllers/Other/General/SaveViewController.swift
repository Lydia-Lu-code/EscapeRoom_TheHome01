//
//  SaveViewController.swift
//  EscapeRoom_TheHome01
//
//  Created by 維衣 on 2022/2/20.
//

import UIKit

class SaveViewController: UIViewController {

    @IBOutlet var dataBtns: [UIButton]!
    @IBOutlet weak var btn: UIButton!
    
    @IBOutlet weak var viewColor: UILabel!
    
    var dataTitles: [String] = ["存檔1","存檔2","存檔3","存檔4","存檔5"]
    var timer: Timer?
    var timerCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewColor.text = ""
        for i in 0...dataBtns.count - 1{
            dataBtns[i].setTitle("\(dataTitles[i])", for: .normal)
        }
            btn.setTitle("返回大廳", for: .normal)
        
        if self.timer != nil {
             self.timer?.invalidate()
            timerCount = 0
        }
        
    }
    

override func viewDidDisappear(_ animated: Bool) {
    // 將timer的執行緒停止
     if self.timer != nil {
          self.timer?.invalidate()
         timerCount = 0
     }
}
    
    @IBAction func saveDatas(_ sender: UIButton) {
        switch sender.currentTitle {
        case "存檔1":
            print("**存檔1")
        case "存檔2":
            print("**存檔2")
        case "存檔3":
            print("**存檔3")
        case "存檔4":
            print("**存檔4")
        case "存檔5":
            print("**存檔5")
        default:
            break
        }
        self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(henkaSuru), userInfo: nil, repeats: true)
    }
    
    @objc func henkaSuru (){
        timerCount = timerCount + 1
        print("\(timerCount)")
        switch timerCount {
        case 1: viewColor.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
                viewColor.alpha = 0.2
            for i in 0...dataBtns.count - 1 { dataBtns[i].isHidden = true
            }
            btn.isHidden = true
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
