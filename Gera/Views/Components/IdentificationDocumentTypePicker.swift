//
//  DocumentTypePicker.swift
//  Gera
//
//  Created by Erick Almeida on 22/03/21.
//

import SwiftUI

enum IdentificationDocumentType {
    case cpf, cnpj
}

struct IdentificationDocumentTypePicker: View {
    @Binding var selectedIdentificationDocumentType: IdentificationDocumentType
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Documento")
                    .padding(.trailing, 4)
                Picker("Selecione um tipo de documento", selection: $selectedIdentificationDocumentType) {
                    Text("CPF").tag(IdentificationDocumentType.cpf)
                    Text("CNPJ").tag(IdentificationDocumentType.cnpj)
                }
                .labelsHidden()
                .pickerStyle(SegmentedPickerStyle())
            }.padding(.top, 2)

            Divider()
        }

    }
}

struct IdentificationDocumentTypePicker_Previews: PreviewProvider {
    static var previews: some View {
        IdentificationDocumentTypePicker(selectedIdentificationDocumentType: .constant(.cpf))
    }
}
