//
//  GenerateCardButton.swift
//  Gera
//
//  Created by iris on 03/03/21.
//

import SwiftUI

struct GenerateCardButton: View {
    var action: (() -> Void)?
    
    var body: some View {
        Button(action: {
            if (action != nil) {
                action!()
            }
        }) {
            HStack {
                Text("Gerar Cartão")
                    .foregroundColor(Color(.systemBackground))
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width/1.2)
            .background(Color(.systemPurple))
            .cornerRadius(7.0)
        }
    }
}

struct GenerateCardButton_Previews: PreviewProvider {
    static var previews: some View {
        GenerateCardButton()
            
    }
}
