//
//  ViewController.swift
//  CamaraExample
//
//  Created by Admin on 25/04/2017.
//  Copyright © 2017 FirmName. All rights reserved.
//

import UIKit
import MobileCoreServices


class ViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var profileImgView: UIImageView!
    
    let picker = UIImagePickerController()
    var chosenImage = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        picker.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func selectImageAction(_ sender: Any) {
        self.showImagePicker();
    }
    
    func showImagePicker() {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let imageButton = UIAlertAction(title: "Capture Image", style: .default, handler: { (action) -> Void in
            self.captureImageButtonAction()
        })
        
        let  photoLibraryButton = UIAlertAction(title: "Photo Library", style: .default, handler: { (action) -> Void in
            self.photoLibraryButtonAction()
        })
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
        })
        
        alertController.addAction(imageButton)
        alertController.addAction(photoLibraryButton)
        alertController.addAction(cancelButton)
        
        self.navigationController!.present(alertController, animated: true, completion: nil)
    }
    
    
    func photoLibraryButtonAction() {
        
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        picker.modalPresentationStyle = .popover
        present(picker, animated: true, completion: nil)
    }
    
    
    func captureImageButtonAction() {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.allowsEditing = false
            picker.sourceType = UIImagePickerControllerSourceType.camera
            picker.mediaTypes = [kUTTypeImage as String]
            picker.modalPresentationStyle = .fullScreen
            present(picker,animated: true,completion: nil)
        } else {
            noCamera()
        }
    }
    
    
    func noCamera(){
        
        let alertVC = UIAlertController(
            title: "No Camera",
            message: "Sorry, this device has no camera",
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style:.default,
            handler: nil)
        alertVC.addAction(okAction)
        present(
            alertVC,
            animated: true,
            completion: nil)
    }
    
    
    //MARK: - UIImagePickerControllerDelegate
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        self.dismiss(animated: true, completion: {})
        
        chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        profileImgView.image = chosenImage
    }
    
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        self.dismiss(animated: true, completion: {})
    }



}

