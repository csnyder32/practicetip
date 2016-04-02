//
//  ViewController.swift
//  practiceTip
//
//  Created by Chris Snyder on 4/2/16.
//  Copyright © 2016 LAKES. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //properties and outlets
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var finalTextView: UITextView!
    @IBOutlet weak var finalLabel: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    var string = ""



    override func viewDidLoad() {
        super.viewDidLoad()
        clearButton.hidden = true
        billTextField.delegate = self
        
    }

    //dismiss keyboard by touching screen
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.billTextField.resignFirstResponder()
    }

    //calculate tip amount
    @IBAction func buttonPressed(sender: AnyObject)
    {
        let billAmount = Double(billTextField.text!)
        getTip(billAmount!)
        clearButton.hidden = false
        billTextField.resignFirstResponder()
    }

    //reset and empty text field
    @IBAction func clearButton(sender: AnyObject)
    {
            reset()
    }

    //functions
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

    //unwind from settings view controller
    @IBAction func unWind(segue: UIStoryboardSegue)
    {
        let sourceVC = segue.sourceViewController as! settingsViewController

        if sourceVC.colorControl.selectedSegmentIndex == 0 {
            self.view.backgroundColor = UIColor.blueColor()
        } else if sourceVC.colorControl.selectedSegmentIndex == 1 {
            self.view.backgroundColor = UIColor.redColor()
        } else if sourceVC.colorControl.selectedSegmentIndex == 2 {
            self.view.backgroundColor = UIColor.greenColor()
        } else {
            self.view.backgroundColor = UIColor.yellowColor()
        }

        /*
        switch sourceVC.colorControl.selectedSegmentIndex {
        case 0:
            self.view.backgroundColor = UIColor.blueColor()
        case 1:
            self.view.backgroundColor = UIColor.redColor()
        case 2:
            self.view.backgroundColor = UIColor.greenColor()
        case 3:
            self.view.backgroundColor = UIColor.yellowColor()
        default:
            break
        }*/
    }
}
