//
//  ContentView.swift
//  BookApp
//
//  Created by Gokhan Bozkurt on 9.05.2022.
//

import SwiftUI

struct ContentView: View {
    enum Action {
        case addBook, more
    }
    @State private var performAction = false
    @State private var actionType:Action?
    @EnvironmentObject var myBook:BookItems
    //@StateObject var bookItems = BookItems()
    var body: some View {
        NavigationView {
            VStack {
                List() {
                    ForEach(myBook.books) { book in
                        HStack {
                            VStack(alignment:.leading,spacing: 6) {
                                Text("\(book.title)")
                                    .font(.headline)
                                    
                                Text("\(book.author)")
                                    .font(.caption)
                            }
                            Spacer()
                            Button("More") {
                                self.actionType = .more
                                self.myBook.selectedBook = book
                                self.performAction = true
                            }
                            .padding(.horizontal)
                            .padding(.vertical,5)
                            .background(.blue)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                            .buttonStyle(BorderedButtonStyle())
                        }
                    }.onDelete { index in
                        myBook.delteBook(at: index)
                    }
                }
                .sheet(isPresented: $performAction) {
                    if self.actionType == .more {
                        SingleBookView().environmentObject(self.myBook)
                    } else {
                        NewEditBookView().environmentObject(self.myBook)
                    }
                }
            }
            .navigationTitle("MyBooks")
            .toolbar {
                Button {
                    self.actionType = .addBook
                    self.performAction.toggle()
                } label: {
                    Image(systemName: "plus.circle.fill")
                }

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(BookItems())
    }
}
