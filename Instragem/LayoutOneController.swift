//
//  ViewController.swift
//  Instragem
//
//  Created by Franziska Desch on 15.02.17.
//  Copyright © 2017 LuisCorp. All rights reserved.
//

import UIKit

class LayoutOneController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextViewDelegate{
    
    
    
    @IBOutlet var layoutOneView: UIView!
    
    @IBOutlet weak var textView1: UITextView!
    
    
    @IBOutlet weak var textView2: UITextView!
    
    
    @IBOutlet weak var textView3: UITextView!
    
    @IBOutlet weak var screenView: UIView!
    @IBOutlet weak var pickedImage2: UIImageView!
    @IBOutlet weak var pickedImage1: UIImageView!
    
    @IBOutlet weak var pickedImage3: UIImageView!
    
    @IBOutlet weak var pickedImage4: UIImageView!
    
    @IBOutlet weak var addButton1: UIButton!
    
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var addButton2: UIButton!
    @IBOutlet weak var addButton3: UIButton!
    
    @IBOutlet weak var addButton4: UIButton!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    @IBOutlet weak var backgroundButton: UIButton!
    
  let arbitraryValue: Int = 30
   var isFinnish = false
    var isValid = false
    let defaults = UserDefaults.standard
    
    
    
    @IBOutlet weak var constraintX: NSLayoutConstraint!
    var whichButton = 0
    override func viewDidLoad() {
        
        
         textView1.delegate = self
         textView2.delegate = self
         textView3.delegate = self
        super.viewDidLoad()
        pickedImage1.layer.cornerRadius = 10
        pickedImage1.clipsToBounds = true
        pickedImage2.layer.cornerRadius = 10
        pickedImage2.clipsToBounds = true
        pickedImage3.layer.cornerRadius = 10
        pickedImage3.clipsToBounds = true
        pickedImage4.clipsToBounds = true
        popupView.layer.cornerRadius = 10
        textView1.textAlignment = NSTextAlignment.center
        textView1.font = UIFont.boldSystemFont(ofSize: 33.0)
        textView2.font = UIFont.boldSystemFont(ofSize: 40.0)
        textView3.font = UIFont.boldSystemFont(ofSize: 40.0)
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
        configureAddButtonOne()
        configureAddButtonTwo()
        configureAddButtonThree()
        configureAddButtonFour()
        self.editButton.title = ""
        self.editButton.isEnabled = false
        textView1.layer.cornerRadius = 10
        textView2.layer.cornerRadius = 10
        textView3.layer.cornerRadius = 10
       

       
            }
   
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated) //if(isValid){
        
        let red = defaults.object(forKey: "Red") as? Float
        print("red\(red)")
        let blue = defaults.object(forKey: "Blue") as? Float
        print("b\(blue)")
        let green = defaults.object(forKey: "Green") as? Float
        print("g\(green)")
        
        pickedImage1.backgroundColor = UIColor(red: CGFloat(red!), green: CGFloat(green!), blue: CGFloat(blue!), alpha: 1.0)
        //  }

        
          }
    
    @IBAction func colorPickerAction(_ sender: Any) {
        constraintX.constant = -700
        self.backgroundButton.alpha = 0.0
        self.saveButton.isEnabled = true
        self.isValid = true;
       
        
    }
     internal func textViewDidBeginEditing(_ textView: UITextView) {
        if textView == textView1{
            textView1!.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
        }else if textView == textView2{
             textView2!.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
        }else if textView == textView3{
             textView3!.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
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
 
    @IBAction func closePopup(_ sender: Any) {
        self.saveButton.isEnabled = true
        constraintX.constant = -700
        self.backgroundButton.alpha = 0.0
        UIView.animate(withDuration: 0.1, animations: {
            self.view.layoutIfNeeded()
        })

        
    }
    
    
    @IBAction func cameraButtonAction1(_ sender: UIButton) {
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
    
    
    @IBAction func photoGallaryAction1(_ sender: UIButton) {
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
            isFinnish = true
            textView1!.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
             textView2!.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
             textView3!.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
            textView1.isEditable = false
            textView2.isEditable = false
            textView3.isEditable = false
            self.editButton.title = "edit"
            self.editButton.isEnabled = true
            
        }else if isFinnish{
             screenShotMethod()
        }
       
    }
    
    
    @IBAction func editButtonAction(_ sender: Any) {
        
        self.saveButton.title = "finnish"
        self.saveButton.tintColor = UIColor.black
        isFinnish = false
        self.addButton1.isHidden = false
        self.addButton2.isHidden = false
        self.addButton3.isHidden = false
        self.addButton4.isHidden = false
        self.editButton.title = ""
        self.editButton.isEnabled = false
        textView1!.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
        textView2!.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
        textView3!.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
        textView1.isEditable = true
        textView2.isEditable = true
        textView3.isEditable = true
    }
    
    
    
    @IBAction func saveButtonAction(_ sender: UIBarButtonItem) {
        
        let imageData = UIImageJPEGRepresentation(pickedImage1.image!, 0.6)
        let compressedJEPGImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedJEPGImage!, nil, nil, nil)
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
    func configureAddButtonOne(){
        addButton1.layer.cornerRadius = 0.5 * addButton1.bounds.size.width
    
    }
    func configureAddButtonTwo(){
        addButton2.layer.cornerRadius = 0.5 * addButton2.bounds.size.width
        
    }
    func configureAddButtonThree(){
        addButton3.layer.cornerRadius = 0.5 * addButton3.bounds.size.width
        
    }
    func configureAddButtonFour(){
        addButton4.layer.cornerRadius = 0.5 * addButton4.bounds.size.width
        
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



