//
//  UIImage.colors.swift
//
//  Pods-UIExt_Example
//
//  Created by chapayGhub on 12/25/17.
//

import UIKit

extension UIImage {
  public class func with(color: UIColor, size: CGSize=CGSize(width: 1, height: 1)) -> UIImage? {
    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    color.setFill()
    UIRectFill(CGRect(origin: CGPoint.zero, size: size))
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image ?? UIImage()
  }
  
  var facecFrames: [CGRect] {
    guard let cgImage = self.cgImage else { return [] }
    
    let ciImage = CIImage(cgImage: cgImage)
    
    let options = [CIDetectorAccuracy: CIDetectorAccuracyHigh]
    let detector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: options)
    
    if let features = detector?.features(in: ciImage) {
      return features.flatMap{ $0.type == CIFeatureTypeFace ? $0.bounds : nil }
    }
    
    return []
  }
}

extension UIImage {
  
  public func colored(_ color: UIColor) -> UIImage? {
    var newImage: UIImage?
    
    UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
    if let context = UIGraphicsGetCurrentContext() {
      context.translateBy(x: 0, y: self.size.height)
      context.scaleBy(x: 1, y: -1)
      context.setBlendMode(.normal)
      
      let rect = CGRect.init(x: 0, y: 0, width: self.size.width, height: self.size.height)
      cgImage.flatMap{ context.clip(to: rect, mask: $0) }
      color.setFill()
      context.fill(rect)
      
      newImage = UIGraphicsGetImageFromCurrentImageContext()
    }
    UIGraphicsEndImageContext()
    
    return newImage;
  }  

  // colorize image with given tint color
  // this is similar to Photoshop's "Color" layer blend mode
  // this is perfect for non-greyscale source images, and images that have both highlights and shadows that should be preserved
  // white will stay white and black will stay black as the lightness of the image is preserved
  public func tint(_ tintColor: UIColor) -> UIImage {
    
    return modifiedImage { context, rect in
      guard let cgImage = cgImage else {
        return
      }
      
      // draw black background - workaround to preserve color of partially transparent pixels
      context.setBlendMode(.normal)
      UIColor.black.setFill()
      context.fill(rect)
      
      // draw original image
      context.setBlendMode(.normal)
      context.draw(cgImage, in: rect)
      
      // tint image (loosing alpha) - the luminosity of the original image is preserved
      context.setBlendMode(.color)
      tintColor.setFill()
      context.fill(rect)
      
      // mask by alpha values of original image
      context.setBlendMode(.destinationIn)
      context.draw(self.cgImage!, in: rect)
    }
  }
  
  // fills the alpha channel of the source image with the given color
  // any color information except to the alpha channel will be ignored
  public func fillAlpha(_ fillColor: UIColor) -> UIImage {
    return modifiedImage { context, rect in
      guard let cgImage = cgImage else {
        return
      }
      // draw tint color
      context.setBlendMode(.normal)
      fillColor.setFill()
      context.fill(rect)
      //            context.fillCGContextFillRect(context, rect)
      
      // mask by alpha values of original image
      context.setBlendMode(.destinationIn)
      context.draw(cgImage, in: rect)
    }
  }
  
  private func modifiedImage( draw: (CGContext, CGRect) -> ()) -> UIImage {
    var resultImage: UIImage?
    
    // using scale correctly preserves retina images
    UIGraphicsBeginImageContextWithOptions(size, false, scale)
    
    if let context = UIGraphicsGetCurrentContext() {
      // correctly rotate image
      context.translateBy(x: 0, y: size.height)
      context.scaleBy(x: 1.0, y: -1.0)
      
      let rect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
      
      draw(context, rect)
      
      resultImage = UIGraphicsGetImageFromCurrentImageContext()
    }
    
    UIGraphicsEndImageContext()
    
    return resultImage ?? self
  }
}
