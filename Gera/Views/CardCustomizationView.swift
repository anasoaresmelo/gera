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
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    RegularTitle(regularTitle: .constant("Personalize seu cartão"))
                    CardPreview(color: $cor, message: $mensagem)
                    CardScreenTitle(title: .constant("Selecione uma mensagem padrão"))
                    DefaultMessages(message: $mensagem)
                        .padding(.horizontal)
                    CardScreenTitle(title: .constant("Ou digite sua mensagem"))
                    
                    TextField("Insira sua mensagem aqui", text: $mensagem)
                        .introspectTextField { textField in
                            textField.becomeFirstResponder()
                        }.padding(.horizontal)
                        .padding(.leading)
                    Divider()
                        .padding(.horizontal)
                        .padding(.horizontal)
                    
                    // MARK: Cor
                    Group {
                        CardScreenTitle(title: .constant("Cores"))
                        ColorsButton(color: $cor, rgbColor: $rgbColor)
                            .padding(.horizontal)
                            .padding(.horizontal)
                    }
                    
                    // MARK: Continuar
                    NavigationLink(destination: CardPaymentDataView(), isActive: $completeAction, label: { EmptyView() }).disabled(true)
                    
                    GeraButton(name: Binding.constant("Continuar"), action: {
                                guard mensagem != "" else {
                                    showError = true
                                    return
                                }
                                BackendConnector.shared.message = mensagem
                                BackendConnector.shared.backgroundColor = rgbColor
                                completeAction = true})
                        .padding(.vertical, 40)
                }
            }
            .alert(isPresented: $showError) {
                Alert(
                    title: Text("Mensagem não preenchida"),
                    message: Text("Adicione uma mensagem ou selecione uma mensagem padrão.")
                )}
            .onTapGesture {self.endEditing()}
        }.accentColor(Color(.systemPurple))
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
