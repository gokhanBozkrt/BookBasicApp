//
//  SwiftUIView.swift
//  BookApp
//
//  Created by Gokhan Bozkurt on 11.05.2022.
//

import SwiftUI

struct SwiftUIView: View {
    
    @State private var textView = ""
    var body: some View {
        TextEditor(text: $textView)
            .font(.custom("HelveticaNeue", size: 13))
            .lineSpacing(40)
            .frame(width: 290, height: 400)
            .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.gray.opacity(0.2),lineWidth: 4)
            )
            .padding(.horizontal)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
