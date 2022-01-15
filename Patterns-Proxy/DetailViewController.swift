//
//  DetailViewController.swift
//  Patterns-Proxy
//
//  Created by Ruslan on 15.01.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    private let url = URL(string: "https://images.unsplash.com/photo-1642201388117-bba94d7887ec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1332&q=80")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPhoto()
    }
    
    private func loadPhoto() {
        
        let service = LoadService()
        let proxy = Proxy(service: service)
        
        proxy.loadPhoto(url: url) { [weak self] data, response, error in
            guard let self = self, error == nil, let data = data else { return }
            DispatchQueue.main.async {
                self.photoImageView.image = UIImage(data: data)
            }
        }
    }
    
    @IBAction func updatePhotoButtonDidTapped(_ sender: UIButton) {
        
    }
}
