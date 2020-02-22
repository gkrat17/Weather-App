//
//  WeatherLoader.swift
//  Weather
//
//  Created by Giorgi on 2/9/20.
//  Copyright © 2020 gkrat17. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherLoader<ForecastModelType: Decodable>: NSObject, CLLocationManagerDelegate, ErrorPageDelegate {

    let view: UIView
    let uri: String

    init(view: UIView, uri: String) {

        self.view = view
        self.uri = uri
        super.init()

        spinner = Spinner(toShowOn: self.view)
        locationManager.delegate = self

    }

    // Override this function
    func modelLoaded(_ model: ForecastModelType) { }

    // Override if needed
    func preconfigure() { }

    // Call at the end of configuring
    func postconfigure() {
        errorPageView?.removeFromSuperview()
        spinner.remove()
    }

    // Instances:
    var spinner: Spinner!
    var errorPageView: ErrorPageView?
    let locationManager = CLLocationManager()

    func refreshTapped() {
        configure()
    }

    func reloadTapped() {
        configure()
    }

    func configure() {
        preconfigure()
        spinner.show()
        requestLocation()
    }

    private func requestLocation() {
        let locationStatus = CLLocationManager.authorizationStatus()
        switch locationStatus {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
                break
            case .authorizedWhenInUse, .authorizedAlways:
                locationManager.requestLocation()
                break
            default:
                showErrorPage(withErrorMessage: ErrorMessages.enableLocationServices)
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        configure()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let latitude = locations.last?.coordinate.latitude,
           let longitude = locations.last?.coordinate.longitude
        {
            loadWeather(latitude: latitude, longitude: longitude)
        } else {
            showErrorPage(withErrorMessage: ErrorMessages.noCoorinates)
        }
    }

    func loadWeather(latitude: Double, longitude: Double) {
        startRequest (
            url: "https://api.openweathermap.org/data/2.5/" + uri + "?appid=b07da2abebb981b5b3874956763fa118&units=metric&lat=\(latitude)&lon=\(longitude)",

            decodeData: { (data) in
                return try? JSONDecoder().decode(ForecastModelType.self, from: data)
            },

            completion: { (result) in
                self.modelLoaded(result)
            }
        )
    }

    func loadWeatherIcon(named iconName: String, completion: @escaping (UIImage) -> ()) {
        startRequest (
            url: "https://openweathermap.org/img/wn/\(iconName)@2x.png",
            decodeData: { (data) in return UIImage(data: data) },
            completion: completion
        )
    }

    func startRequest<DataType> (
        url: String,
        decodeData: @escaping (Data) -> DataType?,
        completion: @escaping (DataType) -> Void
    ) {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"

        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)

        let task = session.dataTask(with: request) { [weak self] (data, response, error) in

            func asyncShowErrorPage(withErrorMessage errorMessage: String) {
                DispatchQueue.main.async {
                    self?.showErrorPage(withErrorMessage: errorMessage)
                }
            }

            guard let data = data,
                  let httpResponse = response as? HTTPURLResponse
            else {
                asyncShowErrorPage(withErrorMessage: ErrorMessages.didNotResponsed)
                return
            }

            let statusCode = httpResponse.statusCode
            guard (200 ..< 300) ~= statusCode
            else {
                asyncShowErrorPage(withErrorMessage: ErrorMessages.httpError(statusCode))
                return
            }

            if let result = decodeData(data) {
                DispatchQueue.main.async {
                    completion(result)
                }
            } else {
                asyncShowErrorPage(withErrorMessage: ErrorMessages.missingData)
            }

        }

        task.resume()
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        showErrorPage(withErrorMessage: error.localizedDescription)
    }

    func showErrorPage(withErrorMessage errorMessage: String) {

        errorPageView = errorPageView ?? createErrorPageView(delegate: self)
        errorPageView!.configure (
            from: ErrorPageModel (
                errorMessage: errorMessage,
                superView: view
            )
        )

        spinner.remove()
    }

}
