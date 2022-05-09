//
//  BookViewModel.swift
//  BookApp
//
//  Created by Gokhan Bozkurt on 9.05.2022.
//

import Foundation

class BookItems: NSObject,ObservableObject {
    @Published var books = [BookItem]()
    @Published var selectedBook:BookItem?
    
   override init() {
        self.books = StorageFunctions.retrieveBook()
    }
    
    func addBook(with title: String, author: String , notes: String) {
        let book = BookItem(title: title, author: author, notes: notes)
        books.append(book)
        saveBooks()
    }
    
    func saveBooks() {
        StorageFunctions.storeBooks(books: books)
    }
    
    func delteBook(at indexSet: IndexSet) {
        books.remove(atOffsets: indexSet)
        saveBooks()
    }
    
    func updateBook(title:String,author:String,notes:String) {
        let bookIndex = books.firstIndex { $0.id == selectedBook!.id}
        books[bookIndex!].title = title
        books[bookIndex!].author = author
        books[bookIndex!].notes = notes
        selectedBook = books[bookIndex!]
        saveBooks()
        
    }
    
    func book(at index:Int) -> BookItem {
        return books[index]
    }
    
}
