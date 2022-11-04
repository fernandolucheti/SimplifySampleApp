//
//  NumericKeyboardView.swift
//  demonstration
//
//  Created by Fernando Lucheti on 02/11/22.
//

import SwiftUI

struct NumericKeyboardView: View {
    
    @Binding var value: String
    var doneAction: () -> Void
    private typealias Key = KeyViewModel
    
    private var delKey: Key {
        Key(.delete) { value = String(value.dropLast()) }
    }
    
    private var doneKey: Key {
        Key(.checkmark, didTapAction: doneAction)
    }
    
    var body: some View {
        
        let keys = [
            [Key(1), Key(2), Key(3)],
            [Key(4), Key(5), Key(6)],
            [Key(7), Key(8), Key(9)],
            [delKey, Key(0), doneKey]
        ]
        
        VStack {
            Spacer()
            ForEach(keys, id: \.self) { keyList in
                HStack() {
                    ForEach(keyList) { key in
                        setupKey(key)
                    }
                    .padding(.horizontal, 4)
                }
            }
            Spacer()
        }
    }
    
    private func setupKey(_ key: Key) -> KeyView {
        var key = key
        key.didTapKey = { value in
            self.value.append(contentsOf: "\(value.replacingOccurrences(of: ".", with: ""))")
        }
        return KeyView(viewModel: key)
    }
}

struct KeyView: View {
    
    var viewModel: KeyViewModel
    
    var body: some View {
        Button(action: keyAction, label: buttonLabel)
    }
    
    func buttonLabel() -> some View {
        ZStack {
            Circle()
                .strokeBorder(.gray, lineWidth: 2)
            if let symbol = viewModel.icon {
                Image(systemName: symbol.rawValue)
                    .resizable()
                    .frame(width: 40, height: 35)
                    .foregroundColor(.gray)
            } else if let key = viewModel.key {
                Text(key)
                    .primaryXXL()
            }
        }
    }
    
    func keyAction() {
        viewModel.didTapAction?()
        if let key = viewModel.key {
            viewModel.didTapKey?(key)
        }
    }
}

struct NumericKeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        NumericKeyboardView(value: Binding<String>.constant("")) {
            
        }.padding(24)
    }
}
