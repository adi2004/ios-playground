import RxSwift

func rw_single() {
    example(of: "single") {
        let db = DisposeBag()
        let single = Single.just("abc single")
        let observable = single.asObservable()

        single
            .subscribe({ event in
                print("Single.onNext: event = \(event)")
            })
            .disposed(by: db)
        
        observable
            .subscribe(onNext: { event in
                print("1Single.asObservable.onNext: event = \(event)")
            }, onCompleted: {
                print("1Single.asObservable.onCompleted")
            })
            .disposed(by: db)
        
        observable
            .subscribe(onNext: { event in
                print("2Single.asObservable.onNext: event = \(event)")
            }, onCompleted: {
                print("2Single.asObservable.onCompleted")
            })
            .disposed(by: db)
    }
}
