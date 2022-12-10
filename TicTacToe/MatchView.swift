//
//  ImproveAdaptiveGrid.swift
//  TicTacToe
//
//  Created by Xaver Gruber on 22.11.22.
//

import SwiftUI

struct MatchView: View {
    var body: some View {
        let gridLength = UIScreen.main.bounds.width*0.9
        let squareLength = gridLength/3
        ZStack {
            GridLayout(desiredwidth: gridLength)
            MyNewSquareFields(desiredSquareLength: squareLength, viewModel: matchViewModel)
        }.frame(width: gridLength, height: gridLength)
    }
}


struct MyNewSquareFields: View {
    let desiredSquareLength: CGFloat
    @StateObject var viewModel: MatchViewModel
    @State private var showCircle = false
    @State private var showCross = false
    
    var body: some View {
        let itemsInSquareLength = desiredSquareLength*0.7
        let gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
        let mycolor = Color.orange
        LazyVGrid(columns: gridItemLayout, spacing: 0){
            ForEach(0..<9){ square in
            //for squareState in testView.squares{
                //var x = $0
                ZStack(){Text("Test")
                    switch viewModel.squares[square]{
                    case .circle:
                        Circle().stroke(.blue, lineWidth: 10).frame(width: itemsInSquareLength, height: itemsInSquareLength)
                    case .cross:
                        Cross(itemsize: itemsInSquareLength )
                    case .empty:
                        var l=5
                    }
                    //TODO: create function for switchstate and kick out dummy var in .empty state
                

                }
                .frame(width: desiredSquareLength, height: desiredSquareLength)
                    .onTapGesture {print("hi from square \(square)")
                        changeOneToCircle()
                        if viewModel.isMatchLive{
                            //print("okay")
                            reactToSquareTouch(square: square)
                        }
                        
                    }
                    //.background(mycolor)
            
            }
        }
    }
}





struct improveAdaptiveGrid_Previews: PreviewProvider {
    static var previews: some View {
        MatchView()
    }
}


struct GridLayout: View {
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



struct Cross: View {
    let itemsize: CGFloat
    var body: some View {

    let leftUpCorner = CGPoint(x: 0, y: 0)
    let rightDownCorner = CGPoint(x: itemsize, y: itemsize)
    let rightUpCorner = CGPoint(x: 0, y: itemsize)
    let leftDownCorner = CGPoint(x: itemsize, y: 0)
        ZStack{
            Path { path in
                path.move(to: leftUpCorner)
                path.addLine(to: rightDownCorner)
                path.move(to: rightUpCorner)
                path.addLine(to: leftDownCorner)

                path.closeSubpath()
            }.stroke(.blue, lineWidth: 10)
        
        }.frame(width: itemsize, height: itemsize)
    }
}
