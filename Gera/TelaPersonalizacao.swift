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
                .font(.system(size: 36, weight: .regular, design: .default))
                .padding(.top, 30)
            
            // MARK: Pré-visualização
            VisualizacaoCartao()
            
            // MARK: Mensagem
            Group {
                HStack {
                    Text("Mensagem")
                        .font(.system(size: 18, weight: .bold, design: .default))
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
                        .font(.system(size: 19, weight: .bold, design: .default))
                        .padding(.horizontal)
                        .padding(.top)
                    Spacer()
                }
                VStack {
                    HStack {
                        Button(action: {}) {
                            Text("Tô mandando a conta!")
                        }
                        .padding(.leading)
                        .padding(.top, 10)
                        Spacer()
                    }
                    HStack {
                        Button(action: {}) {
                            Text("Você me deve!")
                        }
                        .padding(.leading)
                        .padding(.top, 10)
                        Spacer()
                    }
                    HStack{
                        Button(action: {}) {
                            Text("Pague meu dinheiro!")
                        }
                        .padding(.leading)
                        .padding(.top, 10)
                        Spacer()
                    }
                }
                .font(.system(size: 17, weight: .regular, design: .default))
                .foregroundColor(Color(.systemPurple))
            }.padding(.horizontal)
            
            // MARK: Cor
            Group {
                HStack {
                    Text("Cores")
                        .font(.system(size: 18, weight: .bold, design: .default))
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
                .padding(.top, 20)
        }
    }
}

struct TelaPersonalizacao_Previews: PreviewProvider {
    static var previews: some View {
        TelaPersonalizacao()
    }
}
