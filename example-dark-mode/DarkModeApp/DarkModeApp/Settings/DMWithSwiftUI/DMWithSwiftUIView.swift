//
//  DMWithSwiftUIView.swift
//  DarkModeApp
//
//  Created by adrian.florescu on 22.09.2022.
//

import SwiftUI
//(name: "Unspecified", style: .unspecified),
//(name: "Dark", style: .dark),
//(name: "Light", style: .light)

struct DMWithSwiftUIView: View {
    var body: some View {
        List {
            Text("Unspecified")
            Text("Dark")
            Text("Light")
        }
    }
}

struct DMWithSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DMWithSwiftUIView()
    }
}
