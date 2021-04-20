//
//  DocumentTypePicker.swift
//  Gera
//
//  Created by Erick Almeida on 22/03/21.
//

import SwiftUI

enum DocumentType {
    case cpf, cnpj
}

struct DocumentTypePicker: View {
    @State var selectedDocumentType: DocumentType = .cpf
    
    var body: some View {
        Picker("Selecione um tipo de documento", selection: $selectedDocumentType) {
            Text("CPF").tag(DocumentType.cpf)
            Text("CNPJ").tag(DocumentType.cnpj)
        }
        .labelsHidden()
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct DocumentTypePicker_Previews: PreviewProvider {
    static var previews: some View {
        DocumentTypePicker()
    }
}
