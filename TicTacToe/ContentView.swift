//
//  ContentView.swift
//  TicTacToe
//
//  Created by Xaver Gruber on 18.11.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Path { path in
            //horizontal lines
            path.move(to: CGPoint(x: 50, y: 300))
            path.addLine(to: CGPoint(x: 350, y: 300))
            path.move(to: CGPoint(x: 50, y: 400))
            path.addLine(to: CGPoint(x: 350, y: 400))
            //rect.size.height
            //vertical lines
            path.move(to: CGPoint(x: 150, y: 200))
            path.addLine(to: CGPoint(x: 150, y: 500))
            path.move(to: CGPoint(x: 250, y: 200))
            path.addLine(to: CGPoint(x: 250, y: 500))
            path.closeSubpath()

        }
        .stroke(.blue, lineWidth: 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



