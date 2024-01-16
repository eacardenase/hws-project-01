//
//  DetailViewController.swift
//  hws-project-01
//
//  Created by Edwin Cardenas on 1/15/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var titleLabel: String?
    
    // MARK: - Lifecycle
    
    init(titleLabel: String? = nil) {
        self.titleLabel = titleLabel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
}

// MARK: - Helpers

extension DetailViewController {
    func configureUI() {
        guard let titleLabel = titleLabel else { return }
        let imageView = UIImageView(image: UIImage(named: titleLabel))
        title = titleLabel
        
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
