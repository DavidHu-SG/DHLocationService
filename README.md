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

## Request Permission

Improving the documentation for the Info.plist configuration is essential to ensure that users of your framework understand the purpose of the permissions and how to set them up correctly. Here's a revised explanation:

To ensure that DHLocationService functions correctly, you must request permission to use location services from your app's users. This involves adding a key to your Info.plist file with a brief explanation that the system presents to the user when requesting this permission.

Here's how you can add the required key for when-in-use location access:

1. Open your app's `Info.plist` file in Xcode.
2. Right-click and select "Add Row" to add a new key.
3. Type in `NSLocationWhenInUseUsageDescription` for the key.
4. Set the type to `String`.
5.For the value, provide a user-friendly description that explains why your app requires access to the user's location. This message should clearly state the benefit for the user to grant this permission.

Your `Info.plist` entry should look like this:

```XML
<key>NSLocationWhenInUseUsageDescription</key>
<string>Your custom message explaining why the app needs access to the user's location when in use.</string>
```

Replace Your custom message explaining why the app needs access to the user's location when in use. with your specific explanation. For instance, if your app uses the location to suggest nearby points of interest, the description could be:

```XML
<key>NSLocationWhenInUseUsageDescription</key>
<string>To provide you with personalized recommendations for nearby places, we require access to your location when using the app.</string>
```

Note that the description must be clear and concise, as Apple will review this text during the app submission process.

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

## License
DHLocationService is released under the MIT license. See [LICENSE](https://github.com/DavidHu-SG/DHLocationService/blob/main/LICENSE) for details.

