//MIT License
//
//Copyright (c) 2023 David Hu
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import CoreLocation
import Combine
import MapKit

@available(iOS 15, macOS 12, watchOS 8, tvOS 15, *)
public class DHLocationService: NSObject, CLLocationManagerDelegate, ObservableObject {
    private let locationManager = CLLocationManager()
    private var locationPublisher: AnyPublisher<CLAuthorizationStatus, Never>?
    @Published public var status: CLAuthorizationStatus = .notDetermined

    public override init() {
        super.init()
        locationManager.delegate = self
        locationPublisher = locationManager
            .publisher(for: \.authorizationStatus)
            .replaceError(with: .notDetermined)
            .eraseToAnyPublisher()
    }

    public func requestAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }

    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.status = status
    }
    
    public func getCurrentLocation() -> CLLocationCoordinate2D? {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

        guard let currentLocation = locationManager.location else {
            debugPrint("test log Error: Could not determine current location.")
            return nil
        }
        
        return currentLocation.coordinate
    }

    public func getUserCurrentRegion() -> MKCoordinateRegion? {
        guard let currentLocation = getCurrentLocation() else { return nil }
        let mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: currentLocation.latitude, longitude: currentLocation.longitude), span: MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008))
        return mapRegion
    }
}
