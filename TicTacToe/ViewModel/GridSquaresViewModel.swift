//
//  GridSquaresViewModel.swift
//  TicTacToe
//
//  Created by Xaver Gruber on 28.11.22.
//

import Foundation
import SwiftUI //only imported for quick testing

enum SquareState {
    case circle
    case cross
    case empty
}


struct SquareTestView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{}
    }
}

class MyObservableView: ObservableObject{
        @Published var squares: [SquareState] = [
            .empty, .empty, .empty,
            .circle, .empty, .cross,
            .empty, .empty, .empty]
}


var myview=MyObservableView()
func changeOneToCircle(){
    myview.squares[1] = .circle
}



