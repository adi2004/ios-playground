import UIKit

func longOperation() {
    var sum: Double = 0
    for _ in (1...1_00) {
        sum += sqrt(Double(arc4random() * 1_000))
    }
}

class Operation {
    func doSth(completion: (String) -> Void) {
        completion("doing...")
    }
}

class Caller {
    func execute(completion: @escaping() -> ()) {
        DispatchQueue.global().async {
            completion()
        }
    }
}

class Controller {
    var op = Operation()
    
    init() {
        let c = Caller()
        c.execute { [weak self] in
            self?.op.doSth { (msg) in
                longOperation()
                print(msg + "weak self: inside Controller.init > execute")
            }
        }
        
        c.execute {
            longOperation()
            self.op.doSth { (msg) in
                print(msg + "strong self: inside Controller.init > execute")
            }
        }
        print("init done")
    }
}


let c = Caller()
c.execute {
    _ = Controller()
    print("c.execute done")
}

