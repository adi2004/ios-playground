import RxSwift

func rw_filtering() {
    example(of: "filtering") {
        let subj = PublishSubject<String>()
        let db = DisposeBag()
        
        if true {
            db.dispose()
            
            // do stuff
            let shr = subj.share().debug()
            shr.skip(2)
                .map({ str -> String
                    return "===\(str)==="
                })
                .distinctUntilChanged()
                .filter({
                    "aeiou".uppercased().contains($0)
                })
                .subscribe(onNext: {
                    print("$0 = \($0)")
                }, onCompleted: {
                    print("onCompleted: we're done!")
                })
                .dispose()
                .disposed(by: db)
                .disposed(by: DisposeBag())
            
            //  shr.subscribe(onNext: {
            //    print("$0 (2): \($0)")
            //  })
        }
        
        db.disposed()
        
        // send stuff
        subj.onNext("A")
        subj.onNext("B")
        subj.onNext("C")
        subj.onNext("D")
        subj.onNext("E")
        subj.onNext("E")
        subj.onNext("E")
        subj.onNext("F")
        subj.onCompleted()
    }
}
