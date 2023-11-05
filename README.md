# DHLocationService

DHLocationService is a Swift package designed to streamline the integration of location services within your SwiftUI applications. It provides a robust and easy-to-implement framework to manage and retrieve the user's location status and current region, thereby significantly reducing the boilerplate code and complexities involved in utilizing iOS's Core Location services.

<img src="https://img.shields.io/badge/BUILD-0.1.4-green" />&nbsp;&nbsp;&nbsp;<img src="https://img.shields.io/badge/LICENSE-MIT-purple" />&nbsp;&nbsp;&nbsp;<img src="https://img.shields.io/badge/MADE WITH-SWIFTUI-orange" />

## Features

- Seamlessly integrates with SwiftUI projects.
- Exposes the user's location authorization status as a `@Published` property for real-time updates within your SwiftUI views.
- Handles changes in location authorization status with a dedicated function.
- Simplifies the process of requesting location authorization from the user.
- Enables easy retrieval of the current location and the user's current region.

## Installation

### Swift Package Manager

To integrate DHLocationService into your Xcode project using Swift Package Manager, add it to the dependencies within your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/DavidHu-SG/DHLocationService.git", .upToNextMajor(from: "1.0.0"))
]
```

Or add it directly via Xcode by going to `File > Swift Packages > Add Package Dependency...`, and then paste the URL of this repository.

## Usage
First, import DHLocationService into your SwiftUI project.

```swift
import SwiftUI
import DHLocationService

// Your SwiftUI view
struct ContentView: View {
    @ObservedObject var locationService = LocationService()

    var body: some View {
        Text("Authorization Status: \(locationService.status.description)")
        // Your additional UI components
    }
}
```

Requesting Authorization
To request location services authorization from the user:

```swift
locationService.requestAuthorization()
```

Getting Current Location
Retrieve the user's current location easily:

```swift
locationService.getCurrentLocation()
```

Getting User's Current Region
Obtain the user's current region using:

```swift
locationService.getUserCurrentRegion()
```

## Example
To see DHLocationService in action, clone the Example repository and explore the code provided in the project. <br/>
[Example Project](https://github.com/DavidHu-SG/DHLocationServiceSample)

## Requirements
- iOS 15.0 or later
- macOS 12.0 or later
- Xcode 12.0 or later
- Swift 5.0 or later

## Contributions
Your contributions make the open source community a better place! If you would like to contribute to DHLocationService, please feel free to open an issue or create a pull request.

## Author
David Hu, davidhu.sg66@gmail.com

License
DHLocationService is released under the MIT license. See LICENSE for details.

