//
//  TableViewController.swift
//  hws-project-01
//
//  Created by Edwin Cardenas on 1/13/24.
//

import UIKit

class TableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var weatherPictures = [String]()
    static let reuseIdentifier = "Picture"
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register the UITableViewCell class and assign a reuse identifier
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Self.reuseIdentifier)
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                weatherPictures.append(item)
            }
        }
    }
}

extension TableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherPictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.reuseIdentifier, for: indexPath)
        
        cell.textLabel?.text = weatherPictures[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let imageName = weatherPictures[indexPath.row]
        let vc = DetailViewController(titleLabel: imageName)
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
