//
//  BookItem.swift
//  BookApp
//
//  Created by Gokhan Bozkurt on 9.05.2022.
//

import Foundation


struct BookItem: Codable, Identifiable {
    let id = UUID()
    var title: String
    var author: String
    var notes: String
}
