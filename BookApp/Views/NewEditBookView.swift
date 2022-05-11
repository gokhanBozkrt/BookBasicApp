//
//  NewEditBookView.swift
//  BookApp
//
//  Created by Gokhan Bozkurt on 10.05.2022.
//

import SwiftUI

struct NewEditBookView: View {
    @Environment(\.presentationMode) var presentaionMode
    @EnvironmentObject var myBook: BookItems
    @State private var title = ""
    @State private var author = ""
    @State private var notes = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title", text: $title)
                    TextField("Author", text: $author)
                       
                    VStack {
                        TextEditor(text: $notes)
                            .font(.custom("HelveticaNeue", size: 13))
                            .lineSpacing(4)
                            .frame(height:400)
                            .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.gray.opacity(0.2),lineWidth: 4)
                            )
                         
                    }
                  //  .padding()
                 
                }
                
                
            }.onAppear {
                if let selectedBook = myBook.selectedBook {
                    self.title = selectedBook.title
                    self.author = selectedBook.author
                    self.notes = selectedBook.notes
                }
            }
            .navigationTitle(self.myBook.selectedBook == nil ? "NewBook" : "Edit Book")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Save") {
                    if self.myBook.selectedBook == nil {
                        // add new book
                        self.myBook.addBook(with: self.title, author: self.author, notes: self.notes)
                        self.myBook.selectedBook = nil
                    } else {
                        self.myBook.updateBook(title: self.title, author: self.author, notes: self.notes)
                    }
                    self.presentaionMode.wrappedValue.dismiss()
                }
                .disabled(self.author == "" && self.title == "")
            }
            
        }
    }
}

struct NewEditBookView_Previews: PreviewProvider {
    static var previews: some View {
        NewEditBookView()
            .environmentObject(BookItems())
    }
}
