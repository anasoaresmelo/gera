//
//  TelaPersonalizacao.swift
//  Gera
//
//  Created by Ana Carolina Soares de Melo on 02/03/21.
//

import SwiftUI

struct CardCustomizationView: View {
    @State var mensagem = ""
    @State var cor = Color(.systemPurple)
    var body: some View {
        VStack {
            Text("Personalize seu cartão")
                .font(.system(size: 36, weight: .regular, design: .default))
                .padding(.top, 30)
            
            // MARK: Pré-visualização
            CardPreview(cor: $cor, mensagem: $mensagem)
            
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
                        Button(action: {
                            mensagem = "Tô mandando a conta!"
                        }) {
                            Text("Tô mandando a conta!")
                        }
                        .padding(.leading)
                        .padding(.top, 10)
                        Spacer()
                    }
                    HStack {
                        Button(action: {
                            mensagem = "Você me deve!"
                        }) {
                            Text("Você me deve!")
                        }
                        .padding(.leading)
                        .padding(.top, 10)
                        Spacer()
                    }
                    HStack{
                        Button(action: {
                            mensagem = "Pague meu dinheiro!"
                        }) {
                            Text("Pague meu dinheiro!")
                        }
                        .padding(.leading)
                        .padding(.top, 10)
                        Spacer()
                    }
                }
                .font(.system(size: 17, weight: .medium, design: .default))
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
                    Button(action: {
                        self.cor = Color(.systemPurple)
                    }) {
                        RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                            .foregroundColor(Color(.systemPurple))
                    }
                    Button(action: {
                        self.cor = Color(.systemRed)
                    }) {
                        RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                            .foregroundColor(Color(.systemRed))
                    }
                    Button(action: {
                        self.cor = Color(.systemOrange)
                    }) {
                        RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                            .foregroundColor(Color(.systemOrange))
                    }
                    Button(action: {
                        self.cor = Color(.systemYellow)
                    }) {
                        RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                            .foregroundColor(Color(.systemYellow))
                    }
                    Button(action: {
                        self.cor = Color(.systemGreen)
                    }) {
                        RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                            .foregroundColor(Color(.systemGreen))
                    }
                    Button(action: {
                        self.cor = Color(.systemBlue)
                    }) {
                        RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                            .foregroundColor(Color(.systemBlue))
                    }
                    Button(action: {
                        self.cor = Color(.systemGray)
                    }) {
                        RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                            .foregroundColor(Color(.systemGray))
                    }
                }
                .frame(width: UIScreen.main.bounds.width/1.2, height: 45)
            }.padding(.horizontal)
            
            // MARK: Continuar
            ContinueButton()
                .padding(.top, 20)
        }
    }
}

struct CardCustomizationView_Previews: PreviewProvider {
    static var previews: some View {
        CardCustomizationView()
    }
}
