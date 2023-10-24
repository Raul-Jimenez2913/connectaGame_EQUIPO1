//
//  Board.swift
//  connectaGame_E1
//
//  Created by Administrador on 24/10/23.
//

import Foundation
import UIKit

var board = [[BoardItem]]()

func resetBoard() {
    board.removeAll()
    for row in 0...5 {
        var rowArray = [BoardItem]()
        for column in 0...6 {
            let indexPath = IndexPath.init(item: column, section: row)
            let boardItem = BoardItem(indexPath: indexPath, tile: Tile.Empty)
            rowArray.append(boardItem)
        }
    }
}
