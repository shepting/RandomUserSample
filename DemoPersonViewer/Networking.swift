//
//  Networking.swift
//  DemoPersonViewer
//
//  Created by Steven Hepting on 6/23/17.
//  Copyright © 2017 Hepting. All rights reserved.
//

import Foundation



func parseUsersJSON(from data: Data) -> [User] {
    do {
        if let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
            var users = [User]()
            for userJSON in json.array("results") {
                if let user = User(json: userJSON) {
                    users.append(user)
                }
            }
            return users
        }
    } catch {
        print("Couldn't parse JSON: \(error)")
        if let utf8String = String(data: data, encoding: String.Encoding.utf8) {
            print("Received: \(utf8String)")
        }
    }

    return []
}



struct Client {

    func loadUsers(completion: @escaping ([User], Error?) -> ()) {
        let url = URL(string: "https://randomuser.me/api?results=20")!
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            var users = [User]()
            if let data = data {
                users = parseUsersJSON(from: data)
            }

            if let error = error {
                print(error)
            }

            completion(users, error)
        }
        task.resume()
    }
}
