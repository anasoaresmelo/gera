//
//  AddPassView.swift
//  Gera
//
//  Created by Erick Almeida on 02/03/21.
//

import SwiftUI
import PassKit

struct AddPassView: View {
    var pass: PKPass
    
    var body: some View {
        AddPassWrapper(pass: pass)
    }
}

//struct AddPassView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddPassView(pass: PKPass)
//    }
//}

struct AddPassWrapper: UIViewControllerRepresentable{
    let pass: PKPass;
    
    init(pass: PKPass) {
        self.pass = pass
    }
    
    typealias UIViewControllerType = PKAddPassesViewController
    
    func makeUIViewController(context: Context) -> PKAddPassesViewController {
        let pageViewController = PKAddPassesViewController(pass: pass)
          return pageViewController!
      }

      func updateUIViewController(_ pageViewController: PKAddPassesViewController, context: Context) {

      }
    
}
