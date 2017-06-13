struct Results {
    
    enum Priceman: Int {
        case first = 2000, second = 1000, third = 800
    }
    
    enum Rank: Int {
        case first, second, third
        
        struct racer {
            let prize: Int
        }
        
        var prizes:racer {
            switch self {
            case .first:
                return racer(prize: 2000)
            case .second:
                return racer(prize: 1000)
            case .third:
                return racer(prize: 800)
            default:
                return racer(prize: 0)
            }
        }
    }
    
    
    let rank: Rank, reward: Priceman
    var desc: String {
        return "\(reward.rawValue)"
    }
}


let winnerPrize = Results(rank: .first, reward: .first)
print("winnerPrize is \(winnerPrize.desc) USD")

let priceMoney = Results.Priceman.first.rawValue







