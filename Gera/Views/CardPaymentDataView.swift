//
//  SwiftUIView.swift
//  Gera
//
//  Created by iris on 03/03/21.
//

import SwiftUI
import PassKit

struct CardPaymentDataView: View {
    
    @Binding var color: LinearGradient
    @Binding var message: String
    
    @State var selected = 1
    @State var documento = 0
    @State var tipoConta = 0
    @State var valor = ""
    @State var codigoBanco = ""
    @State var nomeBanco = ""
    @State var agencia = ""
    @State var conta = ""
    @State var titular = ""
    @State var telefone = ""
    @State var cpfCnpj = ""
    @State var urlNubank = ""
    @State var userPicPay = ""
    @State var linhaDigitavel = ""
    @State var displayErrorAlert = false
    @State var displayLoading = false
    @State var completeAction = false
    @State var errorMessage = ""
    
    var body: some View {
        ZStack {
        ScrollView {
            VStack{
                Group {
                    RegularTitle(regularTitle: .constant("Por fim, adicione os"))
                    Spacer().frame(height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    RegularTitle(regularTitle: .constant("dados de recebimento"))
                    Spacer().frame(height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                
                HStack{
                    Text("Forma de recebimento")
                        .fontWeight(.bold)
                        .padding(.leading)
                    Spacer()
                }.padding(.horizontal)
                
                Picker(selection: $selected, label: Text(""), content: {
                    // Text("Conta").tag(0)
                    Text("Nubank").tag(1)
                    Text("PicPay").tag(2)
                    Text("Boleto").tag(3)
                }).padding(.horizontal).pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                if (selected == 0) {
                    Group{
                        Group{
                            Group {
                                /*
                                FormTextField(content: $valor, label: "Valor", keyboardType: .decimalPad)
                                FormTextField(content: $codigoBanco, label: "Código do Banco", keyboardType: .decimalPad)
                                FormTextField(content: $nomeBanco, label: "Nome do Banco")
                                FormTextField(content: $titular, label: "Titular")
                                FormTextField(content: $agencia, label: "Agência", keyboardType: .decimalPad)
                                FormTextField(content: $conta, label: "Conta") */
                            }
                        }.padding(.horizontal)
                        Group{
                            Group {
                                HStack{
                                    Text("Tipo de Conta")
                                    Picker(selection: $tipoConta, label: Text(""), content: {
                                        Text("Corrente").tag(0)
                                        Text("Poupança").tag(1)
                                    }).pickerStyle(SegmentedPickerStyle())
                                }
                                Divider()
                                HStack{
                                    Text("Documento")
                                    Picker(selection: $documento, label: Text(""), content: {
                                        Text("CPF").tag(0)
                                        Text("CNPJ").tag(1)
                                    }).pickerStyle(SegmentedPickerStyle())
                                }
                                Divider()
                            }
                            Group {
                                Divider()
                                HStack{
                                    if(documento == 0){
                                        Text("CPF")
                                    }
                                    else {
                                        Text("CNPJ")
                                    }
                                    TextField("Obrigatório", text: $cpfCnpj)
                                        .keyboardType(.decimalPad)
                                }
                                Divider()
                                FormTextField(content: $telefone, label: "Telefone de Contato", required: true)
                            }
                        }.padding(.horizontal)
                    }.padding(.horizontal)
                }
                if(selected == 1) {
                    Group{
                        Group{
                            Group {
                                Divider()
                                HStack{
                                    Text("Valor")
                                    TextField("Opcional", text: $valor)
                                        .keyboardType(.decimalPad)
                                }
                                Divider()
                                HStack{
                                    Text("URL do Nubank")
                                    TextField("Obrigatório", text: $urlNubank)
                                        .keyboardType(.URL)
                                }
                                Divider()
                                HStack{
                                    Text("Conta")
                                    TextField("Obrigatório", text: $conta)
                                }
                            }
                            Group {
                                Divider()
                                HStack{
                                    Text("Titular")
                                    TextField("Obrigatório", text: $titular)
                                }
                                Divider()
                                HStack{
                                    Text("Telefone de Contato")
                                    TextField("Obrigatório", text: $telefone)
                                }
                            }
                        }.padding(.horizontal)
                        Group{
                            Divider()
                            HStack{
                                Text("Documento")
                                Picker(selection: $documento, label: Text(""), content: {
                                    Text("CPF").tag(0)
                                    Text("CNPJ").tag(1)
                                }).pickerStyle(SegmentedPickerStyle())
                            }
                            Divider()
                            HStack{
                                if(documento == 0){
                                    Text("CPF")
                                }
                                else {
                                    Text("CNPJ")
                                }
                                TextField("Obrigatório", text: $cpfCnpj)
                                    .keyboardType(.decimalPad)
                            }
                            Divider()
                        }.padding(.horizontal)
                    }.padding(.horizontal)
                }
                if(selected == 2) {
                    Group{
                        Divider()
                        HStack{
                            Text("Valor")
                            TextField("Opcional", text: $valor)
                                .keyboardType(.decimalPad)
                        }
                        Divider()
                        HStack{
                            Text("Usuário")
                            TextField("Obrigatório", text: $userPicPay)
                        }
                        Divider()
                        HStack{
                            Text("Titular")
                            TextField("Obrigatório", text: $titular)
                        }
                        Divider()
                        HStack{
                            Text("Telefone de Contato")
                            TextField("Obrigatório", text: $telefone)
                        }
                        Divider()
                    }.padding(.horizontal)
                    .padding(.horizontal)
                }
                if(selected == 3) {
                    Group{
                        Group{
                            Divider()
                            HStack{
                                Text("Valor")
                                TextField("Obrigatório", text: $valor)
                                    .keyboardType(.decimalPad)
                            }
                            Divider()
                            HStack{
                                Text("Linha digitável")
                                TextField("Obrigatório", text: $linhaDigitavel)
                                    .keyboardType(.decimalPad)
                            }
                            Divider()
                            HStack{
                                Text("Titular")
                                TextField("Obrigatório", text: $titular)
                            }
                            Divider()
                            HStack{
                                Text("Telefone de Contato")
                                TextField("Obrigatório", text: $telefone)
                            }
                        }.padding(.horizontal)
                        Group{
                            Divider()
                            HStack{
                                Text("Documento")
                                Picker(selection: $documento, label: Text(""), content: {
                                    Text("CPF").tag(0)
                                    Text("CNPJ").tag(1)
                                }).pickerStyle(SegmentedPickerStyle())
                            }
                            Divider()
                            HStack{
                                if(documento == 0){
                                    Text("CPF")
                                }
                                else {
                                    Text("CNPJ")
                                }
                                TextField("Obrigatório", text: $cpfCnpj)
                                    .keyboardType(.decimalPad)
                            }
                            Divider()
                        }.padding(.horizontal)
                    }.padding(.horizontal)
                }
                Spacer()
                GeraButton(name: Binding.constant("Gerar Cartão"), action: {
                    showLoading()
                    guard let passRequestData = getPassRequest() else {
                        return
                    }
                    
                BackendConnector.shared.requestPassFromServer(cardData: passRequestData, withCompletionHandler: completeCard, withErrorHandler: handleFailedCard)
                })
                    .padding(.bottom)
                NavigationLink(destination: ShareScreenView(color: $color, message: $message), isActive: $completeAction, label: { EmptyView() }).disabled(true)
                    .padding(.bottom)
            }
            .padding(.top, -32)
            .padding(.vertical)
        }
        .alert(isPresented: $displayErrorAlert) {
            Alert(
                title: Text(errorMessage)
            )
        }
        
            if (displayLoading) {
                GeometryReader { geometry in
                    ZStack {
                        LoadingMessage()
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                }.background(Color.black.opacity(0.45))
            }
        
        }
        
    }
    
    func showLoading() {
        displayLoading = true
    }
    
    func hideLoading() {
        displayLoading = false
    }
    
    func completeCard(pass: PKPass) {
        hideLoading()
        
        if var topController = UIApplication.shared.windows.first?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            if let addPassesController = PKAddPassesViewController(pass: pass) {
                topController.present(addPassesController, animated: true, completion: nil)
            }
            completeAction = true
        }
        
    }
    
    func handleFailedCard() {
        showErrorAlert(title: "Algo deu errado na criação do cartão. Verifique se você está conectado à internet e tem o Apple Wallet instalado.")
    }
    
    func showErrorAlert(title: String) {
        hideLoading()
        errorMessage = title
        displayErrorAlert = true
    }
    
    func getPassRequest() -> PassRequest? {
        var passRequest: PassRequest

        switch selected {
        case 0: // Febraban
            
            guard (codigoBanco != "") else {
                 showErrorAlert(title: "Código do banco não preenchido")
                 return nil
            }
            
            guard (nomeBanco != "") else {
                 showErrorAlert(title: "Nome do banco não preenchido")
                 return nil
            }
            
            guard (agencia != "") else {
                 showErrorAlert(title: "Número da agência não preenchido")
                 return nil
            }
            
            guard (conta != "") else {
                 showErrorAlert(title: "Número da conta não preenchido")
                 return nil
            }
            
            guard (titular != "") else {
                 showErrorAlert(title: "Nome do titular não preenchido")
                 return nil
            }
            
            guard (cpfCnpj != "") else {
                if (documento == 0) {
                    showErrorAlert(title: "CPF não preenchido")
                } else {
                    showErrorAlert(title: "CNPJ não preenchido")
                }
                return nil
            }
            
            guard (telefone != "") else {
                showErrorAlert(title: "Telefone de contato não preenchido")
                return nil
            }
            
            var cpf: String? = nil
            var cnpj: String? = nil
            if (documento == 0) {
                cpf = cpfCnpj
            } else {
                cnpj = cpfCnpj
            }
            var accountType = "Conta Corrente"
            if (tipoConta == 1) {
                accountType = "Conta Poupança"
            }
            
            passRequest = PassRequest(
                type: "febraban",
                message: BackendConnector.shared.message,
                recipientName: titular,
                recipientPhoneNumber: telefone,
                value: valor,
                imageUrl: BackendConnector.shared.imageUrl,
                picpayUser: nil,
                boletoDigitableLine: nil,
                cpf: cpf,
                cnpj: cnpj,
                bankCode: codigoBanco,
                bankName: nomeBanco,
                agencyNumber: agencia,
                accountNumber: conta,
                accountType: accountType,
                nubankUrl: nil,
                foregroundColor: BackendConnector.shared.foregroundColor,
                backgroundColor: BackendConnector.shared.backgroundColor)
            
            break;
        case 1: // Nubank
            
            guard (urlNubank != "") else {
                 showErrorAlert(title: "URL de envio do Nubank não preenchido")
                 return nil
            }
            
            guard (conta != "") else {
                 showErrorAlert(title: "Número da conta não preenchido")
                 return nil
            }
            
            guard (titular != "") else {
                 showErrorAlert(title: "Nome do titular não preenchido")
                 return nil
            }
            
            guard (cpfCnpj != "") else {
                if (documento == 0) {
                    showErrorAlert(title: "CPF não preenchido")
                } else {
                    showErrorAlert(title: "CNPJ não preenchido")
                }
                return nil
            }
            
            guard (telefone != "") else {
                showErrorAlert(title: "Telefone de contato não preenchido")
                return nil
            }
            
            var cpf: String? = nil
            var cnpj: String? = nil
            if (documento == 0) {
                cpf = cpfCnpj
            } else {
                cnpj = cpfCnpj
            }
            
            passRequest = PassRequest(
                type: "nubank",
                message: BackendConnector.shared.message,
                recipientName: titular,
                recipientPhoneNumber: telefone,
                value: valor,
                imageUrl: BackendConnector.shared.imageUrl,
                picpayUser: nil,
                boletoDigitableLine: nil,
                cpf: cpf,
                cnpj: cnpj,
                bankCode: "260",
                bankName: "Nu Pagamentos S.A.",
                agencyNumber: "0001",
                accountNumber: conta,
                accountType: "Conta de Pagamento",
                nubankUrl: urlNubank,
                foregroundColor: BackendConnector.shared.foregroundColor,
                backgroundColor: BackendConnector.shared.backgroundColor)
            
            break;
        case 2: // PicPay
            guard (userPicPay != "") else {
                 showErrorAlert(title: "Usuário do PicPay não preenchido")
                 return nil
             }

            guard (titular != "") else {
                showErrorAlert(title: "Nome do titular não preenchido")
                return nil
            }
            
            guard (telefone != "") else {
                showErrorAlert(title: "Telefone de contato não preenchido")
                return nil
            }

            passRequest = PassRequest(
                type: "picpay",
                message: BackendConnector.shared.message,
                recipientName: titular,
                recipientPhoneNumber: telefone,
                value: valor,
                imageUrl: BackendConnector.shared.imageUrl,
                picpayUser: userPicPay,
                boletoDigitableLine: nil,
                cpf: nil,
                cnpj: nil,
                bankCode: nil,
                bankName: nil,
                agencyNumber: nil,
                accountNumber: nil,
                accountType: nil,
                nubankUrl: nil,
                foregroundColor: BackendConnector.shared.foregroundColor,
                backgroundColor: BackendConnector.shared.backgroundColor)
            break;
        case 3: // Boleto

            guard (valor != "") else {
                 showErrorAlert(title: "Valor do boleto não preenchido")
                 return nil
            }
            
            guard (linhaDigitavel != "") else {
                 showErrorAlert(title: "Linha digitável não preenchida")
                 return nil
            }
            
            guard (titular != "") else {
                 showErrorAlert(title: "Nome do titular não preenchido")
                 return nil
            }
            
            guard (cpfCnpj != "") else {
                if (documento == 0) {
                    showErrorAlert(title: "CPF não preenchido")
                } else {
                    showErrorAlert(title: "CNPJ não preenchido")
                }
                return nil
            }
            
            guard (telefone != "") else {
                showErrorAlert(title: "Telefone de contato não preenchido")
                return nil
            }
            
            var cpf: String? = nil
            var cnpj: String? = nil
            if (documento == 0) {
                cpf = cpfCnpj
            } else {
                cnpj = cpfCnpj
            }
            
            passRequest = PassRequest(
                type: "boleto",
                message: BackendConnector.shared.message,
                recipientName: titular,
                recipientPhoneNumber: telefone,
                value: valor,
                imageUrl: BackendConnector.shared.imageUrl,
                picpayUser: nil,
                boletoDigitableLine: linhaDigitavel,
                cpf: cpf,
                cnpj: cnpj,
                bankCode: nil,
                bankName: nil,
                agencyNumber: nil,
                accountNumber: nil,
                accountType: nil,
                nubankUrl: nil,
                foregroundColor: BackendConnector.shared.foregroundColor,
                backgroundColor: BackendConnector.shared.backgroundColor)
            
            break;
        default:
            return nil
        }
        return passRequest
    }
}

struct CardPaymentDataView_Previews: PreviewProvider {
    static var previews: some View {
        CardPaymentDataView(color: Binding.constant(LinearGradient(gradient: Gradient(colors: [Color(red: 125 / 255, green: 80 / 255, blue: 189 / 255), Color(red: 163 / 255, green: 91 / 255, blue: 215 / 255)]), startPoint: .top, endPoint: .bottom)), message: Binding.constant("funciona?"))
    }
}

