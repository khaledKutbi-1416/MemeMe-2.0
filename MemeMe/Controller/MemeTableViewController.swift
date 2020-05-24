//  MemeTableViewController.swift
//  MemeMe
//
//  Created by Khaled Kutbi on 15/09/1441 AH.
//  Copyright © 1441 udacity. All rights reserved.
import UIKit

class MemeTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    //MARK:- Outlets
    @IBOutlet weak var memeTableView: UITableView!
    
    //MARK: - Properties
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
        self.settingMemeTable()
        self.messageeEmpetyTable()
        messageLabel()
    }
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
        self.memeTableView.reloadData()
        self.messageeEmpetyTable()
    }
    //MARK: - Actions
    @IBAction func addMemeAction(_ sender: Any) {
        self.performSegue(withIdentifier: "addMeme", sender: nil)
    }
    
    //MARK: - Handlers
    
    //To display message no meme found
    func messageeEmpetyTable(){
        
        if memes.isEmpty{
        
        hidde(isHidde: false)

        }else{
        hidde(isHidde: true)
        }
       }

    func hidde(isHidde: Bool) {
        
        self.mainVeiewlebel.isHidden = isHidde
        self.memeTableView.isHidden = !isHidde
        
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
    //MARK: - TableView Delegate functions
    func settingMemeTable(){
        self.memeTableView.delegate = self
        self.memeTableView.dataSource  = self
        self.memeTableView.separatorStyle = .none
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! memeTableCell
        
        cell.memedImage.image = memes[indexPath.row].memedImage
        imageToDetails = memes[indexPath.row].memedImage
        cell.imageText.text = memes[indexPath.row].topText! + ".." + memes[indexPath.row].bottomText!
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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

//MARK: - TableView cell
class memeTableCell: UITableViewCell{
    
    @IBOutlet weak var memedImage: UIImageView!
    @IBOutlet weak var imageText: memeCellLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
}
