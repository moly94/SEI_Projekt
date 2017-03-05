//
//  LayoutThreeController.swift
//  Instragem
//
//  Created by Franziska Desch on 04.03.17.
//  Copyright © 2017 LuisCorp. All rights reserved.
//

import Foundation
import UIKit

class LayoutThreeController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextViewDelegate{
    
    @IBOutlet weak var constraintX: NSLayoutConstraint!
    
    
    @IBOutlet weak var popPickConstraintX: NSLayoutConstraint!
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var chosenCol: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var colPickerView: UIView!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var pickedImage1: UIImageView!
    
    @IBOutlet weak var pickedImage3: UIImageView!
    
    @IBOutlet weak var pickedImage4: UIImageView!
    
    @IBOutlet weak var pickedImage2: UIImageView!
    
    
    @IBOutlet weak var screenView: UIView!
    @IBOutlet weak var addButton1: UIButton!
    
    @IBOutlet weak var addButton2: UIButton!
    
    @IBOutlet weak var addButton3: UIButton!
    
    @IBOutlet weak var addButton4: UIButton!
    
    @IBOutlet weak var backgroundButton: UIButton!
    
    let arbitraryValue: Int = 30
    var isFinnish = false
    var isValid = false
   
    
    var redCol : Float = 0
    var greenCol : Float = 0
    var blueCol : Float = 0
    var whichButton = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.redSlider.value = 0
        self.greenSlider.value = 0
        self.blueSlider.value = 0
        pickedImage4.layer.cornerRadius = 10
        pickedImage1.clipsToBounds = true
        pickedImage2.layer.cornerRadius = 10
        pickedImage2.clipsToBounds = true
        pickedImage3.layer.cornerRadius = 10
        pickedImage3.clipsToBounds = true
        pickedImage4.clipsToBounds = true
        
        popupView.layer.cornerRadius = 10
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
       

        self.editButton.title = ""
        self.editButton.isEnabled = false
        displayNumbers()
        chosenCol.layer.cornerRadius = 10
        chosenCol.layer.masksToBounds = true
        colPickerView.layer.cornerRadius = 10
        
        
        
    }

    
    @IBAction func addButtonOneAction(_ sender: Any) {
        constraintX.constant = 0
        self.saveButton.isEnabled = false
        self.backgroundButton.alpha = 0.5
        whichButton = 1
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })

    }
    
    
    @IBAction func addButtonTwoAction(_ sender: Any) {
        self.saveButton.isEnabled = false
        constraintX.constant = 0
        whichButton = 2
        self.backgroundButton.alpha = 0.5
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })

    }
    
    
    @IBAction func addButtonThreeAction(_ sender: Any) {
        self.saveButton.isEnabled = false
        constraintX.constant = 0
        self.backgroundButton.alpha = 0.5
        whichButton = 3
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })

    }
    
    @IBAction func addButtonFourAction(_ sender: Any) {
        self.saveButton.isEnabled = false
        constraintX.constant = 0
        self.backgroundButton.alpha = 0.5
        whichButton = 4
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
        

    }
    
    
    @IBAction func cameraButtonAction(_ sender: Any) {
        constraintX.constant = -700
        self.saveButton.isEnabled = true
        self.backgroundButton.alpha = 0.0
        UIView.animate(withDuration: 0.1, animations: {
            self.view.layoutIfNeeded()
        })
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = true
            self.present(imagePicker,animated: true,completion: nil)
        }

    }
    
    
    @IBAction func colorPickerAction(_ sender: Any) {
        popPickConstraintX.constant = 0
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
        constraintX.constant = -700
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
        self.backgroundButton.alpha = 0.5
        self.saveButton.isEnabled = false

    }
    @IBAction func photoGallaryAction(_ sender: Any) {
        constraintX.constant = -700
        self.backgroundButton.alpha = 0.0
        self.saveButton.isEnabled = true
        UIView.animate(withDuration: 0.1, animations: {
            self.view.layoutIfNeeded()
        })
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }

    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func editButtonAction(_ sender: Any) {
        self.saveButton.title = "finish"
        self.saveButton.tintColor = UIColor.black
        isFinnish = false
        self.addButton1.isHidden = false
        self.addButton2.isHidden = false
        self.addButton3.isHidden = false
        self.addButton4.isHidden = false
        self.editButton.title = ""
        self.editButton.isEnabled = false
    }
    
    @IBAction func finishButtonAction(_ sender: Any) {
        if !isFinnish {
            self.saveButton.title = "save"
            self.saveButton.tintColor = UIColor.green
            self.addButton1.isHidden = true
            self.addButton2.isHidden = true
            self.addButton3.isHidden = true
            self.addButton4.isHidden = true
            isFinnish = true
            self.editButton.title = "edit"
            self.editButton.isEnabled = true
            
        }else if isFinnish{
            screenShotMethod()
            let alertView = UIAlertController(title: "Your collage was successfully saved!",
                                              message: "" as String, preferredStyle:.alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertView.addAction(okAction)
            self.present(alertView, animated: true, completion: nil)
            return;
            

        }

    }
    
    @IBAction func closePopup(_ sender: Any) {
        self.saveButton.isEnabled = true
        self.backgroundButton.alpha = 0.0
        if constraintX.constant == 0 {
            constraintX.constant = -700
            UIView.animate(withDuration: 0.1, animations: {
                self.view.layoutIfNeeded()
            })
        }else if popPickConstraintX.constant == 0 {
            popPickConstraintX.constant = 700
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
        
    }
    
    @IBAction func addColorAction(_ sender: Any) {
        self.saveButton.isEnabled = true
        self.backgroundButton.alpha = 0.0
        popPickConstraintX.constant = 700
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
        if whichButton == 1 {
            pickedImage1.backgroundColor = chosenCol.backgroundColor
        }else if whichButton == 2 {
            pickedImage2.backgroundColor = chosenCol.backgroundColor
        }else if whichButton == 3 {
            pickedImage3.backgroundColor = chosenCol.backgroundColor
        }else if whichButton == 4 {
            pickedImage4.backgroundColor = chosenCol.backgroundColor
        }

        
    }
    @IBAction func redSliderAction(_ sender: Any) {
        changeColor()
    }
    
    @IBAction func blueSliderAction(_ sender: Any) {
        changeColor()
    }
    
    @IBAction func greenSliderAction(_ sender: Any) {
        changeColor()
    }
    func changeColorOfLabel() {
        chosenCol.backgroundColor = UIColor(red: CGFloat(redCol), green: CGFloat(greenCol), blue: CGFloat(blueCol), alpha: 1.0)
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
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        if whichButton == 1{
            pickedImage1.image = image
            
        }else if whichButton == 2 {
            pickedImage2.image = image
            
        }else if whichButton == 3 {
            pickedImage3.image = image
            
        }
        else if whichButton == 4 {
            pickedImage4.image = image
            
        }
        
        
        self.dismiss(animated: true, completion: nil);
    }
    func screenShotMethod() {
        //Create the UIImage
        UIGraphicsBeginImageContext(screenView.frame.size)
        screenView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        //Save it to the camera roll
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
    }
    

  }
