import UIKit

enum terrainType {
    case incline
    case decline
    case flat
}

func numberOfCastles(stretchOfLand: [Int]) -> Int {
    guard var previousLandValue = stretchOfLand.first, stretchOfLand.count != 1 else {
            return 0
    }
    
    var numberOfCastles = 0
    var currentTerrainType: terrainType = .flat
    
    for currentLandValue in stretchOfLand[1...stretchOfLand.count-1] {
        if currentLandValue == previousLandValue {
            currentTerrainType = .flat
            previousLandValue = currentLandValue
            continue
        }
        
        switch currentTerrainType {
        case .incline:
            if currentLandValue > previousLandValue {
                break
            }
            currentTerrainType = .decline
            numberOfCastles += 1
        case .flat:
            if currentLandValue == previousLandValue {
                break
            } else if currentLandValue > previousLandValue {
                currentTerrainType = .incline
                numberOfCastles += 1
            } else {
                currentTerrainType = .decline
                numberOfCastles += 1
            }
        case .decline:
            if currentLandValue < previousLandValue {
                break
            }
            currentTerrainType = .incline
            numberOfCastles += 1
        }
        
        previousLandValue = currentLandValue
    }
    
    return numberOfCastles
}

numberOfCastles(stretchOfLand: [])
numberOfCastles(stretchOfLand: [1])
numberOfCastles(stretchOfLand: [1,1])
numberOfCastles(stretchOfLand: [1,5,3])
numberOfCastles(stretchOfLand: [1,1,1,2,1,0])
numberOfCastles(stretchOfLand: [6,1,1,1,6,1])
numberOfCastles(stretchOfLand: [1,1,1,2,1,0])
numberOfCastles(stretchOfLand: [1,2,3,4])
