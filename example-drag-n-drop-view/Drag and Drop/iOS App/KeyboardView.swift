//
//  ContentView.swift
//  iOS App
//
//  Created by adrian.florescu on 18.02.2022.
//

import SwiftUI

let vibration = [
    "1": { Vibration.error.vibrate() },
    "2": { Vibration.success.vibrate() },
    "3": { Vibration.warning.vibrate() },
    "4": { Vibration.light.vibrate() },
    "5": { Vibration.medium.vibrate() },
    "6": { Vibration.heavy.vibrate() },
    "7": { Vibration.soft.vibrate() },
    "8": { Vibration.rigid.vibrate() },
    "9": { Vibration.selection.vibrate() },
    "0": { Vibration.oldSchool.vibrate() },
    "#": { },
    "*": { }
]

func key(_ text: String) -> some View {
    return Text(text)
        .padding(30)
        .font(.system(size: 50, design: .monospaced))
        .gesture(
            TapGesture()
                .onEnded { _ in
                    vibration[text]?()
                }
        )
        .frame(width: 100, height: 100, alignment: .center)
//        .border(.red)
        .background() {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.yellow)
        }
}

struct KeyboardView: View {
    var body: some View {
        Text("Tap for vibrations...")
        VStack {
            HStack {
                key("1")
                key("2")
                key("3")
            }
            HStack {
                key("4")
                key("5")
                key("6")
            }
            HStack {
                key("7")
                key("8")
                key("9")
            }
            HStack {
                key("#")
                key("0")
                key("*")
            }
        }

    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView()
    }
}
