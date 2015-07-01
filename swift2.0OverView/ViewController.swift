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
            textView.text = try self.getTextFromLavel()
        }
        catch ParseError.Nil{
            
        }
        
    }
    
    func getTextFromLavel() throws -> String? {
        do {
            let text = try label.text
        }
        catch ParseError.Nil {
            print("the text is nill")
            throw ParseError.Nil
        }
        catch ParseError.IllegalFormat(let text) {
            print("format is \(text)")
            throw ParseError.IllegalFormat(text)
        }
        catch {
            print("unexpected error")
        }
        return text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

