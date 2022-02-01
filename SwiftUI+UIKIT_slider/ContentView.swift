//
//  ContentView.swift
//  SwiftUI+UIKIT_slider
//
//  Created by Alisa Ts on 31.01.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue = 30.0
    @State private var targetValue = Int.random(in: 0...100)
    @State private var showAlert = false
    @State private var onTap = false
    
    var body: some View {
        VStack {
            
            Text("Подвиньте слайдер как можно ближе к \(targetValue)")
                .padding()
            HStack {
                Text("0")
                SliderView(currentValue: $currentValue)
                Text("100")
            }
            .padding()
            Button("Проверь меня!") {
                showAlert.toggle()
            }
            .alert("Your score",
                   isPresented: $showAlert,
                   actions: {}) {
                Text(String(computeScore()))
            }
                   .padding()
            Button("Начать заново")
            { updateRandom() }
        }
    }
    
    private func updateRandom() {
        let randomNumber = Int.random(in: 0...100)
        
        self.targetValue = randomNumber
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
