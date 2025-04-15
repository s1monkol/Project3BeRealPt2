//
//  PostViewController.swift
//  Bereal-clone
//
//  Created by Semen Kolesnykov on 2/16/25.
//

import UIKit
import ParseSwift
import PhotosUI

class PostViewController: UIViewController{
    
    @IBOutlet weak var captionTextField: UITextField!
    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    private var pickedImage: UIImage?
    
    @IBAction func pickImage(_ sender: UIBarButtonItem) {
        
        // Create a configuration object
        var config = PHPickerConfiguration()

        // Set the filter to only show images as options (i.e. no videos, etc.).
        config.filter = .images

        // Request the original file format. Fastest method as it avoids transcoding.
        config.preferredAssetRepresentationMode = .current

        // Only allow 1 image to be selected at a time.
        config.selectionLimit = 1

        // Instantiate a picker, passing in the configuration.
        let picker = PHPickerViewController(configuration: config)

        // Set the picker delegate so we can receive whatever image the user picks.
        picker.delegate = self

        // Present the picker
        present(picker, animated: true)
    }
    
    
    @IBAction func shareTapped(_ sender: Any) {
        // Dismiss Keyboard
        view.endEditing(true)

        
        // Unwrap optional pickedImage
        guard let image = pickedImage,
              // Create and compress image data (jpeg) from UIImage
              let imageData = image.jpegData(compressionQuality: 0.1) else {
            return
        }

        // Create a Parse File by providing a name and passing in the image data
        let imageFile = ParseFile(name: "image.jpg", data: imageData)

        // Create Post object
        var post = Post()

      
        post.imageFile = imageFile
        post.caption = captionTextField.text

       
        post.user = Users.current

     
        post.save { [weak self] result in

            
            DispatchQueue.main.async {
                switch result {
                case .success(let post):
                    print("✅ Post Saved! \(post)")

                    if var currentUser = Users.current {

                        // Update the `lastPostedDate` property on the user with the current date.
                        currentUser.lastPostedDate = Date()

                        // Save updates to the user (async)
                        currentUser.save { [weak self] result in
                            switch result {
                            case .success(let user):
                                print("✅ User Saved! \(user)")

                                // Switch to the main thread for any UI updates
                                DispatchQueue.main.async {
                                    // Return to previous view controller
                                    self?.navigationController?.popViewController(animated: true)
                                }

                            case .failure(let error):
                                self?.showAlert(description: error.localizedDescription)
                            }
                        }
                    }

                case .failure(let error):
                    self?.showAlert(description: error.localizedDescription)
                }
            }
        }

    }
    
    
    @IBAction func takePhoto(_ sender: Any) {
        
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print("❌📷 Camera not available")
            return
        }

        
        let imagePicker = UIImagePickerController()

       
        imagePicker.sourceType = .camera

     
        imagePicker.allowsEditing = true

    
        imagePicker.delegate = self

       
        present(imagePicker, animated: true)

    }
    
    
    
    @IBAction func screenTapped(_ sender: Any) {
        // Dismiss keyboard
        view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    private func showAlert(description: String? = nil) {
        let alertController = UIAlertController(title: "Oops...", message: "\(description ?? "Please try again...")", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }



}

extension PostViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        // Dismiss the picker
        picker.dismiss(animated: true)

        // Make sure we have a non-nil item provider
        guard let provider = results.first?.itemProvider,
           // Make sure the provider can load a UIImage
           provider.canLoadObject(ofClass: UIImage.self) else { return }

     
        provider.loadObject(ofClass: UIImage.self) { [weak self] object, error in

           
           guard let image = object as? UIImage else {

             
              self?.showAlert()
              return
           }

           
            if error != nil {
               self?.showAlert()
              return
           } else {

           
              DispatchQueue.main.async {

                 
                 self?.previewImage.image = image

                 
                 self?.pickedImage = image
              }
           }
        }
    }
    

}

extension PostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        

        picker.dismiss(animated: true)


        guard let image = info[.editedImage] as? UIImage else {
            print("❌📷 Unable to get image")
            return
        }

        
        previewImage.image = image

        
        pickedImage = image
    }
}
