//
//  TelaPersonalizacao.swift
//  Gera
//
//  Created by Ana Carolina Soares de Melo on 02/03/21.
//

import SwiftUI
import Introspect
import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct CardCustomizationView: View {
    
    @Binding var showModal: Bool
    @State private var mensagem = ""
    @State private var cor = Color(.systemPurple)
    @State private var rgbColor = "rgb(175, 82, 222)"
    @State private var showError = false
    @State private var completeAction = false
    
    @State private var isEditing = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    
                    RegularTitle(regularTitle: .constant("Personalize seu cartão"))
                    CardPreview(color: $cor, message: $mensagem)

                    Group {
//                        HStack {
//                            BodyBold(title: .constant("Mensagem"))
//                                .padding(.horizontal)
//                                .padding(.top)
//                            Spacer()
//                        }
//                        TextField("Insira sua mensagem aqui", text: $mensagem)
//                            .introspectTextField { textField in
//                                textField.becomeFirstResponder()
//                            }
//                            .padding(.leading)
//
//
//                        Divider()
//                            .padding(.horizontal)
                        HStack {
                            Text("Ou selecione uma mensagem padrão")
                                .font(.headline)
                                .fontWeight(.bold)
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
                        
                        HStack {
                            BodyBold(title: .constant("Mensagem"))
                                .padding(.horizontal)
                                .padding(.top)
                            Spacer()
                        }
                        TextField("Insira sua mensagem aqui", text: $mensagem)
                            .introspectTextField { textField in
                                textField.becomeFirstResponder()
                            }
                            .padding(.leading)
                            
                            
                        Divider()
                            .padding(.horizontal)
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
            }.onTapGesture {
                self.endEditing()}
        }
        .accentColor(Color(.systemPurple))
    }
    private func endEditing() {
            UIApplication.shared.endEditing()
        }
}


struct CardCustomizationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardCustomizationView(showModal: .constant(true))
            CardCustomizationView(showModal: .constant(true))
                .previewDevice("iPhone 8")
            CardCustomizationView(showModal: .constant(true))
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
