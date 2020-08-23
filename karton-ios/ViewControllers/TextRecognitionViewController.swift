//
//  TextRecognitionViewController.swift
//  karton-ios
//
//  Created by Ece Azizoğlu on 14.08.2020.
//  Copyright © 2020 Ece Azizoğlu. All rights reserved.
//

import UIKit
import MLKit
import MLKitTextRecognition


extension TextRecognitionViewController: UIPickerViewDelegate, UIPickerViewDataSource {

  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return Constants.images.count
  }

  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)
    -> String?
  {
    return Constants.images[row].name
  }

  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    removeDetectionAnnotations()
    let imageDisplay = Constants.images[row]
    image.image = UIImage(named: imageDisplay.file)
  }
}

class TextRecognitionViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var findTextButton: UIButton!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBAction func findText(_ sender: UIButton) {
        runTextRecognition(with: image.image!)
    }
    
    func runTextRecognition(with image: UIImage) {
      let visionImage = VisionImage(image: image)
      textRecognizer.process(visionImage) { features, error in
        self.processResult(from: features, error: error)
      }
    }
    
    func processResult(from text: Text?, error: Error?) {
      removeDetectionAnnotations()
      guard error == nil, let text = text else {
        let errorString = error?.localizedDescription ?? Constants.detectionNoResultsMessage
        print("Text recognizer failed with error: \(errorString)")
        return
      }

      let transform = self.transformMatrix()

      // Blocks.
      for block in text.blocks {
        drawFrame(block.frame, in: .purple, transform: transform)

        // Lines.
        for line in block.lines {
          drawFrame(line.frame, in: .orange, transform: transform)

          // Elements.
          for element in line.elements {
            drawFrame(element.frame, in: .green, transform: transform)

            let transformedRect = element.frame.applying(transform)
            let label = UILabel(frame: transformedRect)
            label.text = element.text
            label.adjustsFontSizeToFitWidth = true
            self.annotationOverlayView.addSubview(label)
          }
        }
      }
    }
    
    private func drawFrame(_ frame: CGRect, in color: UIColor, transform: CGAffineTransform) {
      let transformedRect = frame.applying(transform)
      UIUtilities.addRectangle(
        transformedRect,
        to: self.annotationOverlayView,
        color: color
      )
    }

    private func drawPoint(_ point: VisionPoint, in color: UIColor, transform: CGAffineTransform) {
      let transformedPoint = pointFrom(point).applying(transform)
      UIUtilities.addCircle(
        atPoint: transformedPoint,
        to: annotationOverlayView,
        color: color,
        radius: Constants.smallDotRadius)
    }

    private func pointFrom(_ visionPoint: VisionPoint) -> CGPoint {
      return CGPoint(x: visionPoint.x, y: visionPoint.y)
    }

    private func transformMatrix() -> CGAffineTransform {
      guard let imageView = image.image else { return CGAffineTransform() }
      let imageViewWidth = image.frame.size.width
      let imageViewHeight = image.frame.size.height
      let imageWidth = imageView.size.width
      let imageHeight = imageView.size.height

      let imageViewAspectRatio = imageViewWidth / imageViewHeight
      let imageAspectRatio = imageWidth / imageHeight
      let scale =
        (imageViewAspectRatio > imageAspectRatio)
        ? imageViewHeight / imageHeight : imageViewWidth / imageWidth

      // Image view's `contentMode` is `scaleAspectFit`, which scales the image to fit the size of the
      // image view by maintaining the aspect ratio. Multiple by `scale` to get image's original size.
      let scaledImageWidth = imageWidth * scale
      let scaledImageHeight = imageHeight * scale
      let xValue = (imageViewWidth - scaledImageWidth) / CGFloat(2.0)
      let yValue = (imageViewHeight - scaledImageHeight) / CGFloat(2.0)

      var transform = CGAffineTransform.identity.translatedBy(x: xValue, y: yValue)
      transform = transform.scaledBy(x: scale, y: scale)
      return transform
    }

    
    
    /// An overlay view that displays detection annotations.
     private lazy var annotationOverlayView: UIView = {
       precondition(isViewLoaded)
       let annotationOverlayView = UIView(frame: .zero)
       annotationOverlayView.translatesAutoresizingMaskIntoConstraints = false
       return annotationOverlayView
     }()

     private lazy var resultsAlertController: UIAlertController = {
       let alertController = UIAlertController(
         title: "Detection Results",
         message: nil,
         preferredStyle: .actionSheet)
       alertController.addAction(
         UIAlertAction(title: "OK", style: .destructive) { _ in
           alertController.dismiss(animated: true, completion: nil)
         })
       return alertController
     }()

     private lazy var textRecognizer = TextRecognizer.textRecognizer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        image.addSubview(annotationOverlayView)
           NSLayoutConstraint.activate([
             annotationOverlayView.topAnchor.constraint(equalTo: image.topAnchor),
             annotationOverlayView.leadingAnchor.constraint(equalTo: image.leadingAnchor),
             annotationOverlayView.trailingAnchor.constraint(equalTo: image.trailingAnchor),
             annotationOverlayView.bottomAnchor.constraint(equalTo: image.bottomAnchor),
           ])
           pickerView.dataSource = self
           pickerView.delegate = self
           pickerView.selectRow(0, inComponent: 0, animated: false)
         }
    
    /// Removes the detection annotations from the annotation overlay view.
    private func removeDetectionAnnotations() {
      for annotationView in annotationOverlayView.subviews {
        annotationView.removeFromSuperview()
      }
    }

    }

// MARK: - Fileprivate

fileprivate enum Constants {
  static let lineWidth: CGFloat = 3.0
  static let lineColor = UIColor.yellow.cgColor
  static let fillColor = UIColor.clear.cgColor
  static let smallDotRadius: CGFloat = 5.0
  static let largeDotRadius: CGFloat = 10.0
  static let detectionNoResultsMessage = "No results returned."

  static let images = [
    ImageDisplay(file: "1st.jpg", name: "1st"),
    ImageDisplay(file: "2nd.jpg", name: "2nd"),
  ]
}

struct ImageDisplay {
  let file: String
  let name: String
}
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


