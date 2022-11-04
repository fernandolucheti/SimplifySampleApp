//
//  MoreOptionsView.swift
//  demonstration
//
//  Created by Fernando Lucheti on 02/11/22.
//

import SwiftUI

struct MoreOptionsView: View {
    
    @State var expenseName = ""
    @State var paid = true
    @State var date = Date()
    @State var calendarId: UUID = UUID()
    @State var monthly = false
    @State var installments = ""
    
    private var datePicker: some View {
        DatePicker("Day",
                   selection: $date,
                   displayedComponents: [.date])
        .labelsHidden()
        .id(calendarId)
        .onChange(of: date)
        { _ in calendarId = UUID() }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            Line {
                Text("name: ")
                    .primaryXL()
                    .disableAutocorrection(true)
                TextField("name", text: $expenseName)
                    .primaryXL()
                    .multilineTextAlignment(.trailing)
            }.padding(.top, 24)
            
            Line {
                Text("paid: ")
                    .primaryXL()
                Toggle("", isOn: $paid)
            }
            Line {
                Text("date: ")
                    .primaryXL()
                Spacer()
                datePicker
            }
            Line {
                Text("monthly: ")
                    .primaryXL()
                Toggle("", isOn: $monthly)
            }
            Line {
                HStack {
                    Text("installments: ")
                        .primaryXL()
                        .lineLimit(1)
                    Spacer()
                    TextField("1", text: $installments)
                        .primaryXL()
                        .multilineTextAlignment(.trailing)
                        .frame(width: 70)
                        .keyboardType(.numberPad)
                    Text("x")
                        .primaryXL()
                        .lineLimit(1)
                }
            }
            Spacer()
        }
    }
}

fileprivate struct Line<Content: View>: View {
    var content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                content()
            }
            Color.gray
                .frame(height: 1)
                .padding(.top, 4)
                .padding(.bottom, 25)
        }
    }
}

struct MoreOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        MoreOptionsView().padding(24)
    }
}
