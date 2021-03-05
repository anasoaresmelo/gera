//
//  ShareScreenView.swift
//  Gera
//
//  Created by Beatrix Lee on 02/03/21.
//

import SwiftUI

struct ShareScreenView: View {
    
    var body: some View {
        VStack(alignment: .center) {
            
            Text("Tudo certo!")
                .font(.system(size: 36, weight: .bold, design: .default))
                
                .padding(.top, 80)
            
            Text("O cartão que foi gerado também pode ser enviado, por meio de arquivo ou link, \n para outras pessoas.")
                .font(.system(size: 17, weight: .regular, design: .default))
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .padding()
                .padding(.bottom, 50)
                .padding(.vertical)
            
            
            
            Button(action: {
                
                let shareAll = [BackendConnector.shared.lastPassData!.dataToFile(fileName: "Cartão Gera.pkpass")]
                let shareView = UIActivityViewController(activityItems: shareAll as [Any], applicationActivities: nil)
                
                if var topController = UIApplication.shared.windows.first?.rootViewController {
                    while let presentedViewController = topController.presentedViewController {
                        topController = presentedViewController
                    }
                    
                    topController.present(shareView, animated: true, completion: nil)
                    
                }
                
                
            }) {
                HStack {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(Color(.systemBackground))
                    Text("Compartilhar cartão")
                        .foregroundColor(Color(.systemBackground))
                    
                    
                }
                .padding()
                .background(Color(.systemPurple))
                .cornerRadius(7)
            }
            
            Button(action: {
                
                let shareAll = [BackendConnector.shared.lastPassUrl! as NSURL]
                let shareView = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
                if var topController = UIApplication.shared.windows.first?.rootViewController {
                    while let presentedViewController = topController.presentedViewController {
                        topController = presentedViewController
                    }
                    
                    topController.present(shareView, animated: true, completion: nil)
                    
                }
                
            }) {
                Image(systemName: "link")
                    .foregroundColor(Color(.systemPurple))
                Text("Copiar link")
                    .foregroundColor(Color(.systemPurple))
            }
            .padding()
            
            Image("GeraLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 30, alignment: .center)
                .padding(.top, 100)
            
            
            
        }
        .padding()
    }
}

struct ShareScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ShareScreenView()
    }
}
