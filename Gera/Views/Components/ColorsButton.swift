//
//  ColorsButton.swift
//  Gera
//
//  Created by iris on 25/03/21.
//

import SwiftUI

struct ColorsButton: View {
    @Binding var color: Color
    @Binding var rgbColor: String
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
            HStack {
                Button(action: {
                    self.color = Color(.systemPurple)
                    self.rgbColor = "rgb(175, 82, 222)"
                }) {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .foregroundColor(Color(.systemPurple))
                        .frame(width: 45, height: 45)
                }
                Button(action: {
                    self.color = Color(.systemRed)
                    self.rgbColor = "rgb(255, 59, 48)"
                }) {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .foregroundColor(Color(.systemRed))
                        .frame(width: 45, height: 45)
                }
                Button(action: {
                    self.color = Color(.systemOrange)
                    self.rgbColor = "rgb(255, 149, 0)"
                }) {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .foregroundColor(Color(.systemOrange))
                        .frame(width: 45, height: 45)
                }
                Button(action: {
                    self.color = Color(.systemYellow)
                    self.rgbColor = "rgb(255, 204, 0)"
                }) {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .foregroundColor(Color(.systemYellow))
                        .frame(width: 45, height: 45)
                }
                Button(action: {
                    self.color = Color(.systemGreen)
                    self.rgbColor = "rgb(52, 199, 89)"
                }) {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .foregroundColor(Color(.systemGreen))
                        .frame(width: 45, height: 45)
                }
                Button(action: {
                    self.color = Color(.systemBlue)
                    self.rgbColor = "rgb(0, 122, 255)"
                }) {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .foregroundColor(Color(.systemBlue))
                        .frame(width: 45, height: 45)
                }
                Button(action: {
                    self.color = Color(.systemGray)
                    self.rgbColor = "rgb(142, 142, 147)"
                }) {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .foregroundColor(Color(.systemGray))
                        .frame(width: 45, height: 45)
                }
                Button(action: {
                    self.color = Color(.systemGray)
                    self.rgbColor = "rgb(142, 142, 147)"
                }) {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .foregroundColor(Color(.systemGray))
                        .frame(width: 45, height: 45)
                }
                Button(action: {
                    self.color = Color(.systemGray)
                    self.rgbColor = "rgb(142, 142, 147)"
                }) {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .foregroundColor(Color(.systemGray))
                        .frame(width: 45, height: 45)
                }
                Button(action: {
                    self.color = Color(.systemGray)
                    self.rgbColor = "rgb(142, 142, 147)"
                }) {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .foregroundColor(Color(.systemGray))
                        .frame(width: 45, height: 45)
                }
            }
        })
        //.frame(width: UIScreen.main.bounds.width/1.2, height: 45)
    }//.padding(.horizontal)
}

struct ColorsButton_Previews: PreviewProvider {
    static var previews: some View {
        ColorsButton(color: .constant(Color(.systemPurple)), rgbColor: .constant("rgb(175, 82, 222)"))
    }
}
