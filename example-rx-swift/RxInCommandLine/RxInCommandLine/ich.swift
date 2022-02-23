import RxSwift

func ich() {
    ich_observable()
    ich_subject()
}

func ich_observable() {
    print("\n=== ich_observable")
    
    let o = Observable.just("this is the only event")
    
    o
        .subscribe({ event in
            print("Observable.just event = \(event)")
        })
        .disposed(by: DisposeBag())
    
    o
        .subscribe(onNext: { event in
            print("(2nd subscribe) Observable.just.onNext: event = \(event)")
        })
        .disposed(by: DisposeBag())
}

func ich_subject() {
    print("\n=== ich_subject")
    
    let db = DisposeBag()
//    let x = BehaviorSubject<String>(value: "initial value")
//    let x = PublishSubject<String>()
    let x = ReplaySubject<String>.create(bufferSize: 3)
    
    // if BehaviorSubject PublishSubject will not be displayed
    // if ReplaySubject with buffer > 2 will be displayed
    x.onNext("onNext before 2")
    
    // if PublishSubject will not be displayed
    // if BehaviorSubject will be displayed
    // if ReplaySubject with buffer > 1 will be displayed
    x.onNext("onNext before 1")

    x
        .subscribe(onNext: { event in
            print(String(describing: type(of: x)) + " onNext event = \(event)")
        })
        .disposed(by: db)

    x.onNext("onNext after 1")
    x.onNext("onNext after 2")
}
