import UIKit

protocol HomeDelegate {
    func solveMathProblems()
}

class MathMaster {
    var delegate: HomeDelegate?
    
    func didHomework() {
        self.delegate?.solveMathProblems()
    }
}

class Me: HomeDelegate {
    
    var harry = MathMaster()
    
    func askForHelp() {
        self.harry.delegate = self
        self.harry.didHomework()
    }
    
    func solveMathProblems() {
        print("숙제가 완료되었습니다.")
    }
    
}

var atlas = Me()
atlas.askForHelp()



