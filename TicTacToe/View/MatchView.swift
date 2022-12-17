//
//  MatchView.swift
//  TicTacToe
//
//  Created by Xaver Gruber on 22.11.22.
//

import SwiftUI

struct MatchView: View {
    @State private var changeButtonColour = true
    @StateObject var viewModel: MatchViewModel
    var body: some View {
        let gridLength = UIScreen.main.bounds.width*0.9
        let squareLength = gridLength/3
        ZStack{
            Color(hex: 0x252525)
            
            VStack(spacing: 50){
                
                Text(viewModel.infoText).font(.system(size: 35, weight: .light, design: .serif)).foregroundColor(.blue)
                
                ZStack{
                    GridLayout(desiredwidth: gridLength)
                    SquaresInGrid(desiredSquareLength: squareLength, viewModel: viewModel)
                }.frame(width: gridLength, height: gridLength)
      
                Button(action: viewModel.newMatch){
                    if !viewModel.isMatchLive{
                    Text("new match").fontWeight(.bold).font(.title).foregroundColor(.blue)      .padding(12).overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.blue, lineWidth: 5)
                    )}
                }
            
            }
        }.edgesIgnoringSafeArea(.all)
    }
}


struct SquaresInGrid: View {
    let desiredSquareLength: CGFloat
    @StateObject var viewModel: MatchViewModel
    
    var body: some View {
   
        let gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
        LazyVGrid(columns: gridItemLayout, spacing: 0){
            ForEach(0..<9){ square in
                SquareStateView(squareNumber: square, squareLength: desiredSquareLength, viewModel: viewModel)
            }
        }
    }
}


struct SquareStateView: View {
    var squareNumber: Int
    let squareLength: CGFloat
    @StateObject var viewModel: MatchViewModel
    var body: some View {
        let lengthOfItemsInSquare = squareLength*0.6

        ZStack(){
            showSquareState(squareState: viewModel.squares[squareNumber], length: lengthOfItemsInSquare)
        }.frame(width: squareLength, height: squareLength)
         .contentShape(Rectangle())
         .onTapGesture {
             print("hi from square \(squareNumber)")
             viewModel.reactToSquareTouch(square: squareNumber)
          }
    }
}


func showSquareState(squareState: SquareState, length: CGFloat) -> some View{
    Group{
        switch squareState{
        case .circle:
            Circle().stroke(.blue, lineWidth: 8).frame(width: length, height: length)
        case .cross:
            Cross(itemsize: length )
        case .empty:
            EmptyView()
        }
            
    }
}




struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        MatchView(viewModel: matchViewModel)
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
            }.stroke(.blue, lineWidth: 8)
        
        }.frame(width: itemsize, height: itemsize)
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
} //252525
