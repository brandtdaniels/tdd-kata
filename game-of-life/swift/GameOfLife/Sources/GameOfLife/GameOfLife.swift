import Foundation

// MARK: - Dimensions

protocol GridDimensions {
    
    var width: Int { get }
    
    var height: Int { get }
    
}

struct Dimensions: GridDimensions {
    
    private(set) var width: Int
    
    private(set) var height: Int
    
    init(_ width: Int, _ height: Int) {
        
        self.width = width
        
        self.height = height
        
    }
    
}

// MARK: - Tick

struct Tick {
    
    var count: Int
    
}

// MARK: - Time

protocol Time {
    
    func tick(_ completion: (Tick, [Cell]) -> Void)
    
}

// MARK: - Grid

class Grid {

    private var tick: Tick
    
    private(set) var cells = [Cell]()
    
    private(set) var dimensions: Dimensions
    
    init(_ seed: [Cell], _ dimensions: Dimensions) {
        
        self.dimensions = dimensions
        
        tick = Tick(count: 0)

        populate(dimensions, with: seed)
    }
    
    private func populate(_ dimensions: Dimensions, with seed: [Cell]) {
        
        cells.append(contentsOf: seed)
        
        for y in 0..<dimensions.height {
            
            for x in 0..<dimensions.width {
                
                let cell = Cell(x, y, state: .dead)
                
                if !seed.contains(cell) {
                    cells.append(cell)
                }
                
            }
        }
        
    }
    
    private func neighbors(of cell: Cell, are state: Cell.State) -> [Cell] {
        
        let cellsAreNeighbors = { (op1: Cell, op2: Cell) -> Bool in
            
            let delta = ( abs(op1.x - op2.x), abs(op1.y - op2.y) )
            
            switch (delta) {
                
            case (1,1), (1,0), (0,1):
                return true
                
            default:
                return false
                
            }
            
        }
        
        let neighborsForCell = { (cell: Cell) -> [Cell] in
            
            return self.cells.filter { cellsAreNeighbors(cell, $0) }
            
        }
        
        return neighborsForCell(cell).filter{ $0.state == state }
        
    }
    
}

extension Grid: Time {

    func tick(_ completion: (Tick, [Cell]) -> Void) {
        
        tick.count += 1
        
        let alive = cells.filter { $0.state == .alive}
        
        let dead = cells.filter { $0.state == .dead }
        
        let underpopulated = alive.filter { neighbors(of: $0, are: .alive).count < 2 }
        
        let overcrowded = alive.filter { neighbors(of: $0, are: .alive).count > 3 }
        
        let dying = underpopulated + overcrowded
        
        let aliving = dead.filter { neighbors(of: $0, are: .alive).count == 3 }
        
        aliving.forEach { cell in cell.state = .alive }
        
        dying.forEach { cell in cell.state = .dead }
        
        completion(tick, cells)
        
    }
    
}

// MARK: - GridCell

protocol GridCell {
    
    var x: Int { get }
    
    var y: Int { get }
    
}

// MARK: Cell

class Cell: GridCell {

    enum State {
        case alive, dead
    }
    
    var state: State
    
    private(set) var x: Int
    
    private(set) var y: Int
    
    init(_ x: Int, _ y: Int, state: State = .alive) {
        
        self.x = x
        
        self.y = y
        
        self.state = state
        
    }

}

extension Cell: Equatable {
    
    static func ==(lhs: Cell, rhs: Cell) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
    
}

