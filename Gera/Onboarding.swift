//
//  Onboarding.swift
//  Gera
//
//  Created by Julia Machado on 02/03/21.
//

import SwiftUI

struct Onboarding: View {
    var body: some View {
        VStack{
            Text("Cobrança?")
                .font(.largeTitle)
            Text("A gente gera.")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.purple)
            
            HStack{
                Image(systemName: "paperplane.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36, height: 33, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.purple)
                    .padding(.horizontal, 32)
                VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    Text("Pirangagem nunca mais.")
                        .bold()
                        .multilineTextAlignment(.leading)
                    Text("Crie cartões personalizados de cobrança de forma simples e rápida.")
                        .multilineTextAlignment(.leading)
                }) .frame(width: UIScreen.main.bounds.width/1.5, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
            .padding()
            
            HStack{
                Image(systemName: "creditcard.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 33, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.purple)
                    .padding(.horizontal, 32)
                VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    Text("Sem desculpinha.")
                        .bold()
                        .multilineTextAlignment(.leading)
                    Text("Suportamos várias formas de pagamento, de transferência até boleto bancários.")
                        .multilineTextAlignment(.leading)
                }) .frame(width: UIScreen.main.bounds.width/1.5, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
            .padding()
            
            HStack{
                Image(systemName: "square.and.arrow.up.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36, height: 36, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.purple)
                    .padding(.horizontal, 32)
                VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    Text("Sem desculpinha.")
                        .bold()
                        .multilineTextAlignment(.leading)
                    Text("Suportamos várias formas de pagamento, de transferência até boleto bancários.")
                        .multilineTextAlignment(.leading)
                }) .frame(width: UIScreen.main.bounds.width/1.5, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
            .padding()
        }
    }
}


struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
            .previewDevice("iPhone 11")
    }
}
