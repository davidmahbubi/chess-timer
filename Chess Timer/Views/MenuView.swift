//
//  MainMenu.swift
//  Chess Timer
//
//  Created by David Mahbubi on 02/09/23.
//

import SwiftUI

struct MenuView: View {
    
    @State var totalMinutes: String = "10"
    
    var body: some View {
        VStack {
            Text("Chess Timer")
                .font(.system(size: 40, design: .rounded))
                .fontWeight(.bold)
            Spacer()
                .frame(height: 50)
            ZStack {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .stroke(.blue, lineWidth: 3.5)
                    .frame(height: 70)
                TextField(text: $totalMinutes) {
                    Text("Total in minutes")
                }
                .keyboardType(.numberPad)
                .padding(.horizontal, 15)
            }
            .padding(.horizontal, 20)
            NavigationLink(destination: TimerView(minutes: $totalMinutes)) {
                Text("Start Timer")
                    .frame(maxWidth: .infinity)
                    .frame(height: 70)
                    .background((Int(totalMinutes) ?? 0) > 0 ? .blue : .gray)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 20)
            }
            .disabled((Int(totalMinutes) ?? 0) <= 0)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
