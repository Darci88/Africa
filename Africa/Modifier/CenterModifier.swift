//
//  CenterModifier.swift
//  Africa
//
//  Created by user219285 on 3/28/23.
//

import Foundation
import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
}
