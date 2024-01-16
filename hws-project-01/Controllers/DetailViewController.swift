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
    var selectedImageIndex: Int
    var imagesArrayLength: Int
    lazy var imageView: UIImageView = {
        let imageView =  UIImageView(image: UIImage(named: selectedImageName))
        
        return imageView
    }()
    
    // MARK: - Lifecycle
    
    init(selectedImageName: String, selectedImageIndex: Int, imageArrayLength: Int) {
        self.selectedImageName = selectedImageName
        self.selectedImageIndex = selectedImageIndex
        self.imagesArrayLength = imageArrayLength
        
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
        title = "Picture \(selectedImageIndex + 1) of \(imagesArrayLength)"
        
        // apply changes only to the current view controller
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
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

// MARK: - Actions

extension DetailViewController {
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.7)
        else {
            print("DEBUG: No image found")
            
            return
        }
        
        // charged to share something from the app
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: [])
        // explicitly required on iPads
        activityViewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        present(activityViewController, animated: true)
    }
}
