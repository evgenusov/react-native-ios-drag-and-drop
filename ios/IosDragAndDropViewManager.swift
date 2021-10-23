import Foundation

@objc(IosDragAndDropViewManager)
class IosDragAndDropViewManager: RCTViewManager {
    
    override func view() -> (IosDragAndDropView) {
        return IosDragAndDropView()
    }
}

class IosDragAndDropView : UIView, UIDropInteractionDelegate {
    @objc var onDrop: RCTBubblingEventBlock? = nil;
    @objc var color: String = "" {
        didSet {
            self.backgroundColor = hexStringToUIColor(hexColor: color)
        }
    }
    
    @objc var enabled: Bool = true {
        didSet {
            if #available(iOS 11.0, *) {
                self.addInteraction(UIDropInteraction(delegate: self))
            } else {
                // Fallback on earlier versions
            };
        }
    }
    
    
    func hexStringToUIColor(hexColor: String) -> UIColor {
        let stringScanner = Scanner(string: hexColor)
        
        if(hexColor.hasPrefix("#")) {
            stringScanner.scanLocation = 1
        }
        var color: UInt32 = 0
        stringScanner.scanHexInt32(&color)
        
        let r = CGFloat(Int(color >> 16) & 0x000000FF)
        let g = CGFloat(Int(color >> 8) & 0x000000FF)
        let b = CGFloat(Int(color) & 0x000000FF)
        
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
    }
    
    
    @available(iOS 11.0, *)
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }
    
    @available(iOS 11.0, *)
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: UIImage.self)
    }
    
    @available(iOS 11.0, *)
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        let formatter = DateComponentsFormatter()

        for dragItem in session.items {
            // 2
            dragItem.itemProvider.loadObject(ofClass: UIImage.self, completionHandler: { object, error in
                // 3
                guard error == nil else { return print("Failed to load our dragged item") }
                guard let draggedImage = object as? UIImage else { return }
                // 4
                DispatchQueue.main.async {
                    let imageData = draggedImage.jpegData(compressionQuality: 0.7);
                    let timeInterval = NSDate().timeIntervalSince1970
                    let timeIntervalInString = formatter.string(from: timeInterval)!;
                    let name =  timeIntervalInString.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: ":", with: "") + ".jpeg";
                    
                    guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(name) else {
                        return
                    }
                    do {
                        try imageData!.write(to: imageURL, options: Data.WritingOptions.atomic)
                        
                        if self.onDrop != nil {
                            self.onDrop!([
                                "url": imageURL.absoluteString,
                                "width": draggedImage.size.width,
                                "height": draggedImage.size.height,
                                "mime": "image/jpeg",
                                "size": imageData?.count ?? 0
                            ])
                        }
                    } catch {
                        
                    }
                    
                }
            })
        }
    }
}
