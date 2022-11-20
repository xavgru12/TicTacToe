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
                    Text("Hi")
                }.frame(width: geometry.size.width*0.8 )
                    .background(Color.green)
                
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }
    }
}

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
