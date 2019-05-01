class Game {
    
    private var rolls = [Int](repeating: 0, count: 21)
    
    private var currentRoll = 0
    
    func roll(_ pins: Int) {
        
        rolls[currentRoll] = pins
        
        currentRoll += 1
        
    }
    
    func score() -> Int {
        
        var score = 0
        
        var roll = 0
        
        for _ in 1...10 {
            
            if isStrike(roll) {
                
                score += 10 + strikeBonus(roll)
                
                roll += 1
                
            } else if isSpare(roll) {
                
                score += 10 + spareBonus(roll)
                
                roll += 2
                
            } else {
                
                score += sumOfBallsInFrame(roll)
                
                roll += 2
                
            }
        }
        
        return score
        
    }
    
    private func isStrike(_ roll: Int) -> Bool {
        
        return rolls[roll] == 10
        
    }
    
    private func isSpare(_ roll: Int) -> Bool {
        
        return rolls[roll] + rolls[roll + 1] == 10
        
    }
    
    private func strikeBonus(_ roll: Int) -> Int {
        
        return rolls[roll + 1] + rolls[roll + 2]
        
    }
    
    private func spareBonus(_ roll: Int) -> Int {
        
        return rolls[roll + 2]
        
    }
    
    private func sumOfBallsInFrame(_ roll: Int) -> Int {
        
        return rolls[roll] + rolls[roll + 1]
        
    }
    
}
