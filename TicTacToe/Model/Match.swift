//
//  Match.swift
//  TicTacToe
//
//  Created by Xaver Gruber on 10.12.22.
//

import Foundation

enum PlayerTurn{
    case playerOne
    case playerTwo
}

func matchReactToSquareTouch(square: Int){
    match.reactToSquareTouch(square: square)
}
var match=Match()

class Match{
    
    var playerTurn: PlayerTurn = .playerOne
    var isMatchLive: Bool = true
    var publisher: MatchViewModel
    
    init(){
        publisher = matchViewModel
    }
    
    func checkForEndMatch(){
        if checkForWin() != nil{
            return 
        }
        if checkForTie(){
            publisher.infoText = "It's a tie!"
            print("It's a tie!")
        }
    }
    
    func switchPlayerTurn(){
        if playerTurn == .playerOne{
            playerTurn = .playerTwo
            publisher.infoText = "Next turn: X"
        }
        else{
            playerTurn = .playerOne
            publisher.infoText = "Next turn: O"
        }
    }
    
    func checkForWin() -> PlayerTurn?{
        if checkForWinOf(player: .playerOne){
            publisher.isMatchLive = false
            print("O won!")
            publisher.infoText = "O won! 🎉"
            return .playerOne
        }
        if checkForWinOf(player: .playerTwo){
            print("X won!")
            publisher.infoText = "X won! 🎉"
            publisher.isMatchLive = false
            return .playerTwo
        }
    //012  winner is: 012, 345, 678, 036, 147, 258, 048, 246
    //345
    //678
        return nil
    }
    
    func checkForWinOf(player: PlayerTurn) -> Bool{
        var item: SquareState
        if player == .playerOne{
            item = .circle
        }
        else{
            item = .cross
        }
        
        //horizontal
        if publisher.squares[0] == item && publisher.squares[1] == item && publisher.squares[2] == item{
            return true
        }
        if publisher.squares[3] == item && publisher.squares[4] == item && publisher.squares[5] == item{
            return true
        }
        if publisher.squares[6] == item && publisher.squares[7] == item && publisher.squares[8] == item{
            return true
        }
        
        //vertical
        if publisher.squares[0] == item && publisher.squares[3] == item && publisher.squares[6] == item{
            return true
        }
        if publisher.squares[1] == item && publisher.squares[4] == item && publisher.squares[7] == item{
            return true
        }
        if publisher.squares[2] == item && publisher.squares[5] == item && publisher.squares[8] == item{
            return true
        }
        
        //diagonal
        if publisher.squares[0] == item && publisher.squares[4] == item && publisher.squares[8] == item{
            return true
        }
        if publisher.squares[2] == item && publisher.squares[4] == item && publisher.squares[6] == item{
            return true
        }
        return false
    }
    
    func checkForTie() -> Bool{
        for square in publisher.squares{
            if square == .empty{
                return false
            }
        }
        publisher.isMatchLive = false
        return true
    }
    
    func setItemInSquare(square: Int) {

        
        if playerTurn == .playerOne{
            publisher.squares[square] = .circle
        }
        else{
            publisher.squares[square] = .cross
        }
        
    }
    
    func reactToSquareTouch(square: Int){
        setItemInSquare(square: square)
        switchPlayerTurn()
        checkForEndMatch()
        
    }
}
