//
//  ImproveAdaptiveGrid.swift
//  TicTacToe
//
//  Created by Xaver Gruber on 22.11.22.
//

import SwiftUI

struct MatchView: View {
    @State private var width: CGFloat = 50
    var body: some View {
        let gridLength = UIScreen.main.bounds.width*0.9
        let squareLength = gridLength/3
        let itemsLength = squareLength*0.7
        ZStack {
            GridLayout(desiredwidth: gridLength)
            MyNewSquareFields(desiredSquareLength: squareLength, itemsInSquareLength: itemsLength)
//            GridTouchSquareFields(desiredSquareLength: squareLength, itemsInSquareLength: itemsLength)
        }.frame(width: gridLength, height: gridLength)
    }
}

struct MyNewSquareFields: View {
    let desiredSquareLength: CGFloat
    let itemsInSquareLength: CGFloat
//    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        let gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
        let mycolor = Color.orange
        LazyVGrid(columns: gridItemLayout, spacing: 0){
            ForEach((0...8), id: \.self){
                var x = $0
                ZStack(){Text("Test")
                    if x == 0{
                        //print("okay!")
//                        .contentShape(Rectangle())
//                        Rectangle().background(Color.green) //.frame(width: nil, height: nil)
                        Rectangle().fill(.clear).contentShape(Rectangle())
                        .onTapGesture {print("hi from red")}
                        //Color.red
                            
                    }
                    if x == 1{
                        Color.blue
                    }
                    if x == 7{
                        Color.green
                    }
                }
                .frame(width: desiredSquareLength, height: desiredSquareLength)
                .onTapGesture {print("hi from square")}
                .background(mycolor)
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


                    
struct GridTouchSquareFields: View {
    let desiredSquareLength: CGFloat
    @State private var showIt = false
    let itemsInSquareLength: CGFloat //use everywhere for inner Stack width and length
    var body: some View {
        VStack(spacing: 0){
            HStack(spacing: 0){
                HStack(spacing: 0){
                    if showIt{
                        Circle().stroke(.blue, lineWidth: 10).frame(width: desiredSquareLength*0.7, height: desiredSquareLength*0.7)
                    }
                
                }
                .frame(width: desiredSquareLength, height: desiredSquareLength)
                .contentShape(Rectangle())
                .onTapGesture {
                    print("Show details for user")
                    showIt.toggle()
                }
                
                HStack{
                    if showIt{
                        Circle().stroke(.blue, lineWidth: 10).frame(width: desiredSquareLength*0.7, height: desiredSquareLength*0.7)
                    }
                }.frame(width: desiredSquareLength, height: desiredSquareLength)
                    //.background(Color.red)
                HStack{}.frame(width: desiredSquareLength, height: desiredSquareLength)
                    .background(Color.orange)
            }
            
            HStack(spacing: 0){
                HStack{
                    if showIt{
                        Circle().stroke(.blue, lineWidth: 10).frame(width: desiredSquareLength*0.7, height: desiredSquareLength*0.7)
                    }
                }.frame(width: desiredSquareLength, height: desiredSquareLength)
                    //.background(Color.white)
                HStack{
                    ItemsInSquare(itemsize: desiredSquareLength*0.7)
                    
                }.frame(width: desiredSquareLength, height: desiredSquareLength)
                    //.background(Color.pink)
                HStack{}.frame(width: desiredSquareLength, height: desiredSquareLength)
                    .background(Color.yellow)
            }
            
            HStack(spacing: 0){
                HStack{}.frame(width: desiredSquareLength, height: desiredSquareLength)
                    .background(Color.red)
                HStack{}.frame(width: desiredSquareLength, height: desiredSquareLength)
                    .background(Color.blue)
                HStack{}.frame(width: desiredSquareLength, height: desiredSquareLength)
                    .background(Color.green)
            }
        }
    }
}
//create a view called Square, put that Hstack in with the view Circle and the cross

//var drag: some Gesture {
//    DragGesture(coordinateSpace: .named("Custom"))
//        .onTapGesture {
//                                print("Text tapped")
//                            }
//}

//var tap: some Gesture {
//    TapGesture(count: 1, coordinateSpace: .named("Custom"))
//        .onEnded { print("Text tapped") }
//}

//struct TestTap: View {
//    var body: some View {
//        frame(in: .named("Custom")
//                        .onTapGesture {
//                                print("Text tapped")
//                            }
//
//    }
//}

struct ItemsInSquare: View {
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
        
//        Rectangle{
//            Circle()
//        }.frame(width: itemsize, height: itemsize)
//    Path { path in
//        path.move(to: leftUpCorner)
//        path.addLine(to: RighDownCorner)
//
//        path.closeSubpath()
//    }.stroke(.blue, lineWidth: 10)
    //Circle()
}
}
