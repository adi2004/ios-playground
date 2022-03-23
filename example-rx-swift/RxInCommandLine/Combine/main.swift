import Combine


(0 ..< 100)
    .publisher
    .sink { value in
        (value % 2 == 0) ? print("even \(value)") : print("odd \(value)")
    }
//let p = Publisher()
//p.sink(receiveValue: "abc")
//p.subscribe({
//    print("adb")
//})

