//
//  ViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Benjamin Stone on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var movies = [Movie]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var font: CGFloat = 20.0 {
        didSet {
            tableView.reloadData() // THIS IS WHAT I WAS MISSING.. RELOAD DATA ONCE FONT HAS BEEN CHANGED!! 
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
        
    }

    func loadData() {
        movies = Movie.allMovies
    }
    
    // Unwind Segue:
    
    @IBAction func changeFont(segue: UIStoryboardSegue) {
        // get the font(float) from the other view controller
        
        guard let settingsVC = segue.source as? SettingController else {
            fatalError("Failed to get access to SettingController")
        }
        font = CGFloat(settingsVC.font)
    }

}

//

extension ViewController: UITableViewDataSource {
    
    // Table View required methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let movie = movies[indexPath.row]
        
        // assign text
        cell.textLabel?.text = movie.name
        cell.detailTextLabel?.text = movie.year.description
        // assign font
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Light", size: font)
        cell.detailTextLabel?.font = UIFont(name: "HelveticaNeue-Light", size: font)
        
        return cell
    }
    
    
}

