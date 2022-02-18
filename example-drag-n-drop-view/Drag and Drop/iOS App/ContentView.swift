//
//  ContentView.swift
//  iOS App
//
//  Created by adrian.florescu on 18.02.2022.
//

import SwiftUI

var click = 0

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world! v1")
                .padding(10)
                .background {
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundColor(.blue)
                }
            let t = Text("Hello, world2!")
                .padding(10)
                .background {
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundColor(.blue)
                }
            t
            Button(action: {
                print("tapped...")
                click += 1
                print("t = \(t)")
            }) {
                Text("Clicked #\(click)")
                    .background(
                        RoundedRectangle(cornerRadius: 50)
                            .foregroundColor(.black)
                    )
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
