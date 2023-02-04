//
//  ViewController.swift
//  KentSimgeleriApp_TableView
//
//  Created by Agah Özdemir on 2.02.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var landmarkNames = [String]()
    var landMarkImages = [UIImage]()
    
    var chosenLandMarkName = ""
    var chosenLandMarkImage = UIImage()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        landmarkNames.append("ANKARA")
        landmarkNames.append("IZMIR")
        landmarkNames.append("ISTANBUL")
        landmarkNames.append("ERZINCAN")
        
        landMarkImages.append(UIImage(named: "ankara_simge.jpg")!)
        landMarkImages.append(UIImage(named: "izmir_simge.jpg")!)
        landMarkImages.append(UIImage(named: "istanbul_simge.jpg")!)
        landMarkImages.append(UIImage(named: "erzincan_simge.jpg")!)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
//        cell.textLabel?.text = "test"
        
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
//        content.image = landMarkImages[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandMarkName = landmarkNames[indexPath.row]
        chosenLandMarkImage = landMarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinitionVC = segue.destination as! DetailsVC
            destinitionVC.selectedLandMarkName = chosenLandMarkName
            destinitionVC.selectedLandMarkImage = chosenLandMarkImage
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row)
            self.landMarkImages.remove(at: indexPath.row)
//            tableView.reloadData()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
