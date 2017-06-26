//
//  User.swift
//  DemoPersonViewer
//
//  Created by Steven Hepting on 6/26/17.
//  Copyright © 2017 Hepting. All rights reserved.
//

import Foundation

struct User {
    let first: String
    let last: String
    let thumbnail: URL
    let fullProfile: URL

    init?(json: [String: Any]) {
        guard let name = json.dict("name") else { return nil }
        guard let first = name.string("first") else { return nil }
        guard let last = name.string("last") else { return nil }
        guard let thumbnail = json.dict("picture")?.string("thumbnail") else { return nil }
        guard let thumbnailURL = URL(string: thumbnail) else { return nil }
        guard let profile = json.dict("picture")?.string("large") else { return nil }
        guard let profileURL = URL(string: profile) else { return nil }

        self.first = first
        self.last = last
        self.thumbnail = thumbnailURL
        self.fullProfile = profileURL
    }
}
