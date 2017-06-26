//
//  MasterViewController.swift
//  DemoPersonViewer
//
//  Created by Steven Hepting on 6/23/17.
//  Copyright © 2017 Hepting. All rights reserved.
//

import UIKit
import PINRemoteImage

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var users = [User]()


    override func viewDidLoad() {
        super.viewDidLoad()

        let table = self.tableView

        let apiClient = Client()
        apiClient.loadUsers { (users, error) in
            self.users = users
            DispatchQueue.main.async {
                table?.reloadData()
            }
        }

        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let user = users[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.user = user
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let user = users[indexPath.row]
        cell.textLabel!.text = user.first.capitalized
        // Placeholder color ensures that  the imageView is in the image
        // hierarchy upon first layout (no need to wait for scroll or 
        // interaction for thumbnail to show up)
        cell.imageView?.image = imageWithColor(color: .lightGray)
        cell.imageView?.pin_setImage(from: user.thumbnail)
        cell.imageView?.roundWithRadius(24)

        return cell
    }

}

