//
//  ContentView.swift
//  BookApp
//
//  Created by Gokhan Bozkurt on 9.05.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var bookItems = BookItems()
    var body: some View {
        Text(bookItems.books[0].author)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
