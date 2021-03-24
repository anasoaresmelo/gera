//
//  teste.swift
//  Gera
//
//  Created by iris on 23/03/21.
//

import SwiftUI

struct teste: View {
    
    @State private var mensagem = ""
    @State private var cor = Color(.systemPurple)
    @State private var rgbColor = "rgb(175, 82, 222)"
    @State private var showError = false
    @State private var completeAction = false
    
    @State private var isEditing = false
    
    var body: some View {
        VStack{
            Button(action: {}, label: {
                CardPreview(color: $cor, message: $mensagem)
            })
            
            
            
            TextField("Insira sua mensagem aqui", text: $mensagem)
                .padding(.leading)
            
        }
    }
}

struct teste_Previews: PreviewProvider {
    static var previews: some View {
        teste()
    }
}
