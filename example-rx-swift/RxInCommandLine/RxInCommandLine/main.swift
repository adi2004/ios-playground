import RxSwift
//
//example(of: "filtering") {
//  let subj = PublishSubject<String>()
//  let db = DisposeBag()
//
//  if true {
//    db.dispose()
//
//    // do stuff
//    let shr = subj.share().debug()
//    shr.skip(2)
//      .map({ str -> String
//        return "===\(str)==="
//      })
//      .distinctUntilChanged()
//      .filter({
//        "aeiou".uppercased().contains($0)
//      })
//      .subscribe(onNext: {
//        print("$0 = \($0)")
//      }, onCompleted: {
//        print("onCompleted: we're done!")
//      })
//      .dispose()
//      .disposed(by: db)
//      .disposed(by: DisposeBag())
//
//    //  shr.subscribe(onNext: {
//    //    print("$0 (2): \($0)")
//    //  })
//  }
//
//  db.disposed()
//
//  // send stuff
//  subj.onNext("A")
//  subj.onNext("B")
//  subj.onNext("C")
//  subj.onNext("D")
//  subj.onNext("E")
//  subj.onNext("E")
//  subj.onNext("E")
//  subj.onNext("F")
//  subj.onCompleted()
//
//}



example(of: "single") {
  let db = DisposeBag()
  let s = Single.just("abc single")
  let observable = s.asObservable()
  
  //observable.onNext("obs3")
  
  s.subscribe {
    print("onnext")
  }
  
  observable.subscribe( onNext: { event in
    print(event)
  }, onCompleted: {
    print("done")
  })
    .disposed(by: db)
}

example(of: "Subj") {
  let subj = PublishSubject<String>()
  let db = DisposeBag()

  subj.onNext("event A")
  
  subj.subscribe(onNext: {
      print("$0 = \($0)")
  })
//    .dispose()
    .disposed(by: db)
  
  subj.onNext("event B")
}

//example(of: "never") {
//  let s = Single<String>()
//  let ss = Single.create {
//
//  }
//  let db = DisposeBag()
////  let observable = Observable<Any>.never()
//  let observable = Observable.from(["A", "B", "C"])
//  observable.subscribe.onNext {
//    print("ev $0 \($0)")
//  }
//
//  observable
//    .do(onNext: { (event) in
//      print("event: \(event)")
//    },
//      onDispose: {
//      print("dispose")
//    })
//    .subscribe(
//      onNext: { element in
//        print(element)
//    },
//      onCompleted: {
//        print("Completed")
//    },
//      onDisposed: {
//        print("Disposed")
//    }
//  )
//    .disposed(by: db)
  print("eof")
//}
