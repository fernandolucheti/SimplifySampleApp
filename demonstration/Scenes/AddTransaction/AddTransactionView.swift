//
//  AddTransactionView.swift
//  demonstration
//
//  Created by Fernando Lucheti on 02/11/22.
//

import SwiftUI

fileprivate typealias ViewModel = AddTransactionViewModel

struct AddTransactionView: View {
    
    @StateObject private var viewModel = ViewModel(category: .init(name: "Restaurants", color: "#A00014"), account: .init(name: "Account", color: "#A00014"))
    
    init() {
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.gray], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.gray], for: .normal)
    }
    
    var body: some View {
        VStack {
            Navigation()
            ValueAndOptionsHeader(viewModel: viewModel)
            
            if viewModel.toggleKeyboard {
                NumericKeyboardView(value: $viewModel.value, doneAction: save)
            } else {
                MoreOptionsView()
            }
        }
        .padding(24)
        .ignoresSafeArea()
    }
    
    func save() {
        
    }
}

fileprivate struct Navigation: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        HStack {
            Spacer()
            Button(action: dismiss.callAsFunction) {
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
    
    @StateObject var viewModel: ViewModel
    
    var transactionTypePicker: some View {
        Picker("", selection: $viewModel.transactionType) {
            ForEach(AddTransactionModels.TransactionType.allCases, id: \.self) { type in
                Text("\(type.rawValue)")
            }
        }
        .pickerStyle(.segmented)
    }
    
    var moreOptionsButton: some View {
        Button {
            viewModel.toggleKeyboard.toggle()
        } label: {
            Text("\(viewModel.toggleKeyboard ? "+" : "-") options")
                .primaryXL()
        }
    }
    
    var body: some View {
        HStack {
            Text(viewModel.displayValue)
                .primaryXXL()
                .minimumScaleFactor(0.01)
                .lineLimit(1)
            
            Spacer()
            
            Text(viewModel.displayText)
                .foregroundColor(viewModel.displayColor)
                .font(.system(size: 30, weight: .medium))
                .lineLimit(1)
                .minimumScaleFactor(1)
        }
        
        HStack {
            moreOptionsButton
            
            Spacer()
            
            Text(viewModel.account.name)
                .foregroundColor(viewModel.accountColor)
                .font(.system(size: 30, weight: .medium))
                .lineLimit(1)
            
        }.padding(.vertical, 4)
        
        transactionTypePicker
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
