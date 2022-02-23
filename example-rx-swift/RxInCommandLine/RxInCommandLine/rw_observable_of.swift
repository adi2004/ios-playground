import RxSwift

func rw_observable_of() {
    example(of: "observable on next") {
        let db = DisposeBag()
        let observable = Observable.of("obs1", "obs2")
        
        observable
            .take(3)
            .subscribe(onNext: { event in
                print("Observable.of.onNext: event = " + event)
            })
            .disposed(by: db)
    }
}
