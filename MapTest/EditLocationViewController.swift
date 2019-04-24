//
//  EditLocationViewController.swift
//  MapTest
//
//  Created by Dmitriy Borovikov on 20/02/2019.
//  Copyright © 2019 Dmitriy Borovikov. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import PromiseKit

class EditLocationViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    let crossHairView = CrossHairView()
    let accuracyCircleView = AccuracyCircleView()

    var location: CLLocation!       // Initial location

    override func viewDidLoad() {
        super.viewDidLoad()

//        crossHairView = CrossHairView()
//        accuracyCircleView = AccuracyCircleView()
        view.addSubview(crossHairView)
        view.addSubview(accuracyCircleView)
        setCurrentLocation()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews", view.frame)
        let subFrame = CGRect(origin: .zero, size: view.frame.size)
        crossHairView.frame = subFrame
        accuracyCircleView.frame = subFrame
    }
    
    @IBAction func tapCancelButton(_ sender: Any) {
    }

    @IBAction func tapDoneButton(_ sender: Any) {
    }

    @IBAction func tapButtonPlus(_ sender: UIButton) {
        let zoomLevel = mapView.zoomLevel + 1
        mapView.setCenterCoordinate(centerCoordinate: mapView.centerCoordinate, zoomLevel: zoomLevel, animated: true)
    }

    @IBAction func tapButtonMinus(_ sender: UIButton) {
        let zoomLevel = mapView.zoomLevel - 1
        mapView.setCenterCoordinate(centerCoordinate: mapView.centerCoordinate, zoomLevel: zoomLevel, animated: true)
    }

    @IBAction func tapButtonCenter(_ sender: UIButton) {
        setCurrentLocation()
    }

    @IBAction func mapTypeChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            mapView.mapType = .hybrid
        case 1:
            mapView.mapType = .satellite
        default:
            return
        }
    }

    private func setCurrentLocation() {
        CLLocationManager.requestAuthorization(type: .whenInUse)
            .then { _ in
                CLLocationManager.requestLocation()
            }.done { location in
//                self.mapView.setCenterCoordinate(centerCoordinate: location.last!.coordinate, zoomLevel: 14, animated: true)
                print(location)
            }.ignoreErrors()
    }
}

extension EditLocationViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        crossHairView.show(coordinate: mapView.centerCoordinate)
    }
}
