//  memeDetailsViewController.swift
//  MemeMe
//
//  Created by Khaled Kutbi on 17/09/1441 AH.
//  Copyright © 1441 udacity. All rights reserved.


import UIKit

class memeDetailsViewController: UIViewController {

    //MARK:- Outlet
    @IBOutlet weak var imageView: imageView!
    
    
    //MARK: - Properties
     var recivedMemedImage: UIImage!
    
    //MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = recivedMemedImage
        
    }
    

    
}
