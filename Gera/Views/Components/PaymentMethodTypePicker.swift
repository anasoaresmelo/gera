//
//  PaymentMethodPicker.swift
//  Gera
//
//  Created by Erick Almeida on 21/04/21.
//

import SwiftUI

enum PaymentMethodType {
    case pix
    case nubank
    case picpay
    case boleto
}

struct PaymentMethodTypePicker: View {
    @Binding var selectedPaymentMethodType: PaymentMethodType
    
    var body: some View {
        Picker("Selecione um método de pagamento", selection: $selectedPaymentMethodType) {
            Text("Pix").tag(PaymentMethodType.pix)
            Text("Nubank").tag(PaymentMethodType.nubank)
            Text("PicPay").tag(PaymentMethodType.picpay)
            Text("Boleto").tag(PaymentMethodType.boleto)
        }
        .labelsHidden()
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct PaymentMethodPicker_Previews: PreviewProvider {
    static var previews: some View {
        PaymentMethodTypePicker(selectedPaymentMethodType: .constant(.pix))
    }
}

