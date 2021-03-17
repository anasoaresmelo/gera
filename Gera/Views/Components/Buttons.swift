//
//  Buttons.swift
//  Gera
//
//  Created by iris on 17/03/21.
//

import SwiftUI

struct Buttons: View {
    
    @Binding var name: String
    
    var action: (() -> Void)?
    
    var body: some View {
        Button(action: {
            if (action != nil) {
                action!()
            }
        }) {
            HStack {
                Text(name)
                    .foregroundColor(Color(.systemBackground))
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width/1.2)
            .background(Color(.systemPurple))
            .cornerRadius(7.0)
        }
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons(name: Binding.constant("geraaa"))
    }
}
