import RxSwift

func rw_subject() {
    example(of: "PublishSubject") {
        let subj = PublishSubject<String>()
        let db = DisposeBag()
        
        subj.onNext("event A")
        
        subj
            .subscribe(onNext: { event in
                print("PublishSubject.onNext: event = " + event)
            })
            .disposed(by: db)
        
        subj
            .onNext("event B")
    }
}
