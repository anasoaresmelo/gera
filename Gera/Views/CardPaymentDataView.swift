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
    
    @State var selectedPaymentMethodType: PaymentMethodType = .pix
    @State var selectedDocument: IdentificationDocumentType = .cpf
    @State var selectedBankAccountType: BankAccountType = .poupanca
    @State var selectedPixKeyType: PixKeyType = .identificationDocument
    @State var amount = ""
    @State var numericAmount: NSNumber? = nil
    @State var bankCode = ""
    @State var bankName = ""
    @State var bankAgency = ""
    @State var accountNumber = ""
    @State var receiverFullName = ""
    @State var receiverPhoneNumber = ""
    @State var identificationDocument = ""
    @State var nubankUrl = ""
    @State var picpayUserName = ""
    @State var boletoDigitableLine = ""
    @State var emailAddress = ""
    @State var randomPixKey = ""
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
                    Spacer().frame(height: 20, alignment: .center)
                    RegularTitle(regularTitle: .constant("dados de recebimento"))
                    Spacer().frame(height: 25, alignment: .center)
                    
                    HStack {
                        Text("Forma de recebimento")
                            .fontWeight(.bold)
                            .padding(.leading)
                        Spacer()
                    }.padding(.horizontal)
                    
                    PaymentMethodTypePicker(selectedPaymentMethodType: $selectedPaymentMethodType).padding(.horizontal, 32).padding(.bottom)
                }
                
                Group {
                    Group {
                        FormTextField(content: $receiverFullName, label: "Titular", required: true, type: .text)
                        FormTextField(content: $receiverPhoneNumber, label: "Telefone de contato", required: true, type: .phoneNumber)
                    }
                
                    if (selectedPaymentMethodType == .pix) {
                        Group {
                            
                            FormTextField(content: $amount, numericValue: $numericAmount, label: "Valor", required: true, type: .real)
                            PixKeyTypePicker(selectedPixKeyType: $selectedPixKeyType)
                            
                            if (selectedPixKeyType == .identificationDocument) {
                                IdentificationDocumentTypePicker(selectedIdentificationDocumentType: $selectedDocument)
                                if (selectedDocument == .cpf) {
                                    FormTextField(content: $identificationDocument, label: "CPF", required: true, type: .cpf)
                                }
                                if (selectedDocument == .cnpj) {
                                    FormTextField(content: $identificationDocument, label: "CNPJ", required: true, type: .cnpj)

                                }
                            }
                            if (selectedPixKeyType == .phoneNumber) {
                                Text("O telefone de contato acima será usado como chave Pix.").multilineTextAlignment(.leading)
                            }
                            if (selectedPixKeyType == .emailAddress) {
                                FormTextField(content: $emailAddress, label: "E-mail", required: true, type: .email)

                            }
                            if (selectedPixKeyType == .randomKey) {
                                FormTextField(content: $randomPixKey, label: "Chave aleatória", required: true, type: .uuidv4)

                            }
                        }
                    }
                    if (selectedPaymentMethodType == .picpay) {
                        Group {
                            FormTextField(content: $picpayUserName, label: "Nome de usuário", required: false, type: .userName)

                            FormTextField(content: $amount, numericValue: $numericAmount, label: "Valor", required: false, type: .real)
                        }
                    }
                    if (selectedPaymentMethodType == .nubank) {
                        Group {
                            FormTextField(content: $amount, numericValue: $numericAmount, label: "Valor", required: false, type: .real)
                            IdentificationDocumentTypePicker(selectedIdentificationDocumentType: $selectedDocument)
                            if (selectedDocument == .cpf) {
                                FormTextField(content: $identificationDocument, label: "CPF", required: true, type: .cpf)
                            }
                            if (selectedDocument == .cnpj) {
                                FormTextField(content: $identificationDocument, label: "CNPJ", required: true, type: .cnpj)
                            }
                            FormTextField(content: $accountNumber, label: "Conta", required: true, type: .number)
                
                            FormTextField(content: $nubankUrl, label: "URL do Nubank", required: true, type: .url)
                        }
                    }
                    if (selectedPaymentMethodType == .boleto) {
                        FormTextField(content: $amount, numericValue: $numericAmount, label: "Valor", required: true, type: .real)
                        FormTextField(content: $boletoDigitableLine, label: "Linha digitável", required: true, type: .number)
                        IdentificationDocumentTypePicker(selectedIdentificationDocumentType: $selectedDocument)
                        if (selectedDocument == .cpf) {
                            FormTextField(content: $identificationDocument, label: "CPF", required: true, type: .cpf)
                        }
                        if (selectedDocument == .cnpj) {
                            FormTextField(content: $identificationDocument, label: "CNPJ", required: true, type: .cnpj)
                        }
                    }
                }.padding(.horizontal, 32)
                Spacer(minLength: 32)
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

        guard (isStringNotEmpty(string: receiverFullName)) else {
             showErrorAlert(title: "Nome do titular não preenchido")
             return nil
        }
        
        guard (isStringNotEmpty(string: receiverPhoneNumber)) else {
            showErrorAlert(title: "Telefone de contato não preenchido")
            return nil
        }
        
        guard (isStringValidBrazilianPhoneNumber(string: receiverPhoneNumber)) else {
            showErrorAlert(title: "Telefone de contato inválido")
            return nil
        }
        
        switch selectedPaymentMethodType {
        case .pix:
                        
            if (selectedPixKeyType == .emailAddress) {
                guard (isStringNotEmpty(string: emailAddress)) else {
                    showErrorAlert(title: "E-mail não preenchido")
                    return nil
                }
                
                guard (isStringValidEmail(string: emailAddress)) else {
                    showErrorAlert(title: "E-mail inválido")
                    return nil
                }
            }
            
            var cpf: String? = nil
            var cnpj: String? = nil
            
            if (selectedPixKeyType == .identificationDocument) {
                guard (isStringNotEmpty(string: identificationDocument)) else {
                    if (selectedDocument == .cpf) {
                        showErrorAlert(title: "CPF não preenchido")
                    } else {
                        showErrorAlert(title: "CNPJ não preenchido")
                    }
                    return nil
                }
                
                if (selectedDocument == .cpf) {
                    guard (isStringValidCPF(string: identificationDocument)) else {
                        showErrorAlert(title: "CPF inválido")
                        return nil
                    }
                    cpf = identificationDocument
                } else {
                    guard (isStringValidCNPJ(string: identificationDocument)) else {
                        showErrorAlert(title: "CNPJ inválido")
                        return nil
                    }
                    cnpj = identificationDocument
                }
            }
            
            if (selectedPixKeyType == .randomKey) {
                guard (isStringNotEmpty(string: randomPixKey)) else {
                    showErrorAlert(title: "Chave aleatória não preenchida")
                    return nil
                }
                
                guard (isStringValidUuid(string: randomPixKey)) else {
                    showErrorAlert(title: "Chave aleatória inválida")
                    return nil
                }
            }

            guard (numericAmount != nil && numericAmount!.doubleValue > 0.0) else {
                showErrorAlert(title: "Valor não preenchido")
                return nil
            }
            
            passRequest = PassRequest(
                type: "pix",
                message: BackendConnector.shared.message,
                recipientName: receiverFullName,
                recipientPhoneNumber: receiverPhoneNumber,
                value: numericAmount?.doubleValue,
                imageUrl: BackendConnector.shared.imageUrl,
                picpayUser: nil,
                boletoDigitableLine: nil,
                cpf: cpf,
                cnpj: cnpj,
                bankCode: bankCode,
                bankName: bankName,
                agencyNumber: bankAgency,
                accountNumber: accountNumber,
                accountType: "Pix",
                nubankUrl: nil,
                emailAddress: selectedPixKeyType == .emailAddress ? emailAddress : nil,
                pixRandomKey: selectedPixKeyType == .randomKey ? emailAddress : nil,
                foregroundColor: BackendConnector.shared.foregroundColor,
                backgroundColor: BackendConnector.shared.backgroundColor)
            
            break;
        case .nubank:
            
            guard (isStringNotEmpty(string: nubankUrl)) else {
                 showErrorAlert(title: "URL de envio do Nubank não preenchido")
                 return nil
            }
            
            guard (isStringValidUrl(string: nubankUrl)) else {
                 showErrorAlert(title: "URL de envio do Nubank inválido")
                 return nil
            }
            
            guard (isStringNotEmpty(string: accountNumber)) else {
                 showErrorAlert(title: "Número da conta não preenchido")
                 return nil
            }
            
            var cpf: String? = nil
            var cnpj: String? = nil
            
            guard (isStringNotEmpty(string: identificationDocument)) else {
                if (selectedDocument == .cpf) {
                    showErrorAlert(title: "CPF não preenchido")
                } else {
                    showErrorAlert(title: "CNPJ não preenchido")
                }
                return nil
            }
            
            if (selectedDocument == .cpf) {
                guard (isStringValidCPF(string: identificationDocument)) else {
                    showErrorAlert(title: "CPF inválido")
                    return nil
                }
                cpf = identificationDocument
            } else {
                guard (isStringValidCNPJ(string: identificationDocument)) else {
                    showErrorAlert(title: "CNPJ inválido")
                    return nil
                }
                cnpj = identificationDocument
            }
            
            guard (numericAmount == nil || numericAmount!.doubleValue > 0.0) else {
                showErrorAlert(title: "Valor inválido")
                return nil
            }
            
            passRequest = PassRequest(
                type: "nubank",
                message: BackendConnector.shared.message,
                recipientName: receiverFullName,
                recipientPhoneNumber: receiverPhoneNumber,
                value: numericAmount?.doubleValue,
                imageUrl: BackendConnector.shared.imageUrl,
                picpayUser: nil,
                boletoDigitableLine: nil,
                cpf: cpf,
                cnpj: cnpj,
                bankCode: "260",
                bankName: "Nu Pagamentos S.A.",
                agencyNumber: "0001",
                accountNumber: accountNumber,
                accountType: "Conta de Pagamento",
                nubankUrl: nubankUrl,
                emailAddress: nil,
                pixRandomKey: nil,
                foregroundColor: BackendConnector.shared.foregroundColor,
                backgroundColor: BackendConnector.shared.backgroundColor)
            
            break;
        case .picpay:
            
            guard (isStringNotEmpty(string: picpayUserName)) else {
                 showErrorAlert(title: "Usuário do PicPay não preenchido")
                 return nil
             }
            
            guard (isStringValidUserName(string: picpayUserName)) else {
                 showErrorAlert(title: "Usuário do PicPay inválido")
                 return nil
             }
            
            guard (numericAmount == nil || numericAmount!.doubleValue > 0.0) else {
                showErrorAlert(title: "Valor inválido")
                return nil
            }
            
            passRequest = PassRequest(
                type: "picpay",
                message: BackendConnector.shared.message,
                recipientName: receiverFullName,
                recipientPhoneNumber: receiverPhoneNumber,
                value: numericAmount?.doubleValue,
                imageUrl: BackendConnector.shared.imageUrl,
                picpayUser: picpayUserName,
                boletoDigitableLine: nil,
                cpf: nil,
                cnpj: nil,
                bankCode: nil,
                bankName: nil,
                agencyNumber: nil,
                accountNumber: nil,
                accountType: nil,
                nubankUrl: nil,
                emailAddress: nil,
                pixRandomKey: nil,
                foregroundColor: BackendConnector.shared.foregroundColor,
                backgroundColor: BackendConnector.shared.backgroundColor)
            break;
        case .boleto:

            guard ((numericAmount != nil && numericAmount!.doubleValue > 0.0)) else {
                showErrorAlert(title: "Valor não preenchido")
                return nil
            }
            
            guard (isStringNotEmpty(string: boletoDigitableLine)) else {
                 showErrorAlert(title: "Linha digitável não preenchida")
                 return nil
            }
            
            var cpf: String? = nil
            var cnpj: String? = nil
            
            guard (isStringNotEmpty(string: identificationDocument)) else {
                if (selectedDocument == .cpf) {
                    showErrorAlert(title: "CPF não preenchido")
                } else {
                    showErrorAlert(title: "CNPJ não preenchido")
                }
                return nil
            }
            
            if (selectedDocument == .cpf) {
                guard (isStringValidCPF(string: identificationDocument)) else {
                    showErrorAlert(title: "CPF inválido")
                    return nil
                }
                cpf = identificationDocument
            } else {
                guard (isStringValidCNPJ(string: identificationDocument)) else {
                    showErrorAlert(title: "CNPJ inválido")
                    return nil
                }
                cnpj = identificationDocument
            }
            
            passRequest = PassRequest(
                type: "boleto",
                message: BackendConnector.shared.message,
                recipientName: receiverFullName,
                recipientPhoneNumber: receiverPhoneNumber,
                value: numericAmount?.doubleValue,
                imageUrl: BackendConnector.shared.imageUrl,
                picpayUser: nil,
                boletoDigitableLine: boletoDigitableLine,
                cpf: cpf,
                cnpj: cnpj,
                bankCode: nil,
                bankName: nil,
                agencyNumber: nil,
                accountNumber: nil,
                accountType: nil,
                nubankUrl: nil,
                emailAddress: nil,
                pixRandomKey: nil,
                foregroundColor: BackendConnector.shared.foregroundColor,
                backgroundColor: BackendConnector.shared.backgroundColor)
            
            break;
        }
        return passRequest
    }
}

struct CardPaymentDataView_Previews: PreviewProvider {
    static var previews: some View {
        CardPaymentDataView(color: Binding.constant(LinearGradient(gradient: Gradient(colors: [Color(red: 125 / 255, green: 80 / 255, blue: 189 / 255), Color(red: 163 / 255, green: 91 / 255, blue: 215 / 255)]), startPoint: .top, endPoint: .bottom)), message: Binding.constant("funciona?"))
    }
}

