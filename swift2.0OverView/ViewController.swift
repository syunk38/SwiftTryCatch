//
//  ViewController.swift
//  swift2.0OverView
//
//  Created by Shuntaro Kuroki on 2015/07/01.
//  Copyright © 2015年 Shuntaro Kuroki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    enum ParseError: ErrorType {
        case Nil // nil だった場合
        case IllegalFormat(String) // Int としてパースできなかった場合
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text.removeAll()
        do {
            textView.text = String(try self.getIntValFromLabel())
        }
        catch ParseError.Nil {
            print("the text is nill")
        }
        catch ParseError.IllegalFormat(let text) {
            print("format is \(text)")
        }
        catch {
            print("unexpected error")
        }
    }
    
    func getIntValFromLabel() throws ->Int {
        defer { print("1") }
        defer { print("2") }
        defer { print("3") }
        // 3,2,1の順番で出力される
        
        let integer_val = Int(self.label.text!)
        guard integer_val != nil else {
            throw ParseError.Nil
        }
        
        return integer_val!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

