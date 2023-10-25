//
//  Turn.swift
//  connectaGame_E1
//
//  Created by Administrador on 24/10/23.
//

import Foundation
import UIKit

enum Turn{
    case Green
    case Yellow
    
}

var currentTurn = Turn.Yellow

func toggleTurn(_ turnImage: UIImageView){
    if yellowTurn(){
        currentTurn = Turn.Green
        turnImage.tintColor = .green
    }
    else{
        currentTurn  = Turn.Yellow
        turnImage.tintColor =  .systemYellow
    }
}

func yellowTurn () -> Bool {
    return currentTurn == Turn.Yellow
}



func redTurn () -> Bool {
    return currentTurn == Turn.Green
}


func currentTurnTile() -> Tile{
    return yellowTurn() ? Tile.Yellow : Tile.Green
}

func currentTurnColor () -> UIColor {
    return yellowTurn() ? .systemYellow : .green
}

func currentTurnMensajeVictoria () -> String {
    return yellowTurn() ? "Amarillo ganador" : "Verde ganador"
}
