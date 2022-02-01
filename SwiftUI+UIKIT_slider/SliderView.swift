//
//  SliderView.swift
//  SwiftUI+UIKIT_slider
//
//  Created by Alisa Ts on 31.01.2022.
//

import SwiftUI

struct SliderView: View {
    @Binding var currentValue: Double
  
   
    
    var body: some View {
        VStack {

               
            SliderUI(value: $currentValue)
              
        }
    }
//   func computeScore() -> Int {
//        let difference = abs(targetValue - lround(currentValue))
//        return 100 - difference
//    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(currentValue: .constant(100))
    }
}
