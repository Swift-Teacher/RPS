import Foundation

var rule = ""

func randomSign() -> Sign {
    let sign = Int.random(in: 0...4)
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else if sign == 2 {
        return .scissors
    } else if sign == 3 {
        return .lizard
    } else {
        return .spock
    }
}

enum Sign {
    case rock, paper, scissors, lizard, spock

    
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "✋"
        case .scissors:
            return "✌️"
        case .lizard:
            return "🦎"
        case .spock:
            return "🖖🏻"
        }
    }
    
    func gameState(against opponentSign: Sign) -> GameState {
        if self == opponentSign {
            rule = ""
            return .draw
        }
        
        switch self {
        case .rock:
            if opponentSign == .scissors {
                rule = "Rock crushes scissors"
                return .win
            }
            else if opponentSign == .lizard {
                rule = "Rock smashes lizard"
                return .win
            }
            else if opponentSign == .paper {
                rule = "Paper covers rock"
                return .lose
            }
            else if opponentSign == .spock {
                rule = "Spock vaporizes rock"
                return .lose
            }
        case .paper:
            if opponentSign == .rock {
                rule = "Paper covers rock"
                return .win
            }
            else if opponentSign == .spock {
                rule = "Paper disproves Spock"
                return .win
            }
            else if opponentSign == .scissors {
                rule = "Scissors cut paper"
                return .lose
            }
            else if opponentSign == .lizard {
                rule = "Lizard eats paper"
                return .lose
            }
        case .scissors:
            if opponentSign == .paper {
                rule = "Scissors cuts paper"
                return .win
            }
            else if opponentSign == .lizard {
                rule = "Scissors decapitates lizard"
                return .win
            }
            else if opponentSign == .rock {
                rule = "Rock crushes scissors"
                return .lose
            }
            else if opponentSign == .spock {
                rule = "Spock smashes scissors"
                return .lose
            }
        case .lizard:
            if opponentSign == .spock {
                rule = "Lizard poisons Spock"
                return .win
            }
            else if opponentSign == .paper {
                rule = "Lizard eats paper"
                return .win
            }
            else if opponentSign == .rock {
                rule = "Rock smashes lizard"
                return .lose
            }
            else if opponentSign == .scissors {
                rule = "Scissors decapitates lizard"
                return .lose
            }
        case .spock:
            if opponentSign == .rock {
                rule = "Spock vaporizes rock"
                return .win
            }
            else if opponentSign == .scissors {
                rule = "Spock smashes scissors"
                return .win
            }
            else if opponentSign == .paper {
                rule = "Paper disproves Spock"
                return .lose
            }
            else if opponentSign == .lizard {
                rule = "Lizard poisons Spock"
                return .lose
            }
        }
        rule = ""
        return .lose
    }
}
