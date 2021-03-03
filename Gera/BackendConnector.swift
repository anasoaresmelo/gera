//
//  BackendConnector.swift
//  Gera
//
//  Created by Erick Almeida on 02/09/20.
//  Copyright © 2020 Erick Almeida. All rights reserved.
//

import Foundation
import PassKit

enum RequestError: Error {
    case runtimeError(String)
}

struct PassRequest: Codable {
    let type, message, recipientName, recipientPhoneNumber: String
    let value, imageUrl: String?
    let picpayUser: String?
    let boletoDigitableLine, cpf, cnpj: String?
    let bankCode, bankName: String?
    let agencyNumber, accountNumber, accountType: String?
    let nubankUrl: String?
    let foregroundColor, backgroundColor: String?
}

class BackendConnector {
    let baseUrlString = "https://gera-server.herokuapp.com"
    static var shared = BackendConnector()
    var message: String = ""
    var imageUrl: String?
    var lastPassUrl: URL?
    var lastPass: PKPass?
    var lastPassData: Data?
    
    private init() {}
    
    func requestPassFromServer(cardData: PassRequest, withCompletionHandler: ((PKPass) -> Void)?, withErrorHandler: (() -> Void)?) {
        let cardUrlString = "\(baseUrlString)/card"
        let cardUrl = URL(string: cardUrlString)!
        let session = URLSession.shared
        var request = URLRequest(url: cardUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let httpBody = try! JSONEncoder().encode(cardData)
        request.httpBody = httpBody

        let task = session.dataTask(with: request) { data, response, error in
           do {
                if (response != nil && (response as! HTTPURLResponse).statusCode == 200) {
                    let pass = try PKPass.init(data: data!)
                    self.lastPassUrl = URL(string: "\(cardUrlString)/\(pass.serialNumber)")
                    self.lastPass = pass
                    self.lastPassData = data
                     
                    if let completionHandler = withCompletionHandler {
                        DispatchQueue.main.async {
                            completionHandler(pass)
                        }
                    }
                } else {
                    throw RequestError.runtimeError("Request not successful")
                }

           } catch {
               print("Error: \(error.localizedDescription)")
            if let errorHandler = withErrorHandler {
                DispatchQueue.main.async {
                    errorHandler()
                }
            }
           }
        }
       
       task.resume()
    }
    
}
