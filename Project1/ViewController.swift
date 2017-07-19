//
//  ViewController.swift
//  Project1
//
//  Created by Shaun Duffus on 2017-07-10.
//  Copyright © 2017 DuffCo. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl"){
        pictures.append(item)
        print(pictures)
                
            }
        }
       
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
        
    }
    
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
            cell.textLabel?.text = pictures[indexPath.row]
            return cell
        }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // 1: try loading the "Detail" view controller and typecasting to be DetailViewController

            if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2: success! Set its selectedImage property
            
            vc.selectedImage  = pictures[indexPath.row]
            // 3: now push in onto the navigation controller
            
            navigationController?.pushViewController(vc, animated: true)
        
        }

    }

}

