//
//  MainViewController.swift
//  UIpractice
//
//  Created by imac-1682 on 2023/7/6.
//

import UIKit
//class limitTextfield: UITextField{
//    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
//        if action == #selector(UIResponderStandardEditActions.paste(_:)){ return false }
//        return super.canPerformAction(action, withSender: sender)
//    }
//}


class MainViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var palatte: UIView!
    @IBOutlet weak var red_slider: UISlider!
    @IBOutlet weak var green_slider: UISlider!
    @IBOutlet weak var blue_slider: UISlider!
    @IBOutlet weak var red_textfield: UITextField!
    @IBOutlet weak var green_textfield: UITextField!
    @IBOutlet weak var blue_textfield: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        red_textfield.delegate = self
        green_textfield.delegate = self
        blue_textfield.delegate = self
    }
    func textField(_ textField:UITextField, shouldChangeCharactersIn range:NSRange,replacementString string: String) -> Bool{
        let length = string.lengthOfBytes(using: String.Encoding.utf8)
        for loopIndex in 0..<length{
            let char = (string as NSString).character(at: loopIndex)
            if char<48{
                textField.text = "0"
                return false
            }
            if char > 57{
                textField.text = "0"
                return false
            }
        }
        return true
    }
    @IBAction func Changeview(_ render: UISlider){
        palatte.backgroundColor = UIColor(
            red: CGFloat((red_slider.value/255)),
            green: CGFloat((green_slider.value/255)),
            blue: CGFloat((blue_slider.value/255)),
            alpha: 1
        )
    }
    @IBAction func Changeview_text(_ render: UITextField){
        if let redValue = Float(red_textfield.text ?? ""),
           let greenValue = Float(green_textfield.text ?? ""),
           let blueValue = Float(blue_textfield.text ?? "") {
               let red = CGFloat(redValue / 255.0)
               let green = CGFloat(greenValue / 255.0)
               let blue = CGFloat(blueValue / 255.0)
               palatte.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
    
    @IBAction func ChangeText(_ render: UISlider){
        red_textfield.text = "\(Int(red_slider.value))"
        green_textfield.text = "\(Int(green_slider.value))"
        blue_textfield.text = "\(Int(blue_slider.value))"
    }
    @IBAction func UppdateText(_ render: UITextField){
        let new_redtext: Float, new_greentext: Float, new_bluetext: Float
        if let red_string_text = red_textfield.text{
                
            if let red_float_text = Float(red_string_text){
                if red_float_text >= 255.0{
                    new_redtext = 255.0
                }
                else if red_float_text <= 0.0{
                    new_redtext = 0
                }
                else{
                    new_redtext = red_float_text
                }
                red_textfield.text = "\(Int(new_redtext))"
                red_slider.setValue(new_redtext, animated: true)
            }
        
        }
        if let green_string_text = green_textfield.text{
            
            if let green_float_text = Float(green_string_text){
                if green_float_text >= 255.0{
                    new_greentext = 255.0
                }
                else if green_float_text <= 0.0{
                    new_greentext = 0
                }
                else{
                    new_greentext = green_float_text
                }
                green_textfield.text = "\(Int(new_greentext))"
                green_slider.setValue(new_greentext, animated: true)
            }
        }
        if let blue_string_text = blue_textfield.text{
            if let blue_float_text = Float(blue_string_text){
                if blue_float_text >= 255.0{
                    new_bluetext = 255.0
                    
                }
                else if blue_float_text <= 0.0{
                    new_bluetext = 0
                }
                else{
                    new_bluetext = blue_float_text
                }

                blue_textfield.text = "\(Int(new_bluetext))"
                blue_slider.setValue(new_bluetext, animated: true)
                
            }
        }
        
    }
    
    

    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
