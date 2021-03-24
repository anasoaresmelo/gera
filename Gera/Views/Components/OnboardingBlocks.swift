//
//  OnboardingBlocks.swift
//  Gera
//
//  Created by iris on 17/03/21.
//

import SwiftUI

struct OnboardingBlocks: View {
    @Binding var icon: String
    @Binding var title: String
    @Binding var subtitle: String
    
    var body: some View {
        HStack{
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 36, height: 33, alignment: .center)
                .foregroundColor(Color(.systemPurple))
                .padding(.trailing)
            VStack(alignment: .leading, spacing: nil, content: {
                BodyBold(title: $title)
                Spacer().frame(height: 4, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                BodyRegular(subtitle: $subtitle)
            }) .frame(width: UIScreen.main.bounds.width/1.5, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
        }
    }
}

struct OnboardingBlocks_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingBlocks(icon: Binding.constant("paperplane.fill"), title: Binding.constant("Pirangagem nunca mais."), subtitle: Binding.constant("Crie cartões personalizados de cobrança de forma simples e rápida."))
    }
}
