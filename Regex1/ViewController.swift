//
//  ViewController.swift
//  Regex1
//
//  Created by Dev on 14/05/16.
//  Copyright © 2016 SwiftProject. All rights reserved.
//

import UIKit
import Foundation

class Regex {
    let internalExpression: NSRegularExpression
    let pattern: String
    
    init(_ pattern: String) {
        self.pattern = pattern
        //var error: NSError?
        self.internalExpression = try! NSRegularExpression(pattern: pattern, options: [])
    }
    
    func test(input: String) -> Bool {
        let matches = self.internalExpression.matchesInString(input, options: [], range:NSMakeRange(0, input.length))
        return matches.count > 0
    }
}

extension String {
    var length: Int {
        return characters.count
    }
}


class ViewController: UIViewController {

    
    @IBOutlet var Affichage: UILabel!
    var regexp:NSRegularExpression!
    var Saisie:String!
    var SaisieStat:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func txtField(textf:UITextField) {
        //Affichage.text = "Salut \(textf.text!)"
        Affichage.text = textf.text
        regexp(textf)
    }
    
    func regexp(saisie:UITextField){
        
        //var t1:String!
        if Regex("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}").test(saisie.text!) {
            NSLog("MATCH OK")
            AlertOK("MATCH")
        }else{
            AlertOK("NO MATCH")
            NSLog("NOK")
        }

    }
    
    func AlertOK(msg:String){
        let alertController = UIAlertController(title: "NOTE", message:msg , preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
   
}

