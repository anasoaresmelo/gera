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
    let value: Double?
    let imageUrl: String?
    let picpayUser: String?
    let boletoDigitableLine, cpf, cnpj: String?
    let bankCode, bankName: String?
    let agencyNumber, accountNumber, accountType: String?
    let nubankUrl: String?
    let emailAddress, pixRandomKey: String?
    let foregroundColor, backgroundColor: String?
    
}

class BackendConnector {
    let baseUrlString = "https://gera-server.herokuapp.com"
    static var shared = BackendConnector()
    var message: String = ""
    var foregroundColor: String?
    var backgroundColor: String?
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

extension Data {

    /// Data into file
    ///
    /// - Parameters:
    ///   - fileName: the Name of the file you want to write
    /// - Returns: Returns the URL where the new file is located in NSURL
    func dataToFile(fileName: String) -> NSURL? {

        // Make a constant from the data
        let data = self

        // Make the file path (with the filename) where the file will be loacated after it is created
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        
        let filePath = (documentsDirectory as NSString).appendingPathComponent(fileName)

        do {
            // Write the file from data into the filepath (if there will be an error, the code jumps to the catch block below)
            try data.write(to: URL(fileURLWithPath: filePath))

            // Returns the URL where the new file is located in NSURL
            return NSURL(fileURLWithPath: filePath)

        } catch {
            // Prints the localized description of the error from the do block
            print("Error writing the file: \(error.localizedDescription)")
        }

        // Returns nil if there was an error in the do-catch -block
        return nil

    }

}
