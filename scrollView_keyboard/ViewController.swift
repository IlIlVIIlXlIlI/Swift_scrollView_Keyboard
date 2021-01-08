//
//  ViewController.swift
//  scrollView_keyboard
//
//  Created by Shogo Nobuhara on 2021/01/09.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet var myTextFields: [UITextField]!
    
    
    // 編集中のテキストフィールド
    var editingField:UITextField?
    
    // 編集開始
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // 編集中のテキストフィールド
        editingField = textField
    }
    
    // 編集終了
    func textFieldDidEndEditing(_ textField: UITextField) {
        // 編集中のテキストフィールドがなくなったらnillにする
        editingField = nil
    }
    
    // キーボードのframeが変化した通知を受けた
    @objc func keyboardChangeFrame(_notification: Notification){
        // 編集中のテキストフィールドがない場合は中断する
        guard let fld = editingField else{
            return
        }
        
        // キーボードのframeを調べる
        let userInfo = (_notification as NSNotification).userInfo!
        let keyboardInfo = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue).cgRectValue
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // スクロールビューの領域を指定する
        let scrollFrame = CGRect(x:0, y:20,width: view.frame.width,height: view.frame.height-20)        // ステータスバーの高さより下
        myScrollView.frame = scrollFrame
        
        // コンテンツのサイズを指定する
        let contentRenct = contentView.bounds
        myScrollView.contentSize = CGSize(width: contentRenct.width, height: contentRenct.height)
        
        // 全てのテキストフィールドのデリゲートになる
        for fld in myTextFields{
            fld.delegate = self
        }
        
        
        
        // デフォルトの通知センターを得る
        let notification = NotificationCenter.default
        
        // キーボードのframeが変化した
        notification.addObserver(self, selector:#selector(ViewController.keyboardChangeFrame(_:)) , name: UIResponder.keyboardDidChangeFrameNotification, object: nil)
        notification.addObserver(self, selector:#selector(ViewController.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector:#selector(ViewController.keyboardDidHide(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)
        
    }


}

