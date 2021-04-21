//
//  EnumeratedPicker.swift
//  Gera
//
//  Created by Erick Almeida on 22/03/21.
//

import SwiftUI

enum BankAccountType: String {
    case corrente = "corrente"
    case poupanca = "poupanca"
}

struct BankAccountTypePicker: View {
    @Binding var selectedBankAccountType: BankAccountType
    
    var body: some View {
        Picker("Selecione um tipo de documento", selection: $selectedBankAccountType) {
            Text("Corrente").tag(BankAccountType.corrente)
            Text("Poupança").tag(BankAccountType.poupanca)
        }
        .labelsHidden()
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct BankAccountTypePicker_Previews: PreviewProvider {
    static var previews: some View {
        BankAccountTypePicker(selectedBankAccountType: .constant(.corrente))
    }
}
