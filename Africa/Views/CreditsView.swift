//
//  Credits.swift
//  Africa
//
//  Created by user219285 on 3/28/23.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            Text("Daria")
            .font(.footnote)
            .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.4)
    }
}

struct Credits_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
