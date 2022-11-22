//
//  ImproveAdaptiveGrid.swift
//  TicTacToe
//
//  Created by Xaver Gruber on 22.11.22.
//

import SwiftUI

struct improveAdaptiveGrid: View {
    @State private var width: CGFloat = 50
    var body: some View {
        VStack {
            let gridWidth = UIScreen.main.bounds.width*0.9
            TicTacToeGrid(desiredwidth: gridWidth)
            
        }
    }
}


struct improveAdaptiveGrid_Previews: PreviewProvider {
    static var previews: some View {
        improveAdaptiveGrid()
    }
}


struct TicTacToeGrid: View {
    let desiredwidth: CGFloat
    var body: some View {
        ZStack{
            let oneThirdOfWidth = desiredwidth/3
            
            let firsthorizontalMove = CGPoint(x: 0, y: oneThirdOfWidth)
            let firsthorizontalAdd = CGPoint(x: desiredwidth, y: oneThirdOfWidth)
            let secondHorizontalMove = CGPoint(x: 0, y: 2*oneThirdOfWidth)
            let secondhorizontalAdd = CGPoint(x: desiredwidth, y: 2*oneThirdOfWidth)
            
            let firstVerticalMove = CGPoint(x: oneThirdOfWidth, y: 0)
            let firstVerticalAdd = CGPoint(x: oneThirdOfWidth, y: desiredwidth)
            let secondVerticalMove = CGPoint(x: 2*oneThirdOfWidth, y: 0)
            let secondVerticalAdd = CGPoint(x: 2*oneThirdOfWidth, y: desiredwidth)
            
            Path { path in
                path.move(to: firsthorizontalMove)
                path.addLine(to: firsthorizontalAdd)
                path.move(to: secondHorizontalMove)
                path.addLine(to: secondhorizontalAdd)
                
                path.move(to: firstVerticalMove)
                path.addLine(to: firstVerticalAdd)
                path.move(to: secondVerticalMove)
                path.addLine(to: secondVerticalAdd)
                
                path.closeSubpath()
            }.stroke(.blue, lineWidth: 10)

         }.frame(width: desiredwidth, height: desiredwidth)
            
    }
}
