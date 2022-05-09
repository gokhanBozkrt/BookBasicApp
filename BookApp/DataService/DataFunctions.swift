//
//  DataFunctions.swift
//  BookApp
//
//  Created by Gokhan Bozkurt on 9.05.2022.
//

import Foundation

class StorageFunctions {
  
    static let backupUrl = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("books.json")
    static let bundleUrl = Bundle.main.url(forResource: "ExampleBook", withExtension: "json")!
    
    static func retrieveBook() -> [BookItem] {
        var url = backupUrl
        if !FileManager().fileExists(atPath: backupUrl.path) {
            url = bundleUrl
        }
        let decoder = JSONDecoder()
        guard let data = try? Data(contentsOf: url)  else {
            fatalError("Url doesnt work")
          }
        guard let bookItems = try? decoder.decode([BookItem].self, from: data) else {
           fatalError("data not fount")
       }
        return bookItems
    }
    
    static func storeBooks(books: [BookItem]) {
        let encoder = JSONEncoder()
        guard let booksJsonData = try? encoder.encode(books) else {
            fatalError("Couldnt encode data")
        }
        let bookJson = String(data: booksJsonData, encoding: .utf8)
        
        do {
            try? bookJson?.write(to: backupUrl, atomically: true, encoding: .utf8)
        } catch {
            print("Couldnt save file to directory : \(error.localizedDescription)")
        }
    }
    
    
}
