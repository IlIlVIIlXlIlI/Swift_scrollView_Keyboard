//
//  ViewController.swift
//  scrollView_keyboard
//
//  Created by Shogo Nobuhara on 2021/01/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // スクロールビューの領域を指定する
        let scrollFrame = CGRect(x:0, y:20,width: view.frame.width,height: view.frame.height-20)        // ステータスバーの高さより下
        myScrollView.frame = scrollFrame
        
        // コンテンツのサイズを指定する
        let contentRenct = contentView.bounds
        myScrollView.contentSize = CGSize(width: contentRenct.width, height: contentRenct.height)
        
        
    }


}

