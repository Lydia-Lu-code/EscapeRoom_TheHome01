//
//  SettingsViewController.swift
//  EscapeRoom_TheHome01
//
//  Created by 維衣 on 2022/2/3.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var labels: [UILabel]!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var koeBtn: UIButton!
    @IBOutlet weak var LobbyBtn: UIButton!
    
    var labelStr: [String] = ["背景音樂","音  效","語音音量","語音設置","✘","✘","✘","♬","♬","♬"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0...labels.count - 1{
        labels[i].text = labelStr[i]
        }
        
        koeBtn.setTitle("Off", for: .normal)
        btn.setTitle("繁體中文", for: .normal)
        
        LobbyBtn.setTitle("返回大廳", for: .normal)
    }

    @IBAction func koeOnOff(_ sender: UIButton) {
        print("0000")
        sender.isSelected = !sender.isSelected
        
        guard koeBtn.titleLabel?.text == "Off" else {
            koeBtn.setTitle("Off", for: .normal)
            koeBtn.setTitleColor(UIColor.systemBlue, for: .normal)
            print("1111")
            return
        }
        koeBtn.setTitle("On", for: .selected)
        koeBtn.setTitleColor(UIColor.systemGray, for: .selected)
        print("2222")
    }
    
    @IBAction func backLobby(_ sender: UIButton) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "LobbyVC"){
            present(controller, animated: false, completion: nil)
        }
    }
    
    
}
