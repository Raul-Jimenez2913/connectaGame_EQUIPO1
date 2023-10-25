//
//  ViewController.swift
//  connectaGame_E1
//
//  Created by Administrador on 24/10/23.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
     
    @IBOutlet weak var turnImage: UIImageView!
    
    var redScore = 0
    var yellowScore = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetBoard()
        setCellWidthHeight()
    }
    
    func setCellWidthHeight() {
        let width = collectionView.frame.size.width / 9
        let height = collectionView.frame.size.height / 6
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: width, height: height)
    }
    
    func numberOfSections(in cv: UICollectionView) -> Int {
        return board.count
    }
    func collectionView(_ cv: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return board[section].count
    }

    func collectionView(_ cv: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cv.dequeueReusableCell(withReuseIdentifier: "idCell" , for: indexPath) as! BoardCell
        let boardItem = getBoardItem(indexPath)
        cell.image.tintColor = boardItem.tileColor()
        return cell
    }
    
    
    func collectionView(_ cv: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let column = indexPath.item
        if var boardItem = getLowestEmptyBoardItem (column){
            if let cell = collectionView.cellForItem(at: boardItem.indexPath) as? BoardCell{
                cell.image.tintColor = currentTurnColor()
                boardItem.tile = currentTurnTile()
                updateBoardWithBoardItem(boardItem)
                
                if victoryAchieved()
                {
                    if yellowTurn(){
                        yellowScore += 1
                    }
                    
                    if redTurn(){
                        redScore += 1
                    }
                    resultAlert(currentTurnMensajeVictoria())
                }
                
                if boardIsFull(){
                    resultAlert("Dibuja")
                }
                toggleTurn(turnImage)
            }
        }
    }
    
    func resultAlert(_ title: String)
    {
        let message = "\nGreen: " + String(redScore) + "\nYellow:  " + String(yellowScore)
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        ac.addAction (UIAlertAction(title: "Reset", style: .default, handler: {  [self] (_) in 
            resetBoard()
            self.resetCells()
        }))
        self.present (ac, animated: true)
    }
    
    func resetCells(){
        for cell in collectionView.visibleCells as!  [BoardCell]{
            cell.image.tintColor = .white
        }
    }
    
}

