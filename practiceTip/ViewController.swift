//
//  ViewController.swift
//  practiceTip
//
//  Created by Chris Snyder on 4/2/16.
//  Copyright © 2016 LAKES. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billTextField: UITextField!

    @IBOutlet weak var finalTextView: UITextView!
    @IBOutlet weak var finalLabel: UILabel!
    var string = ""

    @IBOutlet weak var clearButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        clearButton.hidden = true
        billTextField.delegate = self
        
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.billTextField.resignFirstResponder()
    }

    @IBAction func buttonPressed(sender: AnyObject)
    {
        let billAmount = Double(billTextField.text!)
        getTip(billAmount!)
        clearButton.hidden = false
        billTextField.resignFirstResponder()
    }


    @IBAction func clearButton(sender: AnyObject)
    {
            reset()
    }
    
    func getTip(billTotal: Double) {
        var newStarRating = 0
        var newTipPercent = 0.0
        while newStarRating < 5 && newTipPercent < 0.30 {
            //let billAmount = Double(billTextField.text!)
            newStarRating += 1; newTipPercent += 0.05
            print(String.localizedStringWithFormat("Your tip for \(newStarRating) rating is $%0.2f", billTotal * newTipPercent))
            string  += String.localizedStringWithFormat("\n" + "Your tip for a \(newStarRating) rating is \(newTipPercent * 100) percent is $%0.2f", billTotal * newTipPercent)

            finalTextView.text = string
        }
    }

    func reset() {
        billTextField.text = ""
        finalTextView.text = ""
        string = ""
        clearButton.hidden = true
    }
}
