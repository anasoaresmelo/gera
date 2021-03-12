//
//  Onboarding.swift
//  Gera
//
//  Created by Julia Machado on 02/03/21.
//

import SwiftUI

struct OnboardingView: View {
    @State private var showModal = false
    var body: some View {
        ScrollView(.vertical) {
            Spacer()
            VStack{
                Text("Cobrança?")
                    .font(.system(size: 36, weight: .bold, design: .default))
                Text("A gente gera.")
                    .font(.system(size: 36, weight: .bold, design: .default))
                    .foregroundColor(Color(.systemPurple))
                    .padding(.bottom, 20)
                
                HStack{
                    Image(systemName: "paperplane.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 36, height: 33, alignment: .center)
                        .foregroundColor(Color(.systemPurple))
                        .padding(.horizontal, 32)
                    VStack(alignment: .leading, spacing: nil, content: {
                        Text("Pirangagem nunca mais.")
                            .font(.system(size: 17, weight: .bold, design: .default))
                            .multilineTextAlignment(.leading)
                        Text("Crie cartões personalizados de cobrança de forma simples e rápida.")
                            .font(.system(size: 17, weight: .regular, design: .default))
                            .multilineTextAlignment(.leading)
                    }) .frame(width: UIScreen.main.bounds.width/1.5, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
                }
                .padding()
                
                HStack{
                    Image(systemName: "creditcard.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 33, alignment: .center)
                        .foregroundColor(Color(.systemPurple))
                        .padding(.horizontal, 32)
                    VStack(alignment: .leading, spacing: nil, content: {
                        Text("Sem desculpinha.")
                            .font(.system(size: 17, weight: .bold, design: .default))
                            .multilineTextAlignment(.leading)
                        Text("Suportamos várias formas de pagamento, de transferência até boleto bancários.")
                            .font(.system(size: 17, weight: .regular, design: .default))
                            .multilineTextAlignment(.leading)
                    }) .frame(width: UIScreen.main.bounds.width/1.5, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
                }
                .padding()
                
                HStack{
                    Image(systemName: "square.and.arrow.up.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 36, height: 36, alignment: .center)
                        .foregroundColor(Color(.systemPurple))
                        .padding(.horizontal, 32)
                    VStack(alignment: .leading, spacing: nil, content: {
                        Text("Pra pagar nem precisa do app.")
                            .font(.system(size: 17, weight: .bold, design: .default))
                            .multilineTextAlignment(.leading)
                        Text("Compartilhe os cartões em qualquer rede social, ou adicione ao Apple Wallet.")
                            .font(.system(size: 17, weight: .regular, design: .default))
                            .multilineTextAlignment(.leading)
                    }) .frame(width: UIScreen.main.bounds.width/1.5, height: 100, alignment: .leading)
                }
                .padding()
                
                Button(action: {
                    self.showModal.toggle()
                    
                }) {
                    
                    Text("Começar")
                        .foregroundColor(Color(.systemBackground))
                        .padding()
                        .frame(width: UIScreen.main.bounds.width/1.2)
                        .background(Color(.systemPurple))
                        .cornerRadius(7)
                }
                .sheet(isPresented: $showModal) {
                    CardCustomizationView(showModal: self.$showModal)
                }
                .padding(.top, 30)
                
            }.padding(64)
            Spacer()
        }
    }
}


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .previewDevice("iPhone 11")
    }
}
