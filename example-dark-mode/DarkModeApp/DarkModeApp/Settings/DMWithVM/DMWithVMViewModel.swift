import UIKit

class DMWithVMViewModel {
    let model: [(name: String, style: UIUserInterfaceStyle)]
    var selectedIndex: Int?
    private let userDefaults: UserDefaults

    init(style: UIUserInterfaceStyle, userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults

        self.model = [
            (name: "Unspecified", style: .unspecified),
            (name: "Dark", style: .dark),
            (name: "Light", style: .light) ]

        self.selectedIndex = model.firstIndex(where: { $0.style == style })
    }

    func select(at index: Int, completion: () -> ()) {
        userDefaults.darkModePreference = model[index].style.rawValue
        selectedIndex = index
        completion()
    }
}
