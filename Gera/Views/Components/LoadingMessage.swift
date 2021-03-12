//
//  LoadingMessage.swift
//  Gera
//
//  Created by Erick Almeida on 12/03/21.
//

import SwiftUI

struct LoadingMessage: View {
    var body: some View {
        HStack {
            ProgressView().padding(8)
            Text("Um momento...")
        }
    }
}

struct LoadingMessage_Previews: PreviewProvider {
    static var previews: some View {
        LoadingMessage()
    }
}
