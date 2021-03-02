//
//  BotaoContinuar.swift
//  Gera
//
//  Created by Ana Carolina Soares de Melo on 02/03/21.
//

import SwiftUI

struct BotaoContinuar: View {
    var body: some View {
        Button(action: {}) {
            VStack {
                ZStack(alignment: Alignment(horizontal: .center, vertical: .center), content: {
                    RoundedRectangle(cornerRadius: 15.0, style: .continuous)
                        .frame(width: UIScreen.main.bounds.width/1.2, height: 70)
                        .foregroundColor(.purple)
                    HStack {
                        Text("Continuar")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }).padding(.top, 20)
            }
        }
    }
}
    
    struct BotaoContinuar_Previews: PreviewProvider {
        static var previews: some View {
            BotaoContinuar()
        }
    }
