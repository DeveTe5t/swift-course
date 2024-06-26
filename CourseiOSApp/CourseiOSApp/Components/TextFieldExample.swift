//
//  TextFieldExample.swift
//  CourseiOSApp
//
//  Created by Totus tuo on 23/06/24.
//

import SwiftUI

struct TextFieldExample: View {
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        
        VStack {
            TextField("Write your email", text: $email)
                .keyboardType(.emailAddress)
                .padding(16) // first padding and then background
                .background(.gray.opacity(0.2))
                .cornerRadius(16.0)
                .padding(.horizontal, 32)
                .onChange(of: email) { oldValue, newValue in
                    print("Old value was: \(oldValue) and New vaule is: \(newValue)")
            }
            
            SecureField("Write your password", text: $password)
                // .keyboardType(.default)
                .padding(16) // first padding and then background
                .background(.gray.opacity(0.2))
                .cornerRadius(16.0)
                .padding(.horizontal, 32)
                .onChange(of: password) { oldValue, newValue in
                    print("Old value was: \(oldValue) and New vaule is: \(newValue)")
            }
        }
    }
}

#Preview {
    TextFieldExample()
}
