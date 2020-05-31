//
//  Notes.swift
//  noteful
//
//  Created by Bradley Chesworth on 31/05/2020.
//  Copyright © 2020 Brad Chesworth. All rights reserved.
//

import Foundation

struct Note: Codable {
    let id = UUID()
    var title: String
    var body: String
}
