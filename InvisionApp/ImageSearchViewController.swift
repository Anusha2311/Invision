//
//  ImageSearchViewController.swift
//  InvisionApp
//
//  Created by Anusha on 12/30/16.
//  Copyright © 2016 Rare Mile. All rights reserved.
//

import UIKit

class ImageSearchViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionViewtags: UICollectionView!
    @IBOutlet weak var imageView: UIImageView!

    var empty = [AnyObject]()
    var selectedImage : UIImage!
    var spinner:UIActivityIndicatorView?
    var overlayView:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.defaultSetup()
        self.showSpinner()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func defaultSetup() {
        self.imageView.image = self.selectedImage
        self.collectionViewtags.registerNib(tagsCollectionViewCell.nib(), forCellWithReuseIdentifier: tagsCollectionViewCell.cellIdentifier())
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        self.hideSpinner()
        let cell = collectionViewtags.dequeueReusableCellWithReuseIdentifier(tagsCollectionViewCell.cellIdentifier(), forIndexPath: indexPath) as! tagsCollectionViewCell
       
        let image : [AnyObject] = empty[indexPath.row] as! [AnyObject]
        cell.tagsText.text = image[0] as? String
        cell.tagsPercent.text = image[1] as? String
        return cell
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.empty.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
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
    
    func showOverlayView() {
        self.overlayView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        self.overlayView!.backgroundColor = UIColor.blackColor()
        self.overlayView!.alpha = 0.3
        self.view.addSubview(self.overlayView!)
    }
    
    func hideSpinner() {
        if let spinner = self.spinner {
            spinner.stopAnimating()
            self.hideOverlayView()
            self.spinner!.removeFromSuperview()
            self.spinner = nil
        }
    }
    
    func hideOverlayView() {
        if let _ = self.overlayView {
            self.overlayView!.removeFromSuperview()
        }
    }

}
