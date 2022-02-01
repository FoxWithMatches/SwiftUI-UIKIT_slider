//
//  UISlider.swift
//  SwiftUI+UIKIT_slider
//
//  Created by Alisa Ts on 31.01.2022.
//

import SwiftUI

struct SliderUI: UIViewRepresentable {
    @Binding var currentValue: Double
    
    let alpha: Int
    let color: UIColor
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.changedValue),
                         for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
        uiView.thumbTintColor = color.withAlphaComponent(CGFloat(alpha) / 100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $currentValue)
    }
}

extension SliderUI {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func changedValue(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct SliderUI_Previews: PreviewProvider {
    static var previews: some View {
        SliderUI(currentValue: .constant(100), alpha: 100, color: .red)
    }
}
