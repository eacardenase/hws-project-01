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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register the UITableViewCell class and assign a reuse identifier
        tableView.register(PictureCell.self, forCellReuseIdentifier: PictureCell.reuseIdentifier)
        
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PictureCell.reuseIdentifier, for: indexPath) as? PictureCell
            else { fatalError("Could not cast tableViewCell into PictureCell") }
        let model = Picture(name: weatherPictures[indexPath.row])
        
        cell.textLabel?.text = model.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let imageName = weatherPictures[indexPath.row]
        let vc = DetailViewController(selectedImageName: imageName)
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
