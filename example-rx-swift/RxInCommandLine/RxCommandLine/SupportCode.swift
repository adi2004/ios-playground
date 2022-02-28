import RxSwift

public func example(of description: String, action: () -> Void) {
    print("\n--- Example of:", description, "---")
    action()
}

extension ObservableType {
    /// Creates an observable with pairs of elements from the initial stream.
    ///
    /// A stream of `-1-2-3-4-|` will be converted to `-(1,2)-(2,3)-(3,4)-|`.
    /// Streams with 0 or 1 element will just complete without emitting any values.
    public func pairwise() -> Observable<(Element?, Element?)> {
        self
            .scan((nil, nil)) { result, item -> (previous: Element?, current: Element?) in
                (result.current, item)
            }
            .compactMap { previous, current -> (Element, Element)? in
                if let previous = previous, let current = current {
                    return (previous, current)
                } else {
                    return nil
                }
            }
    }
    
}
