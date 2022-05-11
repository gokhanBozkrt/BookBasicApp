//
//  SingleBookView.swift
//  BookApp
//
//  Created by Gokhan Bozkurt on 10.05.2022.
//

import SwiftUI

struct SingleBookView: View {
    @EnvironmentObject var myBook: BookItems
    @Environment(\.presentationMode) var presentationMode
    @State private var editNote = false
    
    var body: some View {
        NavigationView {
            VStack(spacing:20) {
                Text(myBook.selectedBook?.author ?? "Author")
                    .font(.title)
                Text(myBook.selectedBook?.title ?? "Title")
                    .font(.callout)
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5)
                    .padding()
                Button("Edit") {
                    self.editNote = true
                }
                .padding(.horizontal)
                .padding(.vertical,5)
                .background(.blue)
                .cornerRadius(5)
                .foregroundColor(.white)
                Spacer()
            }
            .navigationTitle(myBook.selectedBook?.title ?? "Title")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Dismiss") {
                        self.myBook.selectedBook = nil
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .sheet(isPresented: $editNote) {
                NewEditBookView().environmentObject(self.myBook)
            }
            
        }
    }
}

struct SingleBookView_Previews: PreviewProvider {
    static var previews: some View {
        SingleBookView()
            .environmentObject(BookItems())
    }
}
