//: [Previous](@previous)

import Foundation

struct AppDetails {
    let brand: String
    let regions: [String]
}

enum Const {
    static let baseURL = "https://qa-neutron-api.viacom.tech/feeds/networkapp/intl/main/"
    static let apiVersion = "2.5"
    static let platform = "ios"
}

func makeApps() -> [AppDetails] {
    return [
        // domestic
        AppDetails(brand: "betplus", regions: ["us"]),
        AppDetails(brand: "mtv", regions: ["us"]),
        AppDetails(brand: "cc", regions: ["us"]),
        AppDetails(brand: "vh1", regions: ["us"]),
        AppDetails(brand: "bet", regions: ["us"]),
        AppDetails(brand: "paramountnetwork", regions: ["us"]),
        AppDetails(brand: "noggin", regions: ["us"]),
        AppDetails(brand: "nick", regions: ["us"]),
        // international
        AppDetails(brand: "paramountplus", regions: ["br"]),
        AppDetails(brand: "nogginintl", regions: ["br"]),
        AppDetails(brand: "mtvplus", regions: ["gb"]),
        AppDetails(brand: "mtv", regions: ["de"]),
        AppDetails(brand: "cc", regions: ["mx"])
        
    ]
}

func makeURL(for app: AppDetails) -> URL {
    let urlString = Const.baseURL + Const.apiVersion +
        "?brand=\(app.brand)&platform=\(Const.platform)&region=\(app.regions.first!)&cacheRefresh=true"
    return URL(string: urlString)!
}

func getFeed(from url: URL, completion: @escaping (String?) ->()) {
    URLSession.shared.dataTask(with: url) { data, response, error in
        if
            let data = data,
            error == nil,
            let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers),
            let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        {
            let jsonString = String(decoding: jsonData, as: UTF8.self)
            completion(jsonString)
        } else {
            print("Failed with error: \(String(describing: error))")
            completion(nil)
        }
    }
    .resume()
}

func makeFileURL(for app: AppDetails) -> URL {
    let documentsDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let fileURL = documentsDir.appendingPathComponent("\(app.brand).\(app.regions.first!).txt")
    return fileURL
}

func write(to fileURL: URL, text jsonString: String) {
    do {
        try jsonString.write(to: fileURL, atomically: true, encoding: .utf8)
        print("Write to \(fileURL) succeded!")
    } catch {
        print("Failed to write with error: \(String(describing: error))")
    }
}

// starts here

let apps: [AppDetails] = makeApps()
// make directory for today
apps.forEach { (app) in
    let url = makeURL(for: app)
    getFeed(from: url) { jsonString in
        guard let jsonString = jsonString else { return }
        let fileURL = makeFileURL(for: app)
        write(to: fileURL, text: jsonString)
    }
}

print("Done!")

//: [Next](@next)
