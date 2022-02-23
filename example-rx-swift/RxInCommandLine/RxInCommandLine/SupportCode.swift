import Foundation

public func example(of description: String, action: () -> Void) {
  print("\n--- Example of:", description, "---")
  action()
}

//class PrintClassName: NSObject {
//    override init() {
//        super.init()
//        print(NSStringFromClass(self.dynamicType))
//    }
//}
