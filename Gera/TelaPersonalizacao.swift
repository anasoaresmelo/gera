//
//  TelaPersonalizacao.swift
//  Gera
//
//  Created by Ana Carolina Soares de Melo on 02/03/21.
//

import SwiftUI

struct TelaPersonalizacao: View {
    @State private var mensagem = ""
    @State private var cor = Color.blue
    var body: some View {
        VStack {
            Text("Personalize seu cartão")
                .font(.title)
                .padding(.top, 30)
            
            // MARK: Pré-visualização
            VisualizacaoCartao()
            
            // MARK: Mensagem
            Group {
                HStack {
                    Text("Mensagem")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.top)
                    Spacer()
                }
                TextField("Insira sua mensagem aqui", text: $mensagem)
                    .padding(.leading)
                Divider()
                    .padding(.horizontal)
                HStack {
                    Text("Ou selecione uma mensagem padrão")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.top)
                    Spacer()
                }
                HStack {
                    Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Button")/*@END_MENU_TOKEN@*/
                    }
                    .padding(.leading)
                    .padding(.top, 10)
                    Spacer()
                }
                HStack {
                    Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Button")/*@END_MENU_TOKEN@*/
                    }
                    .padding(.leading)
                    .padding(.top, 10)
                    Spacer()
                }
                HStack {
                    Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Button")/*@END_MENU_TOKEN@*/
                    }
                    .padding(.leading)
                    .padding(.top, 10)
                    Spacer()
                }
            }.padding(.horizontal)
            
            // MARK: Cor
            Group {
                HStack {
                    Text("Cores")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.top)
                    Spacer()
                }
                HStack {
                    Button(action: {}) {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .foregroundColor(Color(.systemPurple))
                    }
                    Button(action: {}) {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .foregroundColor(Color(.systemRed))
                    }
                    Button(action: {}) {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .foregroundColor(Color(.systemOrange))
                    }
                    Button(action: {}) {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .foregroundColor(Color(.systemYellow))
                    }
                    Button(action: {}) {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .foregroundColor(Color(.systemGreen))
                    }
                    Button(action: {}) {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .foregroundColor(Color(.systemBlue))
                    }
                    Button(action: {}) {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .foregroundColor(Color(.systemGray))
                    }
                }
                .frame(width: UIScreen.main.bounds.width/1.2, height: 45)
            }.padding(.horizontal)
            
            // MARK: Continuar
            BotaoContinuar()
                .padding(.top)
        }
    }
}

struct TelaPersonalizacao_Previews: PreviewProvider {
    static var previews: some View {
        TelaPersonalizacao()
    }
}
