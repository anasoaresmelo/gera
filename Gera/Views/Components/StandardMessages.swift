//
//  StandardMessages.swift
//  Gera
//
//  Created by iris on 25/03/21.
//

import SwiftUI

struct StandardMessages: View {
    @Binding var message: String
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    message = "Tô mandando a conta!"
                }) {
                    Text("Tô mandando a conta!")
                }
                .padding(.leading)
                .padding(.top, 10)
                Spacer()
            }
            HStack {
                Button(action: {
                    message = "Você me deve!"
                }) {
                    Text("Você me deve!")
                }
                .padding(.leading)
                .padding(.top, 10)
                Spacer()
            }
            HStack{
                Button(action: {
                    message = "Pague meu dinheiro!"
                }) {
                    Text("Pague meu dinheiro!")
                }
                .padding(.leading)
                .padding(.top, 10)
                Spacer()
            }
        }.foregroundColor(Color(.systemPurple))
    }
}

struct StandardMessages_Previews: PreviewProvider {
    static var previews: some View {
        StandardMessages(message: .constant("me pague"))
    }
}
