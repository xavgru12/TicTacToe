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

private class SquareStateViewModel: ObservableObject {
    @Published var squares: [SquareState] = [.circle, .empty, .cross, .circle]
    //squares.append(.circle)
}

struct SquareTestView: View {
  @StateObject fileprivate var viewModel = SquareStateViewModel()
  var body: some View {
      ZStack{
          Text("\(viewModel.squares[0])" as String)
      }
  }
}


struct SquareTestView_Previews: PreviewProvider {
    static var previews: some View {
        SquareTestView()
    }
}
