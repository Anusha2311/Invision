//
//  ViewController.swift
//  InvisionApp
//
//  Created by Pushkar Pandey on 12/30/16.
//  Copyright © 2016 Rare Mile. All rights reserved.
//

import UIKit
import ObjectMapper
import AssetsLibrary
import Photos

class ViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var chooseButton: UIButton!
    @IBOutlet weak var fileNameLabel: UILabel!
    @IBOutlet weak var searchBtn: UIButton!
    
    @IBOutlet var rootContainerView: UIView!
    var contentViewController:UIViewController?
    var baseContentViewController:UIViewController?
    
    var isFileSelected = false
    var selectedImage :UIImage!
    var imageData: NSData?
    var empty = [AnyObject]()
    var spinner:UIActivityIndicatorView?
    var overlayView:UIView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpButton()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let params = ["image" : "http://cdn.playbuzz.com/cdn/936adc4b-d92e-4b29-9092-ca789bee729c/092f0012-da22-47c0-8184-d65659357647.jpg"]
        if segue.identifier == "push" {
            if self.validateFields()==true{
                self.showSpinner()
                ImageSearchService.sendSearchRequest(params, imageData: imageData!, success: { (response) in
                    self.hideSpinner()
                    let finalResponse = response as! NSDictionary
                    for (key , value) in finalResponse {
                        self.empty.append(value)
                    }
                    
                    if let vc = segue.destinationViewController as? ImageSearchViewController {
                        vc.empty = self.empty
//                        vc.selectedImage = self.selectedImage
                        vc.collectionViewtags.reloadData()
                    }
                    
                    
//                    let vc  = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ImageSearchViewController") as? ImageSearchViewController
//                    vc!.selectedImage = self.selectedImage
//                    vc!.empty = self.empty
                    //                self.pushContentViewController(vc!)
//                    self.presentViewController(vc!, animated: true, completion: nil)
                    }, failure: { (error) in
                        
                        let alert = UIAlertController(title: "Alert", message: "Error try again", preferredStyle: UIAlertControllerStyle.Alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                        self.presentViewController(alert, animated: true, completion: nil)
                })
            }
            
//            (segue.destinationViewController as! ImageSearchViewController).empty = self.empty
            (segue.destinationViewController as! ImageSearchViewController).selectedImage = self.selectedImage
        }
    }
    
    @IBAction func didTapChoosebtn(sender: UIButton) {
        let ImagePicker = UIImagePickerController()
        ImagePicker.delegate = self
        ImagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(ImagePicker, animated: true, completion: nil)
        
    }
    
//    @IBAction func didTapSearchButton(sender: UIButton) {
//        
//        let params = ["image" : "http://cdn.playbuzz.com/cdn/936adc4b-d92e-4b29-9092-ca789bee729c/092f0012-da22-47c0-8184-d65659357647.jpg"]
//        
//        if self.validateFields()==true{
//            self.showSpinner()
//            ImageSearchService.sendSearchRequest(params, imageData: imageData!, success: { (response) in
//                self.hideSpinner()
//                let finalResponse = response as! NSDictionary
//                for (key , value) in finalResponse {
//                    self.empty.append(value)
//                }
//                let vc  = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ImageSearchViewController") as? ImageSearchViewController
//                vc!.selectedImage = self.selectedImage
//                vc!.empty = self.empty
////                self.pushContentViewController(vc!)
//                self.presentViewController(vc!, animated: true, completion: nil)
//                }, failure: { (error) in
//                    
//                   let alert = UIAlertController(title: "Alert", message: "Error try again", preferredStyle: UIAlertControllerStyle.Alert)
//                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
//                    self.presentViewController(alert, animated: true, completion: nil)
//            })
//        }
//        // without image upload
//        
////        ImageSearchService.sendSearchRequest(params, success: { (response) in
////            let finalResponse = response as! NSDictionary
////            for (key , value) in finalResponse {
////                self.empty.append(value)
////            }
////            let vc  = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ImageSearchViewController") as? ImageSearchViewController
////            vc!.selectedImage = self.selectedImage
////            vc!.empty = self.empty
////            self.presentViewController(vc!, animated: true, completion: nil)
////            }, failure: { (error) in
////                
////                // self.showErrorWithMessage("Error Try Again")
////                // self.hideSpinner()
////        })
//    }
    
    func validateFields() -> Bool
    {
        if !isFileSelected {
            let alert = UIAlertController(title: "Alert", message: "Please select an image", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    func setUpButton()
        {
            chooseButton.layer.cornerRadius = 3;
            chooseButton.layer.borderWidth = 1;
            chooseButton.layer.borderColor = UIColor.blackColor().CGColor
            searchBtn.layer.cornerRadius = 5
            searchBtn.layer.borderWidth = 1
            searchBtn.layer.borderColor = UIColor.blackColor().CGColor
        }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        isFileSelected = true
        if let imageURL = info[UIImagePickerControllerReferenceURL] as? NSURL {
            let imageName = imageURL.path
            fileNameLabel.text = imageName
        }
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.selectedImage = pickedImage
            let imageData: NSData = UIImageJPEGRepresentation(pickedImage, 0.5)!
            self.imageData = imageData
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func showSpinner() {
        if let _ = self.spinner {
            self.spinner!.startAnimating()
        } else {
            self.spinner = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
            self.spinner!.color = UIColor.blackColor()
            self.spinner!.center = self.view.center
            self.showOverlayView()
            self.view.addSubview(self.spinner!)
            self.view.bringSubviewToFront(self.spinner!)
            self.spinner!.startAnimating()
        }
    }
    
    
    func hideSpinner() {
        if let spinner = self.spinner {
            spinner.stopAnimating()
            self.hideOverlayView()
            self.spinner!.removeFromSuperview()
            self.spinner = nil
        }
    }
    
    func showOverlayView() {
        self.overlayView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        self.overlayView!.backgroundColor = UIColor.blackColor()
        self.overlayView!.alpha = 0.3
        self.view.addSubview(self.overlayView!)
    }
    
    /**
     Helper method that removes the overlay view
     */
    func hideOverlayView() {
        if let _ = self.overlayView {
            self.overlayView!.removeFromSuperview()
        }
    }
    
    func pushContentViewController(contentViewController:UIViewController) {
        let topViewController = self.childViewControllers[self.childViewControllers.count - 1]
        topViewController.viewWillDisappear(true)
        self.addChildViewController(contentViewController)
        let frame = CGRectMake(self.rootContainerView.frame.origin.x, self.rootContainerView.frame.origin.y - 64, self.rootContainerView.frame.width, self.rootContainerView.frame.height)
        contentViewController.view.frame = frame
        contentViewController.view.alpha = 0
        self.rootContainerView.addSubview(contentViewController.view)
        
        // Animate the view from left to right
        UIView.animateWithDuration(0.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            let transformation = CGAffineTransformMakeTranslation(self.rootContainerView.frame.size.width, 0)
            contentViewController.view.transform = transformation
        }) { (finished:Bool) -> Void in
            contentViewController.view.alpha = 1
        }
        
        // Animate the view from right to left
        UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            let transformation = CGAffineTransformMakeTranslation(self.rootContainerView.frame.origin.x, 0)
            contentViewController.view.transform = transformation
        }) { (finished:Bool) -> Void in
        }
        
        contentViewController.didMoveToParentViewController(self)
        if let _ = self.baseContentViewController {
            
        } else {
            self.baseContentViewController = self.contentViewController
        }
        self.switchStateToPush(contentViewController)
    }
    func switchStateToPush(contentViewController:UIViewController) {
//        self.enableBackButton()
        //        self.disableHomeButton()
        //        self.disableNavigationDrawerButton()
        self.contentViewController = contentViewController
    }
    
    

        
    
}

