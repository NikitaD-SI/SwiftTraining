//
//  Components.swift
//  SwiftUIDemo
//
//  Created by Instructor on 17/08/23.
//

import SwiftUI

struct Components: View {
    @State var name : String = ""
    @State var email : String = ""
    @State var phone : String = ""
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(Edge.Set.all)
            VStack {
                Text("Hello, World!")
                    .font(.title)
                    .foregroundColor(Color.red)
                Divider()
                TextField("Enter name", text: self.$name)
                    .padding()
                    .background(.white)
                TextField("Enter email", text: self.$email)
                    .padding()
                    .background(.white)
                TextField("Enter phone", text: self.$phone)
                    .padding()
                    .background(.white)
                Divider()
                Button("Tap me", action: {() -> Void in
                    
                })
                Text("\(self.name) \(self.email) \(self.phone)")
                    .background(.yellow)
                Circle()
                    .foregroundColor(.orange)
                Group {
                    Spacer()
                    Text("1")
                        .foregroundColor(.white)
                    Text("1")
                        .foregroundColor(.white)
                    Text("1")
                        .foregroundColor(.white)
                    
                }
            }
        }
        
    }
}

struct Components_Previews: PreviewProvider {
    static var previews: some View {
        Components()
    }
}
