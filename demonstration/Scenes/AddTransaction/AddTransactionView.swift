//
//  AddTransactionView.swift
//  demonstration
//
//  Created by Fernando Lucheti on 02/11/22.
//

import SwiftUI

struct AddTransactionView: View {
    
    @State var value: String = ""
    @State var toggleKeyboard = true
    
    init() {
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.gray], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.gray], for: .normal)
    }
    
    var body: some View {
        VStack {
            
            Navigation()
            
            ValueAndOptionsHeader(value: $value,
                                  toggleKeyboard: $toggleKeyboard)
            
            Spacer()
            
            if toggleKeyboard {
                NumericKeyboardView(value: $value)
            } else {
                MoreOptionsView()
            }
            
            Spacer()
        }
        .padding(24)
        .ignoresSafeArea()
    }
}

fileprivate struct Navigation: View {
    var body: some View {
        HStack {
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: SystemIcons.close.rawValue)
                    .resizable()
                    .foregroundColor(.gray)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .padding(10)
            }
        }
    }
}

fileprivate struct ValueAndOptionsHeader: View {
    
    @Binding var value: String
    @Binding var toggleKeyboard: Bool
    @State var transactionType: AddTransactionModels.TransactionType = .expense
    @State var category = AddTransactionModels.Category(name: "Restaurants", color: "#A00014")
    
    var displayText: Text {
        switch transactionType {
        case .income:
            return Text("Income")
                .foregroundColor(Color(uiColor: ColorTheme.primaryAccent.color))
        case .expense:
            return Text(category.name)
                .foregroundColor(Color(uiColor: .init(hex: category.color)))
        case .transfer:
            return Text("Transfer")
                .foregroundColor(.gray)
        }
    }
    
    var body: some View {
        HStack {
            let doubleValue = (Double(value) ?? 0)/100
            Text(doubleValue.currencyString())
                .font(.system(size: 35))
                .foregroundColor(.gray)
                .minimumScaleFactor(0.01)
                .lineLimit(1)
            
            Spacer()
            
            displayText
                .font(.system(size: 30, weight: .medium))
                .lineLimit(1)
                .minimumScaleFactor(1)
        }
        
        HStack {
            Button {
                toggleKeyboard.toggle()
            } label: {
                Text("\(toggleKeyboard ? "+" : "-") options")
                    .font(.system(size: 30))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text("Account")
                .font(.system(size: 30, weight: .medium))
                .foregroundColor(.red)
                .lineLimit(1)
            
        }.padding([.top, .bottom], 4)
        
        Picker("", selection: $transactionType) {
            ForEach(AddTransactionModels.TransactionType.allCases, id: \.self) { type in
                Text("\(type.rawValue)")
            }
        }
        .pickerStyle(.segmented)
        .padding(.top, 16)
        .padding(.bottom, 24)
    }
}

struct AddTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AddTransactionView()
        }
    }
}
