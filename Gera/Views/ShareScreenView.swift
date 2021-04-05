//
//  ShareScreenView.swift
//  Gera
//
//  Created by Beatrix Lee on 02/03/21.
//

import SwiftUI

struct ShareScreenView: View {
    @Binding var color: Color
    @Binding var message: String
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                LargeTitle(largeTitle: .constant("Tudo certo!"))
                Spacer().frame(height: 40, alignment: .center)
                CardPreview(color: $color, message: $message)
                    
                    
                BodyRegular(subtitle: .constant("O cartão que foi gerado também pode ser enviado, por meio de arquivo ou link, para outras pessoas."))
                    .frame(width: UIScreen.main.bounds.width/1.2, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                Spacer().frame(height: 20, alignment: .center)
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
                    .frame(width: UIScreen.main.bounds.width/1.2)
                    .background(Color(.systemPurple))
                    .cornerRadius(7.0)
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
                })
                {
                    Image(systemName: "link")
                        .foregroundColor(Color(.systemPurple))
                    Text("Copiar link")
                        .foregroundColor(Color(.systemPurple))
                }
                Spacer()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct ShareScreenView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ShareScreenView(color: Binding.constant(Color(.systemPurple)), message: Binding.constant("funciona?"))
            ShareScreenView(color: Binding.constant(Color(.systemPurple)), message: Binding.constant("funciona?"))
                .previewDevice("iPhone 8")
            ShareScreenView(color: Binding.constant(Color(.systemPurple)), message: Binding.constant("funciona?"))
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
