//
//  PixKeyTypePicker.swift
//  Gera
//
//  Created by Erick Almeida on 21/04/21.
//

import SwiftUI

enum PixKeyType {
    case identificationDocument
    case phoneNumber
    case emailAddress
    case randomKey
}

struct PixKeyTypePicker: View {
    @Binding var selectedPixKeyType: PixKeyType
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Tipo de chave Pix")
                .multilineTextAlignment(.leading)
                .padding(.vertical, 4)
            Picker("Selecione um tipo de chave Pix", selection: $selectedPixKeyType) {
                Text("CPF/CNPJ").tag(PixKeyType.identificationDocument)
                Text("Telefone").tag(PixKeyType.phoneNumber)
                Text("E-mail").tag(PixKeyType.emailAddress)
                Text("Aleatória").tag(PixKeyType.randomKey)
            }
            .labelsHidden()
            .pickerStyle(SegmentedPickerStyle())
            .padding(.bottom, 4)

            Divider()
        }
    }
}

struct PixKeyTypePicker_Previews: PreviewProvider {
    static var previews: some View {
        PixKeyTypePicker(selectedPixKeyType: .constant(.identificationDocument))
    }
}
