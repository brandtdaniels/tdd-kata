import XCTest
@testable import GameOfLife

class GameOfLifeTests: XCTestCase {
    
    func testAnyLiveCellWithFewerThanTwoLiveNeighborsDies() {

        let seed = [Cell(0, 0)]
        
        let grid = Grid(seed, Dimensions(2, 2))
        
        grid.tick { tick, cells in
            
            let zeroZeroCells = cells.filter { $0 == Cell(0, 0) }

            XCTAssert(zeroZeroCells.first?.state == .dead)

        }
        
    }
    
    func testAnyLiveCellWithMoreThanThreeLiveNeighborsDies() {
        
        let seed = [Cell(0, 1), Cell(1, 1), Cell(2,1), Cell(1, 0), Cell(1, 2)]
        
        let grid = Grid(seed, Dimensions(3, 3))
        
        grid.tick { tick, cells in
            
            let oneOneCells = cells.filter { $0 == Cell(1, 1) }

            XCTAssert(oneOneCells.first?.state == .dead)

        }
        
    }
    
    func testAnyLiveCellWithTwoOrThreeLiveNeighborsLivesOn() {
        
        let seed = [Cell(0, 1), Cell(1, 1), Cell(1, 0), Cell(1, 2)]
        
        let grid = Grid(seed, Dimensions(3, 3))
        
        grid.tick { tick, cells in
            
            let zeroOneCells = cells.filter { $0 == Cell(0, 1) }
            
            XCTAssert(zeroOneCells.first?.state == .alive)
            
            let oneZeroCells = cells.filter { $0 == Cell(1, 0) }
            
            XCTAssert(oneZeroCells.first?.state == .alive)
            
            let oneTwoCells = cells.filter { $0 == Cell(1, 2) }
            
            XCTAssert(oneTwoCells.first?.state == .alive)
            
        }
        
    }
    
    func testAnyDeadCellWithExactlyThreeLiveNeighborsBecomesALiveCell() {
        
        let seed = [Cell(1, 2, state: .dead), Cell(0, 1), Cell(1, 1), Cell(2,1)]
        
        let grid = Grid(seed, Dimensions(3, 3))
        
        grid.tick { tick, cells in
            
            let twoOneCells = cells.filter { $0 == Cell(1, 2) }

            XCTAssert(twoOneCells.first?.state == .alive)
            
        }
        
    }
    
    static var allTests = [
        ("testAnyLiveCellWithFewerThanTwoLiveNeighborsDies", testAnyLiveCellWithFewerThanTwoLiveNeighborsDies),
        ("testAnyLiveCellWithMoreThanThreeLiveNeighborsDies", testAnyLiveCellWithMoreThanThreeLiveNeighborsDies),
        ("testAnyLiveCellWithTwoOrThreeLiveNeighborsLivesOn", testAnyLiveCellWithTwoOrThreeLiveNeighborsLivesOn),
        ("testAnyDeadCellWithExactlyThreeLiveNeighborsBecomesALiveCell", testAnyDeadCellWithExactlyThreeLiveNeighborsBecomesALiveCell)
    ]
}
