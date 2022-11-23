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
        let trial = UIScreen.main.bounds.width*0.9
        ZStack {
            let gridWidth = UIScreen.main.bounds.width*0.9
            TicTacToeGrid(desiredwidth: gridWidth)
            VStack(spacing: 0){
                HStack(spacing: 0){
                    HStack(spacing: 0){}
                    .frame(width: trial/3, height: trial/3)
                        .background(Color.black)
                        .onTapGesture {
                            print("UpLeft")
                        }
                    HStack{}.frame(width: trial/3, height: trial/3)
                        .background(Color.purple)
                    HStack{}.frame(width: trial/3, height: trial/3)
                        .background(Color.orange)
                    
                }//.frame(width: trial, height: trial/3)
                
                HStack(spacing: 0){
                    HStack{}.frame(width: trial/3, height: trial/3)
                        .background(Color.white)
                    HStack{}.frame(width: trial/3, height: trial/3)
                        .background(Color.pink)
                    HStack{}.frame(width: trial/3, height: trial/3)
                        .background(Color.yellow)
                    
                    
                }//.frame(width: trial, height: trial/3)
                    //.background(Color.black)
                HStack(spacing: 0){
                    HStack{}.frame(width: trial/3, height: trial/3)
                        .background(Color.red)
                    HStack{}.frame(width: trial/3, height: trial/3)
                        .background(Color.blue)
                    HStack{}.frame(width: trial/3, height: trial/3)
                        .background(Color.green)
                }//.frame(width: trial, height: trial/3)
                    //.background(Color.black)
            
                
        }.frame(width: trial, height: trial)
            
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
