//
//  GeraTextStyles.swift
//  Gera
//
//  Created by iris on 23/03/21.
//

import SwiftUI

struct GeraTextStyles: View {
    var body: some View {
        VStack{
            LargeTitle(largeTitle: .constant("dale"))
            RegularTitle(regularTitle: .constant("dale"))
            BodyRegular(subtitle: .constant("dale"))
            BodyBold(title: .constant("dale"))
            TextCard(message: .constant("dale"))
                .background(Color(.systemPurple))
            CardScreenTitle(title: .constant("dale"))
        }
    }
}
struct LargeTitle: View {
    @Binding var largeTitle: String
    
    var body: some View {
        Text(largeTitle)
            .font(.largeTitle)
            .fontWeight(.bold)
    }
}
struct RegularTitle: View {
    @Binding var regularTitle: String
    
    var body: some View {
        Text(regularTitle)
            .font(.title)
            .multilineTextAlignment(.center)
            .padding(.top, -20)
    }
}
struct BodyBold: View {
    @Binding var title: String
    
    var body: some View {
        Text(title)
            .font(.headline)
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)
    }
}
struct BodyRegular: View {
    @Binding var subtitle: String
    
    var body: some View {
        Text(subtitle)
            .font(.headline)
            .fontWeight(.regular)
            .multilineTextAlignment(.leading)
    }
}
struct TextCard: View {
    @Binding var message: String
    
    var body: some View {
        Text(message)
            .font(.system(size: 18, weight: .bold, design: .default))
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/7, alignment: .leading)
            .padding()
            .padding(.bottom, 40)
    }
}
struct CardScreenTitle: View {
    @Binding var title: String
    
    var body: some View {
        HStack {
            BodyBold(title: .constant(title))
                .padding(.horizontal)
                .padding(.top)
            Spacer()
        }.padding(.horizontal)
    }
}

struct GeraTextStyles_Previews: PreviewProvider {
    static var previews: some View {
        GeraTextStyles()
    }
}
