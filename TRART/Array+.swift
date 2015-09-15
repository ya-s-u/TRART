import Foundation

extension Array {
    mutating func shuffle(count: Int) {
        for _ in 0..<count {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}