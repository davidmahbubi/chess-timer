//
//  TimerView.swift
//  Chess Timer
//
//  Created by David Mahbubi on 02/09/23.
//

import SwiftUI

struct TimerView: View {
    
    @State var firstTimerRunning: Bool = true
    @State var secondTimerRunning: Bool = false
    
    @Binding var minutes: String
    
    @State var firstTimerElapsed: Int = 0
    @State var secondTimerElapsed: Int = 0
    
    @State var isTimerFinished: Bool = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.red)
                Text("\(countTimer(of: firstTimerElapsed))")
                    .foregroundStyle(.white)
                    .font(.system(size: 80, weight: .bold, design: .rounded))
                    .scaleEffect(CGSize(width: -1.0, height: -1.0))
                    .onReceive(timer) { _ in
                        if firstTimerElapsed == (60 * Int(minutes)!) {
                            isTimerFinished = true
                            return
                        }
                        if firstTimerRunning && !isTimerFinished {
                            firstTimerElapsed += 1
                        }
                    }
            }
            .onTapGesture {
                firstTimerRunning.toggle()
                secondTimerRunning.toggle()
            }
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.green)
                Text("\(countTimer(of: secondTimerElapsed))")
                    .foregroundStyle(.white)
                    .font(.system(size: 80, weight: .bold, design: .rounded))
                    .onReceive(timer) { _ in
                        if secondTimerElapsed >= (60 * Int(minutes)!) {
                            isTimerFinished = true
                            return
                        }
                        if secondTimerRunning && !isTimerFinished {
                            secondTimerElapsed += 1
                        }
                    }
            }
            .onTapGesture {
                firstTimerRunning.toggle()
                secondTimerRunning.toggle()
            }
        }
        .padding()
    }
    
    func countTimer(of second: Int) -> String {
        
        let invertedSecond: Int = 60 * Int(minutes)! - second
        
        let min: Int = Int(floorf(Float(invertedSecond) / 60))
        let sec: Int = invertedSecond % 60
        
        return "\(min < 10 ? "0\(min)" : "\(min)"):\(sec < 10 ? "0\(sec)" : "\(sec)")"
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(minutes: .constant("10"))
    }
}
