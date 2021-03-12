//
//  TelaPersonalizacao.swift
//  Gera
//
//  Created by Ana Carolina Soares de Melo on 02/03/21.
//

import SwiftUI

struct CardCustomizationView: View {
    @Binding var showModal: Bool
    @State var mensagem = ""
    @State var cor = Color(.systemPurple)
    @State var rgbColor = "rgb(175, 82, 222)"
    @State var showError = false
    @State var completeAction = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Personalize seu cartão")
                        .font(.system(size: 36, weight: .regular, design: .default))
                        .padding(.top, -20)
                    
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
                                self.rgbColor = "rgb(175, 82, 222)"
                            }) {
                                RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                                    .foregroundColor(Color(.systemPurple))
                            }
                            Button(action: {
                                self.cor = Color(.systemRed)
                                self.rgbColor = "rgb(255, 59, 48)"
                            }) {
                                RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                                    .foregroundColor(Color(.systemRed))
                            }
                            Button(action: {
                                self.cor = Color(.systemOrange)
                                self.rgbColor = "rgb(255, 149, 0)"
                            }) {
                                RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                                    .foregroundColor(Color(.systemOrange))
                            }
                            Button(action: {
                                self.cor = Color(.systemYellow)
                                self.rgbColor = "rgb(255, 204, 0)"
                            }) {
                                RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                                    .foregroundColor(Color(.systemYellow))
                            }
                            Button(action: {
                                self.cor = Color(.systemGreen)
                                self.rgbColor = "rgb(52, 199, 89)"
                            }) {
                                RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                                    .foregroundColor(Color(.systemGreen))
                            }
                            Button(action: {
                                self.cor = Color(.systemBlue)
                                self.rgbColor = "rgb(0, 122, 255)"
                            }) {
                                RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                                    .foregroundColor(Color(.systemBlue))
                            }
                            Button(action: {
                                self.cor = Color(.systemGray)
                                self.rgbColor = "rgb(142, 142, 147)"
                            }) {
                                RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                                    .foregroundColor(Color(.systemGray))
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width/1.2, height: 45)
                    }.padding(.horizontal)
                    
                    // MARK: Continuar
                    NavigationLink(destination: CardPaymentDataView(), isActive: $completeAction, label: { EmptyView() }).disabled(true)
                        .padding(.bottom)
                    
                    Button(action: {
                        guard mensagem != "" else {
                            showError = true
                            return
                        }
                        
                        BackendConnector.shared.message = mensagem
                        BackendConnector.shared.backgroundColor = rgbColor
                        completeAction = true
                    }) {
                        HStack {
                            Text("Continuar")
                                .foregroundColor(Color(.systemBackground))
                        }
                        .padding()
                        .frame(width: UIScreen.main.bounds.width/1.2)
                        .background(Color(.systemPurple))
                        .cornerRadius(7.0)
                    }
                    .padding(.top, 20)
                }
            }
            .padding(.top, -32)
            .alert(isPresented: $showError) {
                Alert(
                    title: Text("Mensagem não preenchida"),
                    message: Text("Adicione uma mensagem ou selecione uma mensagem padrão.")
                )
            }
        }
        .accentColor(Color(.systemPurple))
    }
}

struct CardCustomizationView_Previews: PreviewProvider {
    static var previews: some View {
        CardCustomizationView(showModal: .constant(true))
    }
}
