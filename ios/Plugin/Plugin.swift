import Foundation
import Capacitor
import Photos

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitor.ionicframework.com/docs/plugins/ios
 */
@objc(PhotoLibrary)
public class PhotoLibrary: CAPPlugin {
    
    func getImageResult (quality:CGFloat, imageAsset: PHAsset, image: UIImage) -> [String:Any] {
        let jpegData = UIImageJPEGRepresentation(image, quality)
        return [
            "id": imageAsset.localIdentifier,
            "createTime": imageAsset.creationDate?.timeIntervalSince1970 ?? 0,
            "location": [
                "latitude": imageAsset.location?.coordinate.latitude,
                "longitude": imageAsset.location?.coordinate.longitude
            ],
            "base64": jpegData!.base64EncodedString()
        ]
    }
    
    @objc func getPhotos(_ call: CAPPluginCall) {
        // prepare for params
        let offset =  call.get("offset", Int.self, 0)!,
            limit = call.get("limit", Int.self, 10)!,
            width = call.get("width", Int.self, 128)!,
            height = call.get("height", Int.self, 128)!,
            quality = call.get("quality", Int.self, 100)!,
            mode = call.get("mode", String.self, "fast")!;
        var images = [[String:Any]]()
        // check for permission
        if(PHPhotoLibrary.authorizationStatus() != PHAuthorizationStatus.authorized)
        {
            call.reject("auth/forbidden");
            return;
        }
        // prepare for fetch options
        let fetchOptions:PHFetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        let imageRequestOptions = PHImageRequestOptions()
        imageRequestOptions.isSynchronous = true
        imageRequestOptions.resizeMode = mode == "fast" ? PHImageRequestOptionsResizeMode.fast : PHImageRequestOptionsResizeMode.exact
        // fetch assets
        let fetchResults:PHFetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: fetchOptions)
        // get photo contents by offset & limit
        let end:Int = min(offset + limit, fetchResults.count);
        
        // loop
        for i in offset..<end {
            let imageAsset:PHAsset = fetchResults.object(at: i) as PHAsset;
            PHImageManager.default().requestImage(for: imageAsset, targetSize: CGSize(width: width, height: height), contentMode: .aspectFit, options: imageRequestOptions, resultHandler: { (image, [AnyHashable : Any]?) in
                if (image != nil) {
                    images.append(self.getImageResult(quality: CGFloat(quality / 100), imageAsset: imageAsset, image: image!))
                }
                
            });
        }
        // return the result
        call.resolve([
            "total": fetchResults.count,
            "images": images
        ])
    }
    
    @objc func getPhoto(_ call: CAPPluginCall) {
        // prepare for params
        let id =  call.get("id", String.self, "")!,
            width = call.get("width", Int.self, 128)!,
            height = call.get("height", Int.self, 128)!,
            quality = call.get("quality", Int.self, 100)!,
            mode = call.get("mode", String.self, "fast")!;
        var result = [String:Any]();
        // check for permission
        if(PHPhotoLibrary.authorizationStatus() != PHAuthorizationStatus.authorized)
        {
            call.reject("403:auth/forbidden");
            return;
        }
        // prepare for fetch options
        let fetchOptions:PHFetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        let imageRequestOptions = PHImageRequestOptions()
        imageRequestOptions.isSynchronous = true
        imageRequestOptions.resizeMode = mode == "fast" ? PHImageRequestOptionsResizeMode.fast : PHImageRequestOptionsResizeMode.exact
        // fetch assets
        let fetchResult:PHFetchResult = PHAsset.fetchAssets(withBurstIdentifier: id, options: fetchOptions)
        // get photo content
        if (fetchResult.count > 0) {
            let imageAsset:PHAsset = fetchResult.firstObject!;
            PHImageManager.default().requestImage(for: imageAsset, targetSize: CGSize(width: width, height: height), contentMode: .aspectFit, options: imageRequestOptions, resultHandler: {
                (image, n) in
                if (image != nil) {
                    result = self.getImageResult(quality: CGFloat(quality / 100), imageAsset: imageAsset, image: image!);
                }
            })
            // return the result
            call.resolve(result)
        } else {
            call.reject("404:resource/not-found");
        }
        
    }
}
