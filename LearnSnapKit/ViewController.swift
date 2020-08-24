//
//  ViewController.swift
//  LearnSnapKit
//
//  Created by Taof on 11/23/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit
import SnapKit
import GoogleMaps
import GooglePlaces

class ViewController: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
         locationManager.delegate = self
         locationManager.desiredAccuracy = kCLLocationAccuracyBest
       
//                locationManager.requestWhenInUseAuthorization()
//                locationManager.startUpdatingLocation()
//                locationManager.startMonitoringSignificantLocationChanges()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
         askEnableLocationService()
    }
    @IBAction func getLocation(_ sender: Any) {
      print("helloyou")
        // 1
        let status = CLLocationManager.authorizationStatus()

        switch status {
            // 1
        case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
                return

            // 2
        case .denied, .restricted:
            let alert = UIAlertController(title: "Location Services disabled", message: "Please enable Location Services in Settings", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)

            present(alert, animated: true, completion: nil)
            return
        case .authorizedAlways, .authorizedWhenInUse:
            break

        }

        // 4
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
      
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
           DispatchQueue.main.async {[weak self]  in
               guard let `self` = self else { return }
               
              manager.stopUpdatingLocation()
              if let location: CLLocation = locations.last {
                print(location)
              }
           }
       }
          
      // Handle authorization for the location manager.
      func locationManager(_ manager: CLLocationManager,  didChangeAuthorization status: CLAuthorizationStatus) {
//          if status == .authorizedWhenInUse {
//               manager.startUpdatingLocation()
//          }
        switch status {
        case .notDetermined:
                 print(".NotDetermined")
                 break

        case .authorizedAlways:
                 print(".AuthorizedAlways")
            
                 break


        case .denied:
                 print(".Denied")
           
                 break

        case .authorizedWhenInUse:
                 print(".AuthorizedWhenInUse")
               
                 break

        case .restricted:
                 print(".Restricted")
                 break

               default:
                 print("Unhandled authorization status")
                 break

               }
      }
       
      // Handle location manager errors.
      func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
          self.locationManager.stopUpdatingLocation()
    
      }
    

    
    func askEnableLocationService() ->String {
        var showAlertSetting = false
        var showInitLocation = false
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .denied:
                showAlertSetting = true
                print("HH: kCLAuthorizationStatusDenied")
            case .restricted:
                showAlertSetting = true
                print("HH: kCLAuthorizationStatusRestricted")
            case .authorizedAlways:
                showInitLocation = true
                print("HH: kCLAuthorizationStatusAuthorizedAlways")
            case .authorizedWhenInUse:
                showInitLocation = true
                print("HH: kCLAuthorizationStatusAuthorizedWhenInUse")
            case .notDetermined:
                showInitLocation = true
                print("HH: kCLAuthorizationStatusNotDetermined")
            default:
                break
            }
        }else{
            showAlertSetting = true
            print("HH: locationServicesDisabled")

        }
        if showAlertSetting {
            
         
//              alert.addAction(UIAlertAction(title: "Go to Settings now", style: UIAlertAction.Style.default, handler: { (alert: UIAlertAction!) in
//                          print("")
//                  UIApplication.shared.openURL(NSURL(string:UIApplication.openSettingsURLString)! as URL)
//                      }))
//              self.present(alert, animated: true, completion: nil)
            
            
//            let alertController = UIAlertController(title: "Bạn chưa bật định vị GPS", message: "Bạn cần bật chế độ định vị GPS để SeAMobile sử dụng vị trí của bạn.", preferredStyle: .alert)
//            let OKAction = UIAlertAction(title: "Bật định vị", style: .destructive) { (action:UIAlertAction!) in if let url = URL(string: UIApplication.openSettingsURLString) {
//                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
//                }
//            }
//            let CloseAction = UIAlertAction(title: "Đóng", style: .destructive, handler: nil)
//           CloseAction.setValue(UIColor.gray, forKey: "titleTextColor")
//
//            alertController.addAction(OKAction)
//
//            alertController.addAction(CloseAction)
//            self.present(alertController, animated: true, completion:nil)
//
//            let myAlert:CustomAlert = CustomAlert()
////             myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
////                  myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
//            myAlert.view.frame = CGRect(x: 10, y: 100, width: 300, height: 100)
//            self.present(myAlert, animated: true, completion: nil)
              CustomAlert.instance.showAlert(title: "Bạn chưa bật định vị GPS", message: "Bạn cần bật chế độ định vị GPS để SeAMobile sử dụng vị trí của bạn", alertType: .success)

        }
        if showInitLocation {

            return "YES"

        }
        return "NO"

    }
}

