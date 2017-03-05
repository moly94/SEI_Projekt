//
//  LayoutTwoController.swift
//  Instragem
//
//  Created by Franziska Desch on 03.03.17.
//  Copyright © 2017 LuisCorp. All rights reserved.
//

import UIKit

class LayoutTwoController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextViewDelegate{
    
    
    @IBOutlet weak var addButton1: UIButton!
    
    @IBOutlet weak var addButton2: UIButton!
    
    @IBOutlet weak var addButton3: UIButton!
    
   
    @IBOutlet weak var addButton4: UIButton!
    
    @IBOutlet weak var addButton5: UIButton!

    @IBOutlet weak var addButton6: UIButton!
    @IBOutlet weak var pickedImage1: UIImageView!
    
    @IBOutlet weak var backgroundButton: UIButton!
    
    @IBOutlet weak var popPickConstraintX: NSLayoutConstraint!
    
    @IBOutlet weak var constraintX: NSLayoutConstraint!
    @IBOutlet weak var pickedImage2: UIImageView!
    
    @IBOutlet weak var pickedImage3: UIImageView!
    
    
    @IBOutlet weak var pickedImage4: UIImageView!
    
    @IBOutlet weak var pickedImage5: UIImageView!
    
    @IBOutlet weak var pickedImage6: UIImageView!
    
    @IBOutlet weak var colPickerView: UIView!
    @IBOutlet weak var popupView: UIView!
    
    @IBOutlet weak var textView1: UITextView!
    
    @IBOutlet weak var screenView: UIView!
    
    @IBOutlet weak var textView2: UITextView!
    
    
    @IBOutlet weak var textView3: UITextView!
    
    @IBOutlet weak var textView4: UITextView!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    
    @IBOutlet weak var chosenCol: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    let arbitraryValue: Int = 30
    var isFinnish = false
    var isValid = false
    let defaults = UserDefaults.standard
    
    var redCol : Float = 0
    var greenCol : Float = 0
    var blueCol : Float = 0
    var boardSize : CGFloat = 0
    
    
    var whichButton = 0
    override func viewDidLoad() {
        
        
        textView1.delegate = self
        textView2.delegate = self
        textView3.delegate = self
        textView4.delegate = self
        super.viewDidLoad()
        self.redSlider.value = 0
        self.greenSlider.value = 0
        self.blueSlider.value = 0

        pickedImage1.layer.cornerRadius = 10
        pickedImage1.clipsToBounds = true
        pickedImage2.layer.cornerRadius = 10
        pickedImage2.clipsToBounds = true
        pickedImage3.layer.cornerRadius = 10
        pickedImage3.clipsToBounds = true
        pickedImage4.clipsToBounds = true
        popupView.layer.cornerRadius = 10
        pickedImage5.layer.cornerRadius = 10
        pickedImage5.clipsToBounds = true
        pickedImage4.layer.cornerRadius = 10
        pickedImage6.clipsToBounds = true
        textView1.textAlignment = NSTextAlignment.center
        textView1.font = UIFont.boldSystemFont(ofSize: 33.0)
        textView2.font = UIFont.boldSystemFont(ofSize: 40.0)
        textView3.font = UIFont.boldSystemFont(ofSize: 40.0)
        textView4.font = UIFont.boldSystemFont(ofSize: 40.0)
        NotificationCenter.default.addObserver(self, selector: #selector(LayoutOneController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(LayoutOneController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
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
        configureViews()
        
        
        
    }
    func keyboardWillShow(notification: NSNotification) {
        if textView4.isFirstResponder {
            if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                if self.view.frame.origin.y == 0{
                    
                    self.view.frame.origin.y -= keyboardSize.height
                    boardSize = keyboardSize.height
                    
                }
            }
        }
        
    }
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
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
    
    
    @IBAction func colPickerAction(_ sender: Any) {
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
        }else if whichButton == 5 {
            pickedImage5.backgroundColor = chosenCol.backgroundColor
        }else if whichButton == 6 {
            pickedImage6.backgroundColor = chosenCol.backgroundColor
        }


        
    }
    
    internal func textViewDidBeginEditing(_ textView: UITextView) {
        if textView == textView1{
            textView1!.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)

        }else if textView == textView2{
            textView2!.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
          
        }else if textView == textView3{
            textView3!.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
        }else if textView == textView4{
            textView4!.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
        }

    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView == self.textView4{
            self.view.frame.origin.y += boardSize
            textView4!.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
            UIView.animate(withDuration: 0.9, animations: {
                self.view.layoutIfNeeded()
            })
        }
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
    
    
    @IBAction func addButtonFiveAction(_ sender: Any) {
        
        self.saveButton.isEnabled = false
        constraintX.constant = 0
        self.backgroundButton.alpha = 0.5
        whichButton = 5
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })

    }
    
    
    @IBAction func addButtonSixAction(_ sender: Any) {
        self.saveButton.isEnabled = false
        constraintX.constant = 0
        self.backgroundButton.alpha = 0.5
        whichButton = 6
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })

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
    
    
   
    @IBAction func screenshotAction(_ sender: Any) {
        if !isFinnish {
            self.saveButton.title = "save"
            self.saveButton.tintColor = UIColor.green
            self.addButton1.isHidden = true
            self.addButton2.isHidden = true
            self.addButton3.isHidden = true
            self.addButton4.isHidden = true
            self.addButton5.isHidden = true
            self.addButton6.isHidden = true
            isFinnish = true
            textView1!.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
            textView2!.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
            textView3!.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
            textView4!.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
            textView1.isEditable = false
            textView2.isEditable = false
            textView3.isEditable = false
             textView4.isEditable = false
            
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
    
    
    
    @IBAction func editButtonAction(_ sender: Any) {
        self.saveButton.title = "finish"
        self.saveButton.tintColor = UIColor.black
        isFinnish = false
        self.addButton1.isHidden = false
        self.addButton2.isHidden = false
        self.addButton3.isHidden = false
        self.addButton4.isHidden = false
        self.addButton5.isHidden = false
        self.addButton6.isHidden = false

        self.editButton.title = ""
        self.editButton.isEnabled = false
        textView1!.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
        textView2!.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
        textView3!.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
        textView4!.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
        textView1.isEditable = true
        textView2.isEditable = true
        textView3.isEditable = true
         textView4.isEditable = true
    }
    
    
    
    @IBAction func saveButtonAction(_ sender: UIBarButtonItem) {
        
        let imageData = UIImageJPEGRepresentation(pickedImage1.image!, 0.6)
        let compressedJEPGImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedJEPGImage!, nil, nil, nil)
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
            
        }else if whichButton == 5 {
            pickedImage5.image = image
            
        }else if whichButton == 6 {
            pickedImage6.image = image
            
        }


        
        
        self.dismiss(animated: true, completion: nil);
    }

    @IBAction func backButtonAction(_ sender: Any) {
       self.dismiss(animated: true, completion: nil)
    }
    func configureViews(){
        pickedImage1.layer.cornerRadius = 0.5 * pickedImage1.bounds.size.width
        pickedImage2.layer.cornerRadius = 0.5 * pickedImage2.bounds.size.width
        pickedImage3.layer.cornerRadius = 0.5 * pickedImage3.bounds.size.width
        pickedImage4.layer.cornerRadius = 0.5 * pickedImage4.bounds.size.width
        pickedImage5.layer.cornerRadius = 0.5 * pickedImage5.bounds.size.width
        
        
         textView1.layer.cornerRadius = 0.5 * textView1.bounds.size.width
        textView2.layer.cornerRadius = 0.5 * textView2.bounds.size.width
        textView3.layer.cornerRadius = 0.5 * textView3.bounds.size.width
        textView4.layer.cornerRadius = 0.5 * textView4.bounds.size.width
        
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
