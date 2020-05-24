//  MemeCollectionViewController.swift
//  MemeMe
//
//  Created by Khaled Kutbi on 15/09/1441 AH.
//  Copyright © 1441 udacity. All rights reserved.
import UIKit

class MemeCollectionViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource {
 
   // MARK:- Properties
    @IBOutlet weak var memeCollection: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    let mainVeiewlebel = UILabel()
    
    var imageToDetails: UIImage!
    var memes: [Meme]! {
          let object = UIApplication.shared.delegate
          let appDelegate = object as! AppDelegate
          return appDelegate.memes
      }
    
    //MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        configurCollectionFlowLayout()
        delegation()
        messageeEmpetyCollection()
        messageLabel()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.memeCollection.reloadData()
        messageeEmpetyCollection()
    }
    //MARK: - Actions
    
    @IBAction func addMemeAction(_ sender: Any) {
        
      self.performSegue(withIdentifier: "addMeme", sender: nil)

    }
    
    
    //MARK: - Handlers
    
    //To display message no meme found
    func messageeEmpetyCollection(){
     
      if memes.isEmpty{
           
           hidde(isHidde: false)

           }else{
           hidde(isHidde: true)
           }
    }
    func hidde(isHidde: Bool) {
        
        self.mainVeiewlebel.isHidden = isHidde
        self.memeCollection.isHidden = !isHidde
        
    }
    func messageLabel(){
           mainVeiewlebel.frame = CGRect(x:0, y:0, width: 300, height: 25)
           mainVeiewlebel.text = "No meme found"
           mainVeiewlebel.center = self.view.center
           mainVeiewlebel.font = mainVeiewlebel.font.withSize(30)
           mainVeiewlebel.backgroundColor = .clear
           mainVeiewlebel.textColor = .lightGray
           mainVeiewlebel.numberOfLines = 0
           mainVeiewlebel.textAlignment = .center
           self.view.addSubview(mainVeiewlebel)
       }
    
    //MARK: - collectionView Delegate functions
    func hidde(isHhidde: Bool){
        
        self.mainVeiewlebel.isHidden = isHhidde
        self.memeCollection.isHidden = !isHhidde

    }
    func configurCollectionFlowLayout(){
        let space:CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0

        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
    
    func delegation(){
        self.memeCollection.delegate = self
        self.memeCollection.dataSource  = self
    

        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! memeCollectionCell
        cell.imageView.image = memes[indexPath.row].memedImage
        imageToDetails = memes[indexPath.row].memedImage
        return cell
     }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          self.performSegue(withIdentifier: "memeDetails", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          
           if segue.identifier == "memeDetails"   {
               // pass memed image to the details view.
             let detailsVC = segue.destination as? memeDetailsViewController
               
                   detailsVC!.recivedMemedImage = imageToDetails
        }
    }
}

class memeCollectionCell: UICollectionViewCell{
    
    //MARK: - Properties
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    

    }
    
}
