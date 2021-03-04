//
//  TermsConditionsView.swift
//  Gera
//
//  Created by Beatrix Lee on 04/03/21.
//

import SwiftUI
import Parma

struct TermsConditionsView: View {
    let termsOfService: String
    let privacyPolicy: String
    
    init() {
        do {
            let termsOfServicePath = Bundle.main.path(forResource: "TERMS_OF_SERVICE_PT_BR", ofType: "md")
            termsOfService = try String(contentsOfFile: termsOfServicePath!, encoding: String.Encoding.utf8)
        } catch {
            termsOfService = "Um erro ocorreu ao tentar carregar os Termos de Serviço."
        }
        
        do {
            let privacyPolicyPath = Bundle.main.path(forResource: "PRIVACY_POLICY_PT_BR", ofType: "md")
            privacyPolicy = try String(contentsOfFile: privacyPolicyPath!, encoding: String.Encoding.utf8)
        } catch {
            privacyPolicy = "Um erro ocorreu ao tentar carregar a Política de Privacidade."
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Parma(termsOfService + privacyPolicy)
                
                Button(action: {
                    
                }) {
                    Text("Concordar")
                        .foregroundColor(Color(.systemBackground))
                    
                }
                .padding()
                .background(Color(.systemPurple))
                .cornerRadius(7)
                .padding(.top, 20)
                
                Button(action: {
                    
                }) {
                    Text("Voltar")
                        .foregroundColor(Color(.systemPurple))
                    
                }
                .padding(.top, 10)
                .cornerRadius(7)

            }.padding()
        }
        
        
    }
}


struct TermsConditionsView_Previews: PreviewProvider {
    static var previews: some View {
        TermsConditionsView()
    }
}
