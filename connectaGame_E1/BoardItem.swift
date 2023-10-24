//
//  BoardItem.swift
//  connectaGame_E1
//
//  Created by Administrador on 24/10/23.
//

import UIKit
import Foundation

enum Tile{
    case Red
    case Yellow
    case Empty
}

struct BoardItem {
    var indexPath: IndexPath!
    var tile: Tile!
    
    func yellowTile() -> Bool {
        return tile == Tile.Yellow
    }
    
    func redTile() -> Bool {
        return tile == Tile.Red
    }
    
    func emptyTile() -> Bool {
        return tile == Tile.Empty
    }
    
    func tileColor() -> UIColor {
        if redTile() {
            return .red
        }
        if yellowTile() {
            return .systemYellow
        }
        return .white
    }
}
