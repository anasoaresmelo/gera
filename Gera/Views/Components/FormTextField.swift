//
//  FormField.swift
//  Gera
//
//  Created by Erick Almeida on 16/03/21.
//

import SwiftUI
import AnyFormatKitSwiftUI
import CPF_CNPJ_Validator

struct FormTextField: View {
    @Binding var content: String
    @Binding var numericValue: NSNumber?
    var label: String
    var required: Bool
    var settings: FormTextFieldSettings
    
    init(content: Binding<String>, numericValue: Binding<NSNumber?> = Binding.constant(nil), label: String, required: Bool = false, type: FormTextFieldType = .text, settings: FormTextFieldSettings? = nil) {
        self._content = content
        self._numericValue = numericValue
        self.label = label
        self.required = required
        self.settings = settings ?? predefinedSettingsForType[type]!
    }
    
    var body: some View {
        HStack {
            Text(label)
                .padding(.trailing, 8)
                .padding(.vertical, 4)
            if (settings.formFieldView == .textField) {
                TextField(required ? "Obrigatório" : "Opcional", text: $content)
                    .keyboardType(settings.keyboardType)
            }
            if (settings.formFieldView == .formatTextField) {
                FormatTextField(
                    unformattedText: $content,
                    placeholder: required ? "Obrigatório" : "Opcional",
                    textPattern: settings.textPattern!
                ).keyboardType(settings.keyboardType)
            }
            if (settings.formFieldView == .formatSumTextField) {
                FormatSumTextField(
                    numberValue: $numericValue,
                    placeholder: required ? "Obrigatório" : "Opcional",
                    textPattern: settings.textPattern!
                ).keyboardType(settings.keyboardType)
            }
        }
        
        Divider()
    }
}

enum FormTextFieldType {
    case text
    case number
    case phoneNumber
    case cpf
    case cnpj
    case bankAccount
    case bankAgency
    case real
    case userName
    case email
    case url
    case uuidv4
}

enum FormTextFieldView {
    case textField
    case formatTextField
    case formatSumTextField
}

struct FormTextFieldSettings {
    var keyboardType: UIKeyboardType
    var formFieldView: FormTextFieldView
    var textPattern: String?
    var completeCondition: (String) -> (Bool)
}

func isStringContainingOnlyNumbers(string: String) -> Bool {
    return string.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
}

func isStringLengthOf(string: String, length: Int) -> Bool {
    return string.count == length
}

func isStringNotEmpty(string: String) -> Bool {
    return string.count > 0
}

func isStringValidCPF(string: String) -> Bool {
    return BooleanValidator().validate(cpf: string)
}

func isStringValidCNPJ(string: String) -> Bool {
    return BooleanValidator().validate(cnpj: string)
}

func isStringValidEmail(string: String) -> Bool {
    let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
    return isStringNotEmpty(string: string) && regex.firstMatch(in: string, options: [], range: NSRange(location: 0, length: string.count)) != nil
}

func isStringValidUrl(string: String) -> Bool {
    let regex = try! NSRegularExpression(pattern: "https?:\\/\\/(www\\.)?[-a-zA-Z0-9@:%._\\+~#=]{1,256}\\.[a-zA-Z0-9()]{1,6}\\b([-a-zA-Z0-9()!@:%_\\+.~#?&\\/\\/=]*)", options: .caseInsensitive)
    return isStringNotEmpty(string: string) && regex.firstMatch(in: string, options: [], range: NSRange(location: 0, length: string.count)) != nil
}

func isStringValidUserName(string: String) -> Bool {
    let regex = try! NSRegularExpression(pattern: "^[a-z0-9\\._-]{1,20}$", options: .caseInsensitive)
    return isStringNotEmpty(string: string) && regex.firstMatch(in: string, options: [], range: NSRange(location: 0, length: string.count)) != nil
}

func isStringValidBrazilianPhoneNumber(string: String) -> Bool {
    return (isStringLengthOf(string: string, length: 10) || isStringLengthOf(string: string, length: 11)) && isStringContainingOnlyNumbers(string: string)
}

func isStringValidUuid(string: String) -> Bool {
    let regex = try! NSRegularExpression(pattern: "^[0-9a-fA-F]{8}\\b-[0-9a-fA-F]{4}\\b-[0-9a-fA-F]{4}\\b-[0-9a-fA-F]{4}\\b-[0-9a-fA-F]{12}$", options: .caseInsensitive)
    return isStringNotEmpty(string: string) && regex.firstMatch(in: string, options: [], range: NSRange(location: 0, length: string.count)) != nil
}

var predefinedSettingsForType: [FormTextFieldType : FormTextFieldSettings] = [
    .text: FormTextFieldSettings(
        keyboardType: .default,
        formFieldView: .textField,
        textPattern: nil,
        completeCondition: isStringNotEmpty),
    .number: FormTextFieldSettings(
        keyboardType: .numberPad,
        formFieldView: .textField,
        textPattern: nil,
        completeCondition: isStringNotEmpty),
    .phoneNumber: FormTextFieldSettings(
        keyboardType: .phonePad,
        formFieldView: .formatTextField,
        textPattern: "(##) #####-####",
        completeCondition: isStringValidBrazilianPhoneNumber),
    .cpf: FormTextFieldSettings(
        keyboardType: .numberPad,
        formFieldView: .formatTextField,
        textPattern: "###.###.###-##",
        completeCondition: isStringValidCPF),
    .cnpj: FormTextFieldSettings(
        keyboardType: .numberPad,
        formFieldView: .formatTextField,
        textPattern: "##.###.###/####-##",
        completeCondition: isStringValidCNPJ),
    .bankAgency: FormTextFieldSettings(
        keyboardType: .numbersAndPunctuation,
        formFieldView: .formatTextField,
        textPattern: "#####-#",
        completeCondition: isStringContainingOnlyNumbers),
    .bankAccount: FormTextFieldSettings(
        keyboardType: .numbersAndPunctuation,
        formFieldView: .formatTextField,
        textPattern: "####################-#",
        completeCondition: isStringContainingOnlyNumbers),
    .real: FormTextFieldSettings(
        keyboardType: .numberPad,
        formFieldView: .formatSumTextField,
        textPattern: "R$ #.###,##",
        completeCondition: isStringNotEmpty),
    .userName: FormTextFieldSettings(
        keyboardType: .twitter,
        formFieldView: .textField,
        textPattern: nil,
        completeCondition: isStringValidUserName),
    .email: FormTextFieldSettings(
        keyboardType: .twitter,
        formFieldView: .textField,
        textPattern: nil,
        completeCondition: isStringValidEmail),
    .url: FormTextFieldSettings(
        keyboardType: .URL,
        formFieldView: .textField,
        textPattern: nil,
        completeCondition: isStringValidUrl),
    .uuidv4: FormTextFieldSettings(
        keyboardType: .default,
        formFieldView: .textField,
        textPattern: nil,
        completeCondition: isStringValidUuid)
    ]

struct FormTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FormTextField(content: .constant(""), label: "Nome", type: .text)
            FormTextField(content: .constant(""), label: "Telefone de Contato", type: .phoneNumber)
            FormTextField(content: .constant(""), label: "CPF", required: true, type: .cpf)
            FormTextField(content: .constant(""), label: "CNPJ", type: .cnpj)
            FormTextField(content: .constant(""), label: "Agência", type: .bankAgency)
            FormTextField(content: .constant(""), label: "Conta", type: .bankAccount)
            FormTextField(content: .constant(""), label: "Telefone", type: .phoneNumber)
            FormTextField(content: .constant(""), label: "Valor", required: true, type: .real)
        }
    }
}
