//
//  ContinueButton.swift
//  Gera
//
//  Created by Ana Carolina Soares de Melo on 02/03/21.
//

import SwiftUI

struct ContinueButton: View {
    var body: some View {
        Button(action: {}) {
            HStack {
                Text("Continuar")
                    .foregroundColor(Color(.systemBackground))
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width/1.2)
            .background(Color(.systemPurple))
            .cornerRadius(7.0)
        }
    }
}
    
    struct ContinueButton_Previews: PreviewProvider {
        static var previews: some View {
            ContinueButton()
        }
    }
