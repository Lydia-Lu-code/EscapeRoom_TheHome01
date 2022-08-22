//
//  StoryText.swift
//  EscapeRoom_TheHome01
//
//  Created by 維衣 on 2022/3/9.
//

import UIKit

class aspectsAlert {
    var aspectsName1 = String()
    
    init(aspectsName: String) {
        self.aspectsName1 = aspectsName
    }
}

var aspects1 =  [aspectsAlert(aspectsName:"畫"),
                 aspectsAlert(aspectsName:"襪子"),
                 aspectsAlert(aspectsName:"窗簾"),
                 aspectsAlert(aspectsName:"窗簾上"),
                 aspectsAlert(aspectsName:"收納櫃"),
                 aspectsAlert(aspectsName:"電視畫面"),
                 aspectsAlert(aspectsName:"電視櫃"),
                 aspectsAlert(aspectsName:"Xw電動"),
                 aspectsAlert(aspectsName:"夾縫"),
                 aspectsAlert(aspectsName:"盆栽")]


struct alertText {
    let title: String
    let message: String
    let okActionTitle: String
    let accessAction: String
    let imgName: String
    
    init(title: String, message: String , okActionTitle: String, accessAction: String? = nil, imgName: String? = nil) {
        self.title = title
        self.message = message
        self.okActionTitle = okActionTitle
        self.accessAction = accessAction ?? ""
        self.imgName = imgName ?? ""
    }
}

//array的次數不一樣，第二層少一個
var alertTxt1: [alertText] = [alertText(title: "畫", message: "一副被說成像兩碗泡麵的風景畫", okActionTitle: "觸碰"),
                 alertText(title: "窗簾", message: "就是窗簾而已", okActionTitle: "關上"),
                 alertText(title: "收納櫃", message: "鎖住了", okActionTitle: "用鑰匙嗎"),
                 alertText(title: "夾縫", message: "要求生存了嗎", okActionTitle: "哪次不求"),
                 alertText(title: "窗簾上", message: "看不清楚", okActionTitle: "好像有什麼東西"),
                 alertText(title: "盆栽", message: "長得還不錯", okActionTitle: "近看"),
                 alertText(title: "電視櫃", message: "電視櫃玻璃透亮的勒", okActionTitle: "鎖住了"),
                 //分歧 使用鑰匙　or沒有道具/用錯道具
                 alertText(title: "Xs電動", message: "好像需要遊戲片", okActionTitle: "試試看"),
                 //分歧 遊戲片or沒有道具/用錯道具
                 //畫面出現“錯誤”（全畫面透明背景）
                 //正確的話會出現“感謝信”
]
//aspect

    var alertTxt2:[alertText] = [alertText(title: "畫傾斜", message: "好像有什麼東西掉下來了", okActionTitle: "撿起來", accessAction: "getAspect", imgName: "白紙"),
                 //物品欄新增 "紙"
                 alertText(title: "關上了窗簾", message: "可愛的圖案", okActionTitle: "沒什麼美感呢", accessAction: "", imgName: ""),
                 alertText(title: "打開收納櫃", message: "看來需要密碼鎖", okActionTitle: "輸入", accessAction: "pickView", imgName: ""),
                 //出現水平平移的密碼view
                 alertText(title: "長桿", message: "好像有點用途", okActionTitle: "拿起", accessAction: "getAspect", imgName: "長桿"),
                 //物品欄新增
                 alertText(title: "窗簾上方", message: "手短搆不到", okActionTitle: "使用", accessAction: "getAspect", imgName: "鑰匙？"),
                 //分歧 拿到鑰匙img　or沒有道具/用錯道具
                 alertText(title: "盆栽下", message: "好像有什麼東西", okActionTitle: "拿起", accessAction: "getAspect", imgName: "鑰匙？？"),
                 //出現[鑰匙？]的image
                 
                 //使用鑰匙成功的話，才會出現打開電視櫃的選項
                 alertText(title: "打開電視櫃", message: "有一個盒子", okActionTitle: "拿起", accessAction: "pickView", imgName: ""),
                 //出現水平平移的圖案view
                 
//                 alertText(title: "電視螢幕", message: "", okActionTitle: "", trigger: true),
//                 //物品欄新增 對的話 看得到感謝信
                 
]







