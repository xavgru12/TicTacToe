//
//  GridSquaresViewModel.swift
//  TicTacToe
//
//  Created by Xaver Gruber on 28.11.22.
//

import Foundation

enum SquareState {
    case circle
    case cross
    case empty
}

class MatchViewModel: ObservableObject{
    @Published var squares: [SquareState]
    @Published var isMatchLive: Bool
    @Published var infoText: String
    
    init(){
        isMatchLive = true
        infoText = ""
        squares = [
            .empty, .empty, .empty,
            .empty, .empty, .empty,
            .empty, .empty, .empty]
    }
    func reactToSquareTouch(square: Int){
        if squares[square] == .empty && isMatchLive{
            matchReactToSquareTouch(square: square)
        }
    }
    func newMatch(){

        isMatchLive = true
        infoText = ""
        
        for square in squares.indices {
            squares[square] = .empty
      
        }
    }
}


var matchViewModel=MatchViewModel()




