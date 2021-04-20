//
//  CardPreview.swift
//  Gera
//
//  Created by Ana Carolina Soares de Melo on 02/03/21.
//

import SwiftUI


struct CardPreview: View {
    @Binding var color: LinearGradient
    @Binding var message: String
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .fill(color)
                .frame(width: UIScreen.main.bounds.width/1.17, height: UIScreen.main.bounds.width/1.9)

            if message == "" {
                TextCard(message: .constant("Sua mensagem aqui"))
            } else {
                TextCard(message: $message)
            }
        })
    }
}

struct CardPreview_Previews: PreviewProvider {
    static var previews: some View {
        CardPreview(color: Binding.constant(LinearGradient(gradient: Gradient(colors: [Color(red: 125 / 255, green: 80 / 255, blue: 189 / 255), Color(red: 163 / 255, green: 91 / 255, blue: 215 / 255)]), startPoint: .top, endPoint: .bottom)), message: Binding.constant("funciona?"))
    }
}
