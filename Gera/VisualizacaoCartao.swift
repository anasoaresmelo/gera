//
//  VisualizacaoCartao.swift
//  Gera
//
//  Created by Ana Carolina Soares de Melo on 02/03/21.
//

import SwiftUI

struct VisualizacaoCartao: View {
    @State private var cor = Color.purple
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .frame(width: UIScreen.main.bounds.width/1.2, height: UIScreen.main.bounds.height/4)
                .foregroundColor(cor)
            HStack {
            Text("Sua mensagem vai aqui")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/7, alignment: .leading)
                .padding()
                .padding(.bottom, 40)
            }
        })
        
//        Text("Sua mensagem vai aqui")
//            .font(.headline)
//            .padding()
//            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
        
    }
}

struct VisualizacaoCartao_Previews: PreviewProvider {
    static var previews: some View {
        VisualizacaoCartao()
    }
}
