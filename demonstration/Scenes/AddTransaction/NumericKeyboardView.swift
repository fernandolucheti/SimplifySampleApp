//
//  NumericKeyboardView.swift
//  demonstration
//
//  Created by Fernando Lucheti on 02/11/22.
//

import SwiftUI

struct NumericKeyboardView: View {
    
    @Binding var value: String
    
    var body: some View {
        let keys = [
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9]
        ]
        
        let updateValueBlock: (String) -> Void = { value in
            self.value.append(contentsOf: "\(value.replacingOccurrences(of: ".", with: ""))")
        }
        
        VStack {
            ForEach(keys, id: \.self) { keyList in
                HStack {
                    ForEach(keyList, id: \.self) { key in
                        KeyView(key: "\(key)", didTapKey: updateValueBlock)
                    }
                }
            }
            
            HStack {
                KeyView(key: ".00", didTapKey: updateValueBlock)
                KeyView(key: "0", didTapKey: updateValueBlock)
                KeyView(symbol: .delete) { _ in
                    value = String(value.dropLast())
                }
            }
            
            HStack {
                Circle().hidden()
                KeyView(symbol: .checkmark) { _ in
                    
                }
                Circle().hidden()
            }
        }
    }
}

struct KeyView: View {
    
    var key: String = "0"
    var symbol: SystemIcons? = nil
    var didTapKey: ((String) -> Void)? = nil
    
    var body: some View {
    
        Button {
            didTapKey?(key)
        } label: {
            ZStack {
                Circle()
                    .strokeBorder(.gray, lineWidth: 2)
                if let symbol = symbol {
                    Image(systemName: symbol.rawValue)
                        .resizable()
                        .frame(width: 40, height: 35)
                        .foregroundColor(.gray)
                } else {
                    Text("\(key)")
                        .font(.system(size: 35))
                        .foregroundColor(.gray)
                }
            }
        }
    
    }
}

struct NumericKeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        NumericKeyboardView(value: Binding<String>.constant("")).padding(24)
    }
}
