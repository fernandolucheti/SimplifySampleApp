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
    
    private struct Line<Content: View>: View {
        var content: () -> Content
        
        init(@ViewBuilder content: @escaping () -> Content) {
            self.content = content
        }
        var body: some View {
            VStack(spacing: 0) {
                HStack {
                    content()
                }
                Color.gray.frame(width: .infinity, height: 1)
                    .padding(.bottom, 25)
                    .padding(.top, 4)
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            Line {
                Text("name: ")
                    .font(.system(size: 30))
                    .foregroundColor(.gray)
                    .disableAutocorrection(true)
                TextField("name", text: $expenseName)
                    .font(.system(size: 30))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.trailing)
            }.padding(.top, 24)
            
            Line {
                Text("paid: ")
                    .font(.system(size: 30))
                    .foregroundColor(.gray)
                Toggle("", isOn: $paid)
            }
            
            Line {
                Text("date: ")
                    .font(.system(size: 30))
                    .foregroundColor(.gray)
                Spacer()
                DatePicker("Day",
                           selection: $date,
                           displayedComponents: [.date])
                .labelsHidden()
                .id(calendarId)
                .onChange(of: date)
                { _ in calendarId = UUID() }
            }
            
            Line {
                Text("monthly: ")
                    .font(.system(size: 30))
                    .foregroundColor(.gray)
                Toggle("", isOn: $monthly)
            }
            Line {
                HStack {
                    Text("installments: ")
                        .font(.system(size: 30))
                        .foregroundColor(.gray)
                        .lineLimit(1)
                    Spacer()
                    TextField("1", text: $installments)
                        .font(.system(size: 30))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.trailing)
                        .frame(width: 70, height: 40)
                        .keyboardType(.numberPad)
                    Text("x")
                        .font(.system(size: 30))
                        .foregroundColor(.gray)
                        .lineLimit(1)
                }
            }
            Spacer()
        }
    }
}

struct MoreOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        MoreOptionsView().padding(24)
    }
}
