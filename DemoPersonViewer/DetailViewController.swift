//
//  DetailViewController.swift
//  DemoPersonViewer
//
//  Created by Steven Hepting on 6/23/17.
//  Copyright © 2017 Hepting. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var user: User?
    var thumbnail: UIImage?
    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var profileImageView: UIImageView!

    func configureView() {

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.detailDescriptionLabel.text = user?.first
        self.profileImageView.image = imageWithColor(color: .lightGray, size: CGSize(width: 120, height: 120))
        self.profileImageView.pin_setImage(from: user?.fullProfile) { result in
            if let _ = result.error {
                self.profileImageView.pin_setImage(from: self.user?.thumbnail)
            }

        }
        self.profileImageView.roundWithRadius(120)
    }

}

