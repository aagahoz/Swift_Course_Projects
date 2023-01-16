//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by Agah Özdemir on 16.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    var isMurat = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePic))
        
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func changePic(){
        
        if isMurat == true
        {
            imageView.image = UIImage(named: "muratGogebakan")
            myLabel.text = "Murat Gogebakan"
            isMurat = false
        }
        else
        {
            myLabel.text = "Cem Karaca"
            imageView.image = UIImage(named: "cemKaraca")
            isMurat = true
        }
    }
}

