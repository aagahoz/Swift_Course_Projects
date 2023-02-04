//
//  DetailsVC.swift
//  KentSimgeleriApp_TableView
//
//  Created by Agah Özdemir on 4.02.2023.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var landmarkLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedLandMarkName = ""
    var selectedLandMarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        landmarkLabel.text = selectedLandMarkName
        imageView.image = selectedLandMarkImage

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
