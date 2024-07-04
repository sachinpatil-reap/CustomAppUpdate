import UIKit

public class AppUpdater: NSObject {
    public static let shared = AppUpdater()
    
    public class func versionAndDownloadUrl() -> (version: String, downloadUrl: String)? {
        guard let identifier = Bundle.main.object(forInfoDictionaryKey: "CFBundleIdentifier") as? String, let url = URL(string: "http://itunes.apple.com/lookup?bundleId=\(identifier)") else { return nil
        }
        
        guard
            let data = try? Data(contentsOf: url),
            let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any],
            let results = json?["results"] as? [[String: Any]],
            results.count > 0,
            let version = results[0]["version"] as? String,
            let downLoadUrl = results[0]["trackViewUrl"] as? String
                
            else {
                return nil
        }
        print("version----\(version)")
        return (version, downLoadUrl)
    }
    
    public class func isUpdateAvailable() -> Bool {
        guard let data = versionAndDownloadUrl() else { return false }
        let appStoreVersion = data.version
        print("appStoreVersion----\(appStoreVersion)")

        return compare(appStoreVersion)
    }
    
    private class func compare(_ appstoreVersion: String) -> Bool {
        guard let deviceVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String else { return false }
        
        if appstoreVersion.compare(deviceVersion, options: .numeric) == .orderedDescending {
            return true
        } else {
            return false
        }
    }
    
    public class func showUpdateAlert(isForce:Bool = false,
                                      title: String = "Update",
                                      message: String? = nil,
                                      cancel: String = "Cancel",
                                      ok: String = "OK",nav:UINavigationController,isForceBool: Bool) {
        guard let applicationName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String, let data = versionAndDownloadUrl() else { return }
        
        var alert: UIAlertController?
        
        if compare(data.version) {
            print("UpdatePopupViewController")
            let popupVC = UpdatePopupViewController()
            popupVC.modalPresentationStyle = .overFullScreen
            popupVC.dataVersion = "\(data.version)"
            popupVC.dataURL = "\(data.downloadUrl)"
            popupVC.isForce = isForceBool
            popupVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            nav.present(popupVC, animated: true, completion: nil)
            
            
//            if let message = message {
//                alert = UIAlertController(title: applicationName, message: message, preferredStyle: UIAlertController.Style.alert)
//            } else {
//                alert = UIAlertController(title: applicationName, message: "Version \(data.version) is available on the AppStore", preferredStyle: UIAlertController.Style.alert)
//            }
//            alert?.addAction(UIAlertAction(title: title, style: UIAlertAction.Style.destructive, handler: { action in
//                guard let url = URL(string: data.downloadUrl) else { return }
//                UIApplication.shared.openURL(url)
//
//            }))
//
//            if !isForce {
//                alert?.addAction(UIAlertAction(title: cancel, style: UIAlertAction.Style.cancel, handler: nil))
//            }
        } else {
            if !isForce {
                alert = UIAlertController(title: applicationName, message: "Version \(data.version) is the latest version on the AppStore", preferredStyle: UIAlertController.Style.alert)
                alert?.addAction(UIAlertAction(title: ok, style: UIAlertAction.Style.cancel, handler: nil))
            }
        }
        
        guard let _alert = alert else { return }
        UIApplication.shared.keyWindow?.rootViewController?.present(_alert, animated: true, completion: {
            
        })
    }
}

