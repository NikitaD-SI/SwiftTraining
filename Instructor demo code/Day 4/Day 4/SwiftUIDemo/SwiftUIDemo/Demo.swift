//
//  Demo.swift
//  SwiftUIDemo
//
//  Created by Instructor on 17/08/23.
//

import SwiftUI

struct Demo: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Text("This is my first iOS App using SwiftUI.")
        }
        .padding()
    }
}

struct Demo_Previews: PreviewProvider {
    static var previews: some View {
        Demo()
    }
}
