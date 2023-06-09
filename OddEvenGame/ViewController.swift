//
//  ViewController.swift
//  OddEvenGame
//
//  Created by YANJU1CY 🇰🇷 on 2023/06/08.
//

/**
 1. 컴퓨터가 1에서 10까지의 랜덤으로 숫자를 선택한다.
 2. 사용자는 가진 구슬 개수를 걸고 홀짝 중의 하나를 선택한다.
 3. 결과값이 화면에 보여진다.
 */

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var computerBallCountLbl: UILabel!
    @IBOutlet weak var userBallCountLbl: UILabel!
    @IBOutlet weak var resultLbl: UILabel!
    
    var comBallsCount: Int = 20
    var userBallsCount: Int = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        computerBallCountLbl.text = String(comBallsCount)
        userBallCountLbl.text = String(userBallsCount)
        
    }

    @IBAction func gameStartPressed(_ sender: Any) {
        print("게임시작! ")
        
        let alert = UIAlertController.init(title: "GAME START", message: "홀 짝을 선택해주세요.", preferredStyle: .alert)
        
        let oddBtn = UIAlertAction.init(title: "홀", style: .default) { _ in
            print("홀 버튼을 클릭했습니다.")
            guard let input = alert.textFields?.first?.text, let value = Int(input) else {
                return
            }
            self.getWinner(count: value, select: "홀")
        }
        
        let evenBtn = UIAlertAction.init(title: "짝", style: .default) { _ in
            print("짝 버튼을 클릭했습니다.")
            guard let input = alert.textFields?.first?.text, let value = Int(input) else {
                return
            }
            
            self.getWinner(count: value, select: "짝")
        }
        
        alert.addTextField { textField in
            textField.placeholder = "배팅할 구슬의 개수를 입력해주세요."
        }
            
        alert.addAction(oddBtn)
        alert.addAction(evenBtn)
        
        self.present(alert, animated: true) {
            print("화면이 띄워졌습니다.")
        }
    }
    
    func getRandom() -> Int {
        return Int(arc4random_uniform(10)) + 1
    }
    
    func getWinner(count: Int, select: String) {
        let com = self.getRandom();
        print("컴퓨터 숫자 " + String(com))
        let comType = com % 2 == 0 ? "짝" : "홀"
        
        var result = comType
        if comType == select {
            result += " User win"
            self.calculateBalls(winner: "user", count: count)
        } else {
            result += "Computer win"
            self.calculateBalls(winner: "com", count: count)
        }
        
        self.resultLbl.text = result
    }
    
    func calculateBalls(winner: String, count: Int) {
        if winner == "com" {
            self.userBallsCount -= count
            self.comBallsCount += count
        } else {
            self.userBallsCount += count
            self.comBallsCount -= count
        }
        
        self.userBallCountLbl.text = "\(self.userBallsCount)"
        self.computerBallCountLbl.text = "\(self.comBallsCount)"
    }

}

