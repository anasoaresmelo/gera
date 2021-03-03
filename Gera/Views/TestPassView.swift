//
//  TestPass.swift
//  Gera
//
//  Created by Erick Almeida on 02/03/21.
//

import SwiftUI
import PassKit

struct TestPassView: View {
    
    @State var pass: PKPass?
    @State var showPass: Bool = false;
    @State var statusText = "Nenhuma ação realizada"
    
    var body: some View {
        Button("Gerar e mostrar passe") {
            let passRequestData = PassRequest(
                type: "picpay",
                message: "Mensagem",
                recipientName: "Fulane de Tal",
                recipientPhoneNumber: "(81) 912345678",
                value: "111",
                imageUrl: nil,
                picpayUser: "its_quinho",
                boletoDigitableLine: nil,
                cpf: "11111111111",
                cnpj: nil,
                bankCode: nil,
                bankName: nil,
                agencyNumber: nil,
                accountNumber: nil,
                accountType: nil,
                nubankUrl: nil,
                foregroundColor: nil,
                backgroundColor: "rgb(52, 199, 89)")
            
            func completeCard(pass: PKPass) {
                self.pass = pass;
                statusText = "Sucesso"
                self.showPass = true;
            }
            func handleFailedCard() {
                statusText = "Falha"
            }
            
        BackendConnector.shared.requestPassFromServer(cardData: passRequestData, withCompletionHandler: completeCard, withErrorHandler: handleFailedCard)
        }
        
        Text(statusText)
        
        if (showPass) {
            AddPassView(pass: pass!)
        }
        
    }
}

struct TestPassView_Previews: PreviewProvider {
    static var previews: some View {
        TestPassView()
    }
}
