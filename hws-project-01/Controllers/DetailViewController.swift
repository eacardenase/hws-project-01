//
//  DetailViewController.swift
//  hws-project-01
//
//  Created by Edwin Cardenas on 1/15/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var selectedImageName: String
    lazy var imageView: UIImageView = {
        let imageView =  UIImageView(image: UIImage(named: selectedImageName))
        
        return imageView
    }()
    
    // MARK: - Lifecycle
    
    init(selectedImageName: String) {
        self.selectedImageName = selectedImageName
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.hidesBarsOnTap = false
    }
    
}

// MARK: - Helpers

extension DetailViewController {
    func configureUI() {
        title = selectedImageName
        
        // apply changes only to the current view controller
        navigationItem.largeTitleDisplayMode = .never
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
