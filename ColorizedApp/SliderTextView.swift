    //
    //  SliderTextView.swift
    //  ColorizedApp
    //
    //  Created by Konstantin Fomenkov on 17.05.2022.
    //

import SwiftUI

struct SliderTextView: View {

    @Binding var value: Double
    @Binding var text: String

    let accentColor: Color

    var body: some View {
        HStack() {
            Text(String(Int(value)))
                .frame(width: 50, height: 30)
                .foregroundColor(.white)

            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(accentColor)
                .onChange(of: value) { _ in
                    text = "\(lround(value))"
                }

            TextField("", text: $text, onCommit: setValue)
                .frame(width: 50, height: 30)
                .foregroundColor(.black)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
                .onAppear() {
                    text = "\(lround(value))"
                }
        }
    }

    struct SliderTextView_Previews: PreviewProvider {
        static var previews: some View {
            ZStack{
                Color.gray.ignoresSafeArea()
                SliderTextView(value: .constant(10), text: .constant("10"), accentColor: .blue)
            }
        }
    }

    private func setValue() {
        guard let value = Double(text), (0...255).contains(value) else {
            text = "\(lround(self.value))"
            return
        }
        self.value = value
    }
}

