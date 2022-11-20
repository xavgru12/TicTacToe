//
//  AdaptiveGrid.swift
//  TicTacToe
//
//  Created by Xaver Gruber on 19.11.22.
//

import SwiftUI

struct myGrid: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(){
                    let w = geometry.size.width*0.8
                    let oneThird = geometry.size.width*0.8/3
                    //Text("value: \(geometry.frame(in: .local).maxX)")
                    
                    
                    let myposition = CGPoint(x: geometry.frame(in: .local).minX, y: geometry.frame(in: .local).minY + oneThird)
                    let myhorizontal = CGPoint(x: geometry.frame(in: .local).minX, y: geometry.frame(in: .local).minY + 2*oneThird)
                    let myfirstvertical = CGPoint(x: geometry.frame(in: .local).minX + oneThird, y: geometry.frame(in: .local).minY )
                    let mysecondvertical = CGPoint(x: geometry.frame(in: .local).minX + 2*oneThird, y: geometry.frame(in: .local).minY )
     
                    
                    let myotherposition = CGPoint(x: geometry.frame(in: .local).maxX*0.8, y: geometry.frame(in: .local).minY + oneThird)
                    let myotherhorizontal = CGPoint(x: geometry.frame(in: .local).maxX*0.8, y: geometry.frame(in: .local).minY + 2*oneThird)
                    
                    let myfirstothervertical = CGPoint(x: geometry.frame(in: .local).minX + oneThird, y: geometry.frame(in: .local).minY+w )
                    
                    let mysecondothervertical = CGPoint(x: geometry.frame(in: .local).minX + 2*oneThird, y: geometry.frame(in: .local).minY+w )
                    
             
                    Path { path in
                        path.move(to: myposition)
                        path.addLine(to: myotherposition)
                        path.move(to: myhorizontal)
                        path.addLine(to: myotherhorizontal)
                        
                        path.move(to: myfirstvertical)
                        path.addLine(to: myfirstothervertical)
                        path.move(to: mysecondvertical)
                        path.addLine(to: mysecondothervertical)
                    }.stroke(.blue, lineWidth: 10)
//
                }.frame(width: geometry.size.width*0.8, height:geometry.size.width*0.8 )
                    .background(Color.green)
                    .coordinateSpace(name: "Custom")
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            Text("outside Box: \(geometry.size.width)")
        }
       
    }
}

//critical bug in this implementation:
//idea was to to put a frame on one stack, so in the inner stack the frame is set correctly, it doesnt work, minX and maxX still has parent frame. Outer view should give sizes of frame to inner view


struct myGrid_Previews: PreviewProvider {
    static var previews: some View {
        myGrid()
    }
}

//how to use this GeometryReaderCentered?
struct GeometryReaderCentered<Content: View>: View {
    var content: (GeometryProxy) -> Content

    var body: some View {
        GeometryReader { geometry in
            Group {
                content(geometry)
            }
            .frame(
                width: geometry.size.width,
                height: geometry.size.height,
                alignment: .center
            )
        }
    }
}
