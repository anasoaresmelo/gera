//
//  ColorsButton.swift
//  Gera
//
//  Created by iris on 25/03/21.
//

import SwiftUI

struct ColorsButton: View {
    @Binding var color: LinearGradient
    @Binding var rgbColor: String
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
            HStack {
                Button(action: {
                    self.color = LinearGradient(gradient: Gradient(colors: [Color(red: 125 / 255, green: 80 / 255, blue: 189 / 255), Color(red: 163 / 255, green: 91 / 255, blue: 215 / 255)]), startPoint: .top, endPoint: .bottom)
                    self.rgbColor = "rgb(175, 82, 222)"
                }) {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 125 / 255, green: 80 / 255, blue: 189 / 255), Color(red: 163 / 255, green: 91 / 255, blue: 215 / 255)]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 45, height: 45)
                        
                }
                Button(action: {
                    self.color = LinearGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.9254902005195618, green: 0.30588236451148987, blue: 0.239215686917305, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.9254902005195618, green: 0.3535947799682617, blue: 0.2392156720161438, alpha: 1)), location: 0.00009999999747378752),
                    .init(color: Color(#colorLiteral(red: 0.8799999952316284, green: 0.22745764255523682, blue: 0.22745764255523682, alpha: 1)), location: 1)]),
                        startPoint: UnitPoint(x: 0.4835335795138955, y: 1.000336001126197),
                        endPoint: UnitPoint(x: 0.48042649068378, y: 0.07395334864119074))
                    self.rgbColor = "rgb(255, 59, 48)"
                }) {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 224 / 255, green: 58 / 255, blue: 58 / 255), Color(red: 236 / 255, green: 78 / 255, blue: 61 / 255)]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 45, height: 45)
                }
                Button(action: {
                    self.color = LinearGradient(gradient: Gradient(colors: [Color(red: 229 / 255, green: 115 / 255, blue: 53 / 255), Color(red: 241 / 255, green: 153 / 255, blue: 56 / 255)]), startPoint: .top, endPoint: .bottom)
                    self.rgbColor = "rgb(255, 149, 0)"
                }) {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 229 / 255, green: 115 / 255, blue: 53 / 255), Color(red: 241 / 255, green: 153 / 255, blue: 56 / 255)]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 45, height: 45)
                }
                Button(action: {
                    self.color = LinearGradient(gradient: Gradient(colors: [Color(red: 235 / 255, green: 167 / 255, blue: 66 / 255), Color(red: 248 / 255, green: 205 / 255, blue: 70 / 255)]), startPoint: .top, endPoint: .bottom)
                    self.rgbColor = "rgb(255, 204, 0)"
                }) {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 235 / 255, green: 167 / 255, blue: 66 / 255), Color(red: 248 / 255, green: 205 / 255, blue: 70 / 255)]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 45, height: 45)
                }
                Button(action: {
                    self.color = LinearGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.36005640029907227, green: 0.6100000143051147, blue: 0.3159487247467041, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.4195384681224823, green: 0.8100000023841858, blue: 0.4236922860145569, alpha: 1)), location: 1)]),
                        startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                        endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999))
                    self.rgbColor = "rgb(52, 199, 89)"
                }) {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 107 / 255, green: 181 / 255, blue: 94 / 255), Color(red: 101 / 255, green: 195 / 255, blue: 102 / 255)]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 45, height: 45)
                }
                Button(action: {
                    self.color = LinearGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.16780489683151245, green: 0.43349581956863403, blue: 0.8600000143051147, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.19512194395065308, green: 0.6378049850463867, blue: 1, alpha: 1)), location: 1)]),
                        startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                        endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999))
                    self.rgbColor = "rgb(0, 122, 255)"
                }) {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 48 / 255, green: 124 / 255, blue: 246 / 255), Color(red: 45 / 255, green: 148 / 255, blue: 232 / 255)]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 45, height: 45)
                }
                Button(action: {
                    self.color = LinearGradient(gradient: Gradient(colors: [Color(red: 44 / 255, green: 44 / 255, blue: 46 / 255), Color(red: 93 / 255, green: 93 / 255, blue: 97 / 255)]), startPoint: .top, endPoint: .bottom)
                    self.rgbColor = "rgb(142, 142, 147)"
                }) {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 44 / 255, green: 44 / 255, blue: 46 / 255), Color(red: 93 / 255, green: 93 / 255, blue: 97 / 255)]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 45, height: 45)
                }
            }
        })
        //.frame(width: UIScreen.main.bounds.width/1.2, height: 45)
    }//.padding(.horizontal)
}

struct ColorsButton_Previews: PreviewProvider {
    static var previews: some View {
        ColorsButton(color: .constant(LinearGradient(gradient: Gradient(colors: [Color(red: 44 / 255, green: 44 / 255, blue: 46 / 255), Color(red: 93 / 255, green: 93 / 255, blue: 97 / 255)]), startPoint: .top, endPoint: .bottom)), rgbColor: .constant("rgb(175, 82, 222)"))
    }
}
