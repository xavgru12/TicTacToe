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

//first test of viewmodel,
//seems like published squares array cannot be changed? let us find out

class SquareStateViewModel: ObservableObject {
    //@Published var squares: [SquareState] = [.circle, .empty, .cross, .circle]
    //squares.append(.circle)
    var testvariable=3
}

//struct SquareTestView: View {
//  var body: some View {
//      ZStack{
//          Text("\(viewModel.squares[0])" as String)
//      }
//  }
//}

//fileprivate func fillUI(){
//    self.viewSquares = viewModel.squares
//}


struct SquareTestView_Previews: PreviewProvider {
    static var previews: some View {
        //SquareTestView()
        ZStack{}
    }
}

extension MyNewSquareFields {
    @MainActor class TestView: ObservableObject{
        @Published var squares: [SquareState] = [
            .empty, .empty, .empty,
            .circle, .empty, .cross,
            .empty, .empty, .empty,]
    }
}
