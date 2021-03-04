//
//  SwiftUIView.swift
//  Gera
//
//  Created by iris on 03/03/21.
//

import SwiftUI

struct CardPaymentDataView: View {
    
    @State var selected = 0
    @State var documento = 0
    @State var tipoConta = 0
    @State var valor = ""
    @State var codigoBanco = ""
    @State var nomeBanco = ""
    @State var agencia = ""
    @State var conta = ""
    @State var titular = ""
    @State var cpfCnpj = ""
    @State var urlNubank = ""
    @State var userPicPay = ""
    @State var linhaDigitavel = ""
    
    var body: some View {
        VStack{
            Text("Por fim, adicione os\ndados de recebimento")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.bottom)
            
            HStack{
                Text("Forma de recebimento")
                    .fontWeight(.bold)
                    .padding(.leading)
                Spacer()
            }.padding(.horizontal)
            
            Picker(selection: $selected, label: Text(""), content: {
                Text("Conta").tag(0)
                Text("Nubank").tag(1)
                Text("PicPay").tag(2)
                Text("Boleto").tag(3)
            }).padding(.horizontal).pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            
            if(selected == 0) {
                Group{
                    Group{
                        Divider()
                        HStack{
                            Text("Valor")
                            TextField("Opcional", text: $valor)
                                .keyboardType(.decimalPad)
                        }
                        Divider()
                        HStack{
                            Text("Código do Banco")
                            TextField("Obrigatório", text: $codigoBanco)
                                .keyboardType(.decimalPad)
                        }
                        Divider()
                        HStack{
                            Text("Nome do Banco")
                            TextField("Obrigatório", text: $nomeBanco)
                        }
                        Divider()
                        HStack{
                            Text("Agência")
                            TextField("Obrigatório", text: $agencia)
                                .keyboardType(.decimalPad)
                        }
                        Divider()
                        HStack{
                            Text("Conta")
                            TextField("Obrigatório", text: $conta)
                        }
                    }.padding(.horizontal)
                    Group{
                        Divider()
                        HStack{
                            Text("Titular")
                            TextField("Obrigatório", text: $titular)
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
                        HStack{
                            Text("Tipo de Conta")
                            Picker(selection: $tipoConta, label: Text(""), content: {
                                Text("Corrente").tag(0)
                                Text("Poupança").tag(1)
                            }).pickerStyle(SegmentedPickerStyle())
                        }
                        Divider()
                        
                    }.padding(.horizontal)
                }.padding(.horizontal)
            }
            else if(selected == 1) {
                Group{
                    Group{
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
                        Divider()
                        HStack{
                            Text("Titular")
                            TextField("Obrigatório", text: $titular)
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
            else if(selected == 2) {
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
                }.padding(.horizontal)
                .padding(.horizontal)
            }
            else if(selected == 3) {
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
            NavigationLink(destination: ShareScreenView()) {
                HStack {
                    Text("Gerar Cartão")
                        .foregroundColor(Color(.systemBackground))
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width/1.2)
                .background(Color(.systemPurple))
                .cornerRadius(7.0)
            }
                .padding(.bottom)
        }
        .padding(.vertical)
    }
}

struct CardPaymentDataView_Previews: PreviewProvider {
    static var previews: some View {
        CardPaymentDataView()
    }
}
