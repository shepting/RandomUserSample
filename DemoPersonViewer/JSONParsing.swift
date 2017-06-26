//
//  JSONParsing.swift
//  DemoPersonViewer
//
//  Created by Steven Hepting on 6/26/17.
//  Copyright © 2017 Hepting. All rights reserved.
//

import Foundation

typealias JSONDict = [String: Any]

extension Dictionary where Key == String {
    func string(_ key: String) -> String? {
        if let value = self[key] as? String {
            return value
        } else {
            print("Missing parameter '\(key)'")
            return nil
        }
    }

    func array(_ key: String) -> [JSONDict] {
        if let value = self[key] as? [JSONDict] {
            return value
        } else {
            print("Missing parameter '\(key)'")
            return []
        }
    }

    func dict(_ key: String) -> JSONDict? {
        if let value = self[key] as? JSONDict{
            return value
        } else {
            print("Missing parameter '\(key)'")
            return nil
        }
    }
}

