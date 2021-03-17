//
//  Onboarding.swift
//  Gera
//
//  Created by Julia Machado on 02/03/21.
//

import SwiftUI

struct OnboardingView: View {
    @State private var icon = ["paperplane.fill",
                               "creditcard.fill",
                               "square.and.arrow.up.fill"]
    @State private var title = ["Pirangagem nunca mais.",
                                "Sem desculpinha.",
                                "Pra pagar nem precisa do app."]
    @State private var subtitle = ["Crie cartões personalizados de cobrança de forma simples e rápida.",
                                   "Suportamos várias formas de pagamento, de transferência até boleto bancários.",
                                   "Compartilhe os cartões em qualquer rede social, ou adicione ao Apple Wallet."]
    @State private var showModal = false
    
    var body: some View {
        
        VStack{
            Text("Cobrança?")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("A gente gera.")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(.systemPurple))
            
            Spacer().frame(height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            OnboardingBlocks(icon: Binding.constant(icon[0]), title: Binding.constant(title[0]), subtitle: Binding.constant(subtitle[0]))
            Spacer().frame(height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            OnboardingBlocks(icon: Binding.constant(icon[1]), title: Binding.constant(title[1]), subtitle: Binding.constant(subtitle[1]))
            Spacer().frame(height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            OnboardingBlocks(icon: Binding.constant(icon[2]), title: Binding.constant(title[2]), subtitle: Binding.constant(subtitle[2]))
            Spacer().frame(height: 35, alignment: .center)
            Buttons(name: Binding.constant("Começar"), action: {showModal.toggle()})
                .sheet(isPresented: $showModal) {
                    CardCustomizationView(showModal: self.$showModal)
                }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnboardingView()
                .previewDevice("iPhone 11")
            OnboardingView()
                .previewDevice("iPhone 8")
            OnboardingView()
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
