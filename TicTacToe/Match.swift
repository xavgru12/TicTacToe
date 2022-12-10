//
//  Match.swift
//  TicTacToe
//
//  Created by Xaver Gruber on 10.12.22.
//

import Foundation

func reactToSquareTouch(square: Int){
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
        checkForWin()
        if checkForTie(){
            publisher.infoText = "It's a tie!"
            print("It's a tie!")
        }
    }
    
    func switchPlayerTurn(){
        if playerTurn == .playerOne{
            playerTurn = .playerTwo
        }
        else{
            playerTurn = .playerOne
        }
    }
    
    func checkForWin(){
        
    //012  winner is: 012, 345, 678, 036, 147, 258, 048
    //345
    //678
    }
    
    func checkForTie() -> Bool{
        for square in publisher.squares{
            if square == .empty{
                return false
            }
        }
        return true
    }
    
    func setItemInSquare(square: Int) -> Bool{
        if publisher.squares[square] != .empty{
            return false
        }
        
        if playerTurn == .playerOne{
            publisher.squares[square] = .circle
        }
        else{
            publisher.squares[square] = .cross
        }
        return true
    }
    
    func reactToSquareTouch(square: Int){
    //var itemIsSet: Bool
        //print("about to set to circle")
        //publisher.squares[square] = .circle
        var itemIsSet: Bool = setItemInSquare(square: square)
        if itemIsSet{
            //print("done setting item")
            switchPlayerTurn()
            checkForEndMatch()
        }
    }
}

//switchPlayerTurn

enum PlayerTurn{
    case playerOne
    case playerTwo
}
