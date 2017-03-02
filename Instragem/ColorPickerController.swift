//
//  File.swift
//  Instragem
//
//  Created by Franziska Desch on 23.02.17.
//  Copyright © 2017 LuisCorp. All rights reserved.
//

import UIKit



class ColorPickerController: UIViewController{
    
    
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var redLabel: UILabel!
    
    @IBOutlet weak var greenLabel: UILabel!
    
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    
    @IBOutlet weak var blueSlider: UISlider!
    
    
    @IBOutlet weak var currentColorLabel: UILabel!
    var redCol : Float = 0
    var greenCol : Float = 0
    var blueCol : Float = 0
    
    @IBOutlet weak var constraintX: NSLayoutConstraint!
    
  
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }
    
    
    
    override func viewDidLoad() {
        self.redSlider.value = 0
        self.greenSlider.value = 0
        self.blueSlider.value = 0

        super.viewDidLoad()
        constraintX.constant = 20
       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
              displayNumbers()
        currentColorLabel.layer.cornerRadius = 10
        currentColorLabel.layer.masksToBounds = true
        popupView.layer.cornerRadius = 10
        
        
    }
    @IBAction func backgroundButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(redCol, forKey: "Red")
        defaults.synchronize()
        defaults.set(greenCol, forKey: "Green")
        defaults.synchronize()
        defaults.set(blueCol, forKey: "Blue")
        defaults.synchronize()
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func redSliderAction(_ sender: Any) {
        changeColor()
    }
    
    
    
    @IBAction func greenSliderAction(_ sender: Any) {
        changeColor()
    }

    @IBAction func blueSliderAction(_ sender: Any) {
        changeColor()
    }
    func changeColorOfLabel() {
        currentColorLabel.backgroundColor = UIColor(red: CGFloat(redCol), green: CGFloat(greenCol), blue: CGFloat(blueCol), alpha: 1.0)
        displayNumbers()
    }
    func changeColor(){
        redCol = redSlider.value
        greenCol = greenSlider.value
        blueCol = blueSlider.value
        changeColorOfLabel()
    }
    func displayNumbers(){
        let roundedRed = String(format: "%0.0f", (redCol*255))
        let roundedGreen = String(format: "%0.0f", (greenCol*255))
        let roundedBlue = String(format: "%0.0f", (blueCol*255))
        
        redLabel.text = "Red: \(roundedRed)"
        greenLabel.text = "Green: \(roundedGreen)"
        blueLabel.text = "Blue: \(roundedBlue)"
    }
    
   
    
    
    
    
    
}
