import UIKit

extension UIImage {
    
    static let cache = NSCache< NSString, UIImage > ()
    
    static func downloadImageAndCache(url: URL, completion: @escaping(_ image: UIImage?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, responseUrl, error in
            var downloadedImage: UIImage?
            
            if let data = data {
                downloadedImage = UIImage(data: data)
            }
            
            if downloadedImage != nil {
                cache.setObject(downloadedImage!, forKey: url.absoluteString as NSString)
            }
            
            DispatchQueue.main.async {
                completion(downloadedImage)
            }
        }.resume()
    }
    
    
    static func getImage(url: URL, completion: @escaping(_ image: UIImage?) -> ()) {
        
        if let image = cache.object(forKey: url.absoluteString as NSString) {
            
            completion(image)
        }
        else {
            downloadImageAndCache(url: url, completion: completion)
        }
    }
}


/*
 
 Use like this ->
 
 let imageUrl = "\(responseModel.userimage!)"
 
 ImageService.downloadImage(url: URL(string: imageUrl)!) { image in
 
 self.imageView.image = image
 
 }
 
*/

