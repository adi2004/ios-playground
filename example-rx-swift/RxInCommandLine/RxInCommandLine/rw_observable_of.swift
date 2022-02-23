
example(of: "observable on next") {
  let db = DisposeBag()
  let observable = Observable.of("obs1", "obs2")
  
  //observable.onNext("obs3")
  
  observable.subscribe( onNext: { event in
    print(event)
  })
    //.disposed(by: db)
}
