//
//  LivingRoomViewController.swift
//  EscapeRoom_TheHome01
//
//  Created by 維衣 on 2022/2/3.
//

import UIKit

class LivingRoomViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var rightBtns: [UIButton]!
    @IBOutlet weak var dialogLabel: UILabel!
    @IBOutlet var rightAspectBtns: [UIButton]!
    @IBOutlet weak var livingRoomBGImgView: UIImageView!
    @IBOutlet var aspectBtns: [UIButton]!
    @IBOutlet weak var samllView: UIView!
    @IBOutlet weak var samllViewXBotton: UIButton!
    @IBOutlet weak var samllViewImg: UIImageView!
    @IBOutlet weak var samllViewPick: UIPickerView!
    @IBOutlet weak var samllViewLabel: UILabel!
    @IBOutlet var samllViewBottons: [UIButton]!
    @IBOutlet weak var osView: UIView!
    
    
    var rightEmoji: [String] = ["🏳️","😏","⚙️"]
    var viewID: String = ""
    var aspectBags:[String] = []
    var count: Int = 0
    var pickStrs: [String] = []
    var pickDataArr0: [Int] = []
    var pickDataArr1: [Int] = []
    var pickDataArr2: [Int] = []
    var pickDataArr3: [Int] = []
    var rightNumber: [String] = ["5","3","8","8"]
    var selectNumber: [String] = ["0","0","0","0"]
    var samllViewTitle: String = ""
    var selectAspect: [String] = []
    var n: Int = 0
    var isHave: Bool?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        samllViewAction(smallViewAction: "Open", nil)
        samllViewAction("Hidden", nil)
        osView.layer.isHidden = true

        dialogLabel.text = ""
        for i in 0...rightAspectBtns.count - 1 {
            rightAspectBtns[i].layer.cornerRadius = 30
            rightAspectBtns[i].clipsToBounds = true
            rightAspectBtns[i].layer.borderWidth = 3
            rightAspectBtns[i].layer.borderColor = CGColor(red: 1, green: 0, blue: 0, alpha: 1)
            rightAspectBtns[i].imageView?.contentMode = .scaleAspectFit
        }
        
        for i in 0...rightBtns.count - 1 { rightBtns[i].setTitle("\(rightEmoji[i])", for: .normal) }
        for i in 0...aspectBtns.count - 1 {
            aspectBtns[i].setTitle("\(aspects1[i].aspectsName1)", for: .normal)
            
        }
        n = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backLobby(_ sender: UIButton){
    
        switch sender.currentTitle {
        case "🏳️":
            viewID = "LobbyVC"
        case "⚙️" :
            viewID = "SettingsVC"
        default:
            break
        }
        
        guard viewID == "" else {
            if let controller =
                storyboard?.instantiateViewController(withIdentifier: String(viewID)){
                present(controller, animated: true, completion: nil)
                return
                }
                return
            }
    }
    
    @IBAction func findAlert(_ sender: UIButton) {

        for i in 0...rightAspectBtns.count - 1 {
            if sender.currentTitle! == alertTxt1[i].title {
                let controller = UIAlertController(title: "\(sender.currentTitle!)", message: "\(alertTxt1[i].message)", preferredStyle: .alert)
                let image = UIImage(named: "\(sender.currentTitle!)-初")
                let cancelAction = UIAlertAction(title: "取消", style: .cancel)
                let okAction = UIAlertAction(title: "\(alertTxt1[i].okActionTitle)", style: .default) { [self] action in

                    switch alertTxt1[i].okActionTitle {
//                    switch "\(alertTxt1[i].okActionTitle)" {
                        //***
                    case "電視櫃":
//                        print("**電視櫃")
                        samllViewAction("Open", alertTxt1[i].okActionTitle)
                    case "Xw電動":
//                        print("**Xw電動")
                        samllViewAction("Open", alertTxt1[i].okActionTitle)
                        //***
                        
                    default:
                        if UIImage(named: "\(sender.currentTitle!)-次") != nil {
                            let controller = UIAlertController(title: "\(alertTxt2[i].title)", message: "\(alertTxt2[i].message))", preferredStyle: .alert)
                            let image = UIImage(named: "\(sender.currentTitle!)-次")
                            let cancelAction = UIAlertAction(title: "取消", style: .cancel)
                            let okAction = UIAlertAction(title: "\(alertTxt2[i].okActionTitle)", style: .default) { [self] action in
                               
                                switch alertTxt2[i].accessAction {
                                case "getAspect":
                                               
                                    guard alertTxt2[i].imgName.isEmpty == true || alertTxt2[i].imgName == "" else {
                                        samllViewAction("Open", alertTxt2[i].imgName)
                                        samllViewLabel.text = alertTxt2[i].imgName
                                        addAspectBag(samllViewLabel.text!)
                                        return
                                    }

                                    print("**物品視窗＋物品欄新增")
                                case "pickView":
                                    if "密碼" == "pick輸入密碼"{
                                        samllViewAction("Open", samllViewTitle)

                                        print("**pickerView+物品欄新增")
                                        print("**密碼" == "pick輸入密碼")
                                    } else {
                                        samllViewAction("Open", samllViewTitle)
                                        print("**顯示「好像不是」閃爍一下，暗掉")
                                    }
                                default:
                                    break
                                }
                                
                            }
                            controller.addImage(image: image!)
                            controller.addAction(cancelAction)
                            controller.addAction(okAction)
                            self.present(controller, animated: true, completion: nil)
                        } else {

                        }
                    }
                }
                controller.addImage(image: image!)
                controller.addAction(cancelAction)
                controller.addAction(okAction)
                self.present(controller, animated: true, completion: nil)
            }
            count = count + 1
        }
        count = 0
    }
    
    @IBAction func saveAspectsBtn(_ sender: UIButton) {
        
            for i in 0...aspectBags.count - 1 {

                if sender.currentTitle! == rightAspectBtns[i].currentTitle {

                    samllViewAction("Open", rightAspectBtns[i].currentTitle!)
                    print("**rightAspectBtns[i].currentTitle!) == \(rightAspectBtns[i].currentTitle!)")
            }
        }
       
//        print("**sender.title(for: .normal) == \(sender.title(for: .normal))")
        
//        if samllViewLabel.text! == "窗簾上" && sender.currentTitle! == "長桿"{
            //長桿消失
            //得到鑰匙？
//            selectAspect = "鑰匙？"
//        } else if samllViewLabel.text! == "白紙" && sender.currentTitle! == "透明版" {
//            //得到線索1(白紙四個分隔＋透明版＝密碼線索)
//            //白紙跟透明版消失
//            selectAspect = "線索1"
//        }
//        samllViewAction(smallViewAction: "Open", selectAspect)
        
    }
    
    @IBAction func cleanPickView(_ sender: UIButton) {
        samllViewAction("Hidden", nil)
    }
    
    @IBAction func cleanAspectsBtn(_ sender: UIButton) {
        samllViewAction("Hidden", nil)
    }
    
    @IBAction func enterBtn(_ sender: UIButton) {
//        isHave = rightNumber.filter{( $0 == selectAspect) ? "true" : "false"}
        
        guard samllViewImg.isHidden == false else {
            print("**rightNumber == \(rightNumber)")
            print("**selectNumber == \(selectNumber)")
            if rightNumber == selectNumber {

                addAspectBag("鑰匙？")
                print("**答對了")
                return
            }else{
                samllViewAction("Open", "錯誤")
                //閃一下
                print("**答錯了")
                return
            }
        }
        
//            addAspectBag(samllViewLabel.text!)
//            print("**enterBtn.samllViewLabel.text! == \(samllViewLabel.text!)")
//            print("**enterBtn.samllViewTitle == \(samllViewTitle)")
//            addAspectBag(samllViewTitle)
            samllViewAction("Hidden", nil)
            return
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 || component == 1 || component == 2 || component == 3{
            return pickStrs.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 || component == 1 || component == 2 || component == 3{
            selectNumber[component] = "\(row)"
            return pickStrs[row].description
        }
        return nil
    }
    
    func samllViewAction(_ action: String,_ showPicName: String?) {
        
        for i in 0...9 { pickStrs.append("\(i)") }
        samllViewPick.delegate = self
        samllViewPick.dataSource = self
        samllViewXBotton.layer.cornerRadius = 20
        samllViewXBotton.setTitle("Ｘ", for: .normal)
        
        samllViewBottons[0].setTitle("確定", for: .normal)
        samllViewBottons[1].setTitle("取消", for: .normal)
        
        if action == "Hidden" || showPicName?.isEmpty == true || showPicName == "" {
            samllViewImg.isHidden = true
            
            samllView.isHidden = true
//            samllViewLabel.isHidden = true
            samllViewPick.isHidden = true
            samllViewXBotton.isHidden = true
            samllViewBottons[0].isHidden = true
            samllViewBottons[1].isHidden = true
            
        } else if action == "Open"{
//            print("** smallViewTitle == \(showPicName!)")
//            if "密碼鎖" == samllViewTitle {
            if "密碼鎖" == showPicName! {
                samllViewPick.isHidden = false
                samllViewImg.isHidden = true
            } else {
                samllViewLabel.isHidden = false
                samllViewPick.isHidden = true
                samllViewImg.isHidden = false
                if showPicName != nil{

                    samllViewLabel.text! = showPicName!
                    print("**open.samllViewLabel.text == \(samllViewLabel.text!)")
                    samllViewImg.image = UIImage(named: showPicName!)
                    samllViewLabel.tintColor = UIColor.black
                }
            }
            
            samllViewLabel.text = showPicName!
            samllView.isHidden = false
            samllViewXBotton.isHidden = false
            samllViewBottons[0].isHidden = false
            samllViewBottons[1].isHidden = false
            
            }
        }
        
    func addAspectBag(_ aspectName: String) {
        
//        guard if aspectName == samllViewLabel.text!{ return break}
       
            aspectBags.append(aspectName)

        var set = Set<String>()
        for item in aspectBags {
            set.insert(item)
            
            aspectBags = set.reversed()

            for i in 0...set.count - 1 {
                rightAspectBtns[i].setImage(UIImage(named: aspectBags[i]), for: .normal)
//                rightAspectBtns[i].setTitle("\(aspectBags[i])", for: .normal)
                print("**aspectBags == \(aspectBags)")
            }
            
//            guard set.count > 5 else {
//
//                rightAspectBtns[set.count].setImage(UIImage(named: aspectName), for: .normal)
////                n = n + 1
////                print("**n == \(n)")
//                return
//            }
//            print("**set == \(set)")
            }

        }
    
//    func aspectImg(_ imgName: String) {
//        samllView.layer.isHidden = false
//        samllView.backgroundColor = .white
////        guard imgName.isEmpty == true else {
//        samllViewImg.isHidden = false
//        samllViewImg.image = UIImage(named: imgName)
//        samllViewXBotton.isHidden = false
//        samllViewLabel.isHidden = false
//        print("**func imgName == \(imgName)")
//        samllViewLabel.text = imgName
////            return
////        }
////        samllViewImg.isHidden = true
////        samllViewXBotton.isHidden = true
////        return
    }
    
    


                                  


