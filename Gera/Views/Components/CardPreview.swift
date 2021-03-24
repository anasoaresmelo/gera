//
//  CardPreview.swift
//  Gera
//
//  Created by Ana Carolina Soares de Melo on 02/03/21.
//

import SwiftUI


struct CardPreview: View {
    @Binding var color: Color
    @Binding var message: String
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .frame(width: UIScreen.main.bounds.width/1.2, height: UIScreen.main.bounds.width/1.9)
                .foregroundColor(color)
            if message == "" {
                TextCard(message: Binding.constant("Sua mensagem aqui"))
            } else {
                TextCard(message: $message)
            }
        })
    }
}

struct CardPreview_Previews: PreviewProvider {
    static var previews: some View {
        CardPreview(color: Binding.constant(Color(.systemPurple)), message: Binding.constant("funciona?"))
    }
}
