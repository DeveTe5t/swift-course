//
//  TextExample.swift
//  CourseiOSApp
//
//  Created by Totus tuo on 11/06/24.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        VStack {
            Text("Hey, you").font(.headline)
            Text("Custom").font(.system(size: 40, weight: .light, design: .monospaced))
                .italic()
                .bold()
                .underline()
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .background(.black).cornerRadius(15.0)                
            
            Text("Heya Heyo Heyos etc").frame(width: 50).lineLimit(3).lineSpacing(3)
        }
    }
}

#Preview {
    TextExample()
}
