import RxSwift

func rw_never() {
    example(of: "never") {
        let db = DisposeBag()
        let observableNever = Observable<Any>.never()
        
        observableNever
            .subscribe(onNext: { e in
                print("observableNever subscribe onNext \(e)")
            })
            .dispose()

        let observable = Observable<String>.never() //Observable.from(["A", "B", "C"])
        observable
            .subscribe(onNext: {
                print("ev: \($0)")
            })
            .dispose()
        
        observable
            .do(onNext: { (event) in
                print("do onNext: \(event)")
            },
                onDispose: {
                print("do onDispose")
            })
            .subscribe(
                onNext: { element in
                    print("subscribe onNext" + element)
                },
                onCompleted: {
                    print("subscribe onCompleted")
                },
                onDisposed: {
                    print("subscribe onDisposed")
                })
            .disposed(by: db)
    }
}
