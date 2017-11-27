import UIKit

enum terrainType {
    case incline
    case decline
    case flat
}

func numberOfCastles(stretchOfLand: [Int]) -> Int {
    
    if stretchOfLand.count == 1 {
        return 1
    }
    
    guard var previousLandValue = stretchOfLand.first else {
        return 0
    }
    
    var numberOfCastles = 1
    
    var currentTerrainType: terrainType = .flat
    
    for currentLandValue in stretchOfLand[1...stretchOfLand.count-1] {
        if currentLandValue == previousLandValue {
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
            if currentLandValue > previousLandValue {
                currentTerrainType = .incline
            } else {
                currentTerrainType = .decline
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
numberOfCastles(stretchOfLand: [4,3,2,1])
numberOfCastles(stretchOfLand: [1,1,2])
