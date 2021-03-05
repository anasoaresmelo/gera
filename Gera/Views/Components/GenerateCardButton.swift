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
            VStack {
                ZStack(alignment: Alignment(horizontal: .center, vertical: .center), content: {
                    RoundedRectangle(cornerRadius: 15.0, style: .continuous)
                        .frame(width: UIScreen.main.bounds.width/1.2, height: 70)
                        .foregroundColor(.purple)
                    HStack {
                        Text("Gerar Cartão")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }).padding(.top, 20)
            }
        }
    }
}

struct GenerateCardButton_Previews: PreviewProvider {
    static var previews: some View {
        GenerateCardButton()
    }
}
