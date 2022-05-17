    //
    //  ContentView.swift
    //  ColorizedApp
    //
    //  Created by Konstantin Fomenkov on 16.05.2022.
    //

import SwiftUI

struct ContentView: View {

    @State private var redSliderValue: Double = 190
    @State private var greenSliderValue: Double = 190
    @State private var blueSliderValue: Double = 20

    @State private var redTextField = ""
    @State private var greenTextField = ""
    @State private var blueTextField = ""

    var body: some View {
        ZStack {
            Color("backgroundColor").ignoresSafeArea()
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(
                        red: redSliderValue / 255,
                        green: greenSliderValue / 255,
                        blue: blueSliderValue / 255)
                    )
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 4))
                    .frame(height: 100)
                    .padding()

                VStack(spacing: 10) {
                    SliderTextView(
                        value: $redSliderValue,
                        text: $redTextField,
                        accentColor: .red
                    )
                    SliderTextView(
                        value: $greenSliderValue,
                        text: $greenTextField,
                        accentColor: .green
                    )
                    SliderTextView(
                        value: $blueSliderValue,
                        text: $blueTextField,
                        accentColor: .blue
                    )
                }.padding()
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

