//
//  CameraViewController.swift
//  karton-ios
//
//  Created by Ece Azizoğlu on 27.08.2020.
//  Copyright © 2020 Ece Azizoğlu. All rights reserved.
//

import UIKit
import AVFoundation
import CoreVideo
import MLKit

class CameraViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    private var isUsingFrontCamera = false
    private var previewLayer: AVCaptureVideoPreviewLayer!
    private lazy var captureSession = AVCaptureSession()
    private lazy var sessionQueue = DispatchQueue(label: Constant.sessionQueueLabel)
    private var lastFrame: CMSampleBuffer?
    private var recognizedText: Text!
    
    private lazy var previewOverlayView: UIImageView = {

       precondition(isViewLoaded)
       let previewOverlayView = UIImageView(frame: .zero)
       previewOverlayView.contentMode = UIView.ContentMode.scaleAspectFill
       previewOverlayView.translatesAutoresizingMaskIntoConstraints = false
       return previewOverlayView
     }()

     private lazy var annotationOverlayView: UIView = {
       precondition(isViewLoaded)
       let annotationOverlayView = UIView(frame: .zero)
       annotationOverlayView.translatesAutoresizingMaskIntoConstraints = false
       return annotationOverlayView
     }()


  

    // MARK: - IBOutlets

    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var textView: UITextView!
    
    // MARK: - IBActions
    

    @IBAction func detectTextAction(_ sender: UIButton) {
        textView.text = recognizedText.text
    }
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        setUpPreviewOverlayView()
        setUpAnnotationOverlayView()
        setUpCaptureSessionOutput()
        setUpCaptureSessionInput()
    }
    
    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)

      startSession()
    }

    override func viewDidDisappear(_ animated: Bool) {
      super.viewDidDisappear(animated)

      stopSession()
    }

    override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()

      previewLayer.frame = cameraView.frame
    }
    
    private func recognizeTextOnDevice(in image: VisionImage, width: CGFloat, height: CGFloat) {
      do {
        recognizedText = try TextRecognizer.textRecognizer().results(in: image)
      } catch let error {
        print("Failed to recognize text with error: \(error.localizedDescription).")
        return
      }
      DispatchQueue.main.sync {
        self.updatePreviewOverlayView()
        self.removeDetectionAnnotations()

        // Blocks.
        for block in recognizedText.blocks {
          let points = self.convertedPoints(from: block.cornerPoints, width: width, height: height)
          UIUtilities.addShape(
            withPoints: points,
            to: self.annotationOverlayView,
            color: UIColor.orange
          )
          
          // Lines.
          for line in block.lines {
            let points = self.convertedPoints(from: line.cornerPoints, width: width, height: height)
            UIUtilities.addShape(
              withPoints: points,
              to: self.annotationOverlayView,
              color: UIColor.purple
            )

            // Elements.
            for element in line.elements {
              let normalizedRect = CGRect(
                x: element.frame.origin.x / width,
                y: element.frame.origin.y / height,
                width: element.frame.size.width / width,
                height: element.frame.size.height / height
              )
              let convertedRect = self.previewLayer.layerRectConverted(
                fromMetadataOutputRect: normalizedRect
              )
              UIUtilities.addRectangle(
                convertedRect,
                to: self.annotationOverlayView,
                color: UIColor.green
              )
              let label = UILabel(frame: convertedRect)
              label.text = element.text
              label.adjustsFontSizeToFitWidth = true
              self.annotationOverlayView.addSubview(label)
              //print(recognizedText.text)
            }
          }
        }
      }
    }
    
    private func setUpCaptureSessionOutput() {
       sessionQueue.async {
         self.captureSession.beginConfiguration()
         // When performing latency tests to determine ideal capture settings,
         // run the app in 'release' mode to get accurate performance metrics
         self.captureSession.sessionPreset = AVCaptureSession.Preset.medium

         let output = AVCaptureVideoDataOutput()
         output.videoSettings = [
           (kCVPixelBufferPixelFormatTypeKey as String): kCVPixelFormatType_32BGRA,
         ]
         output.alwaysDiscardsLateVideoFrames = true
         let outputQueue = DispatchQueue(label: Constant.videoDataOutputQueueLabel)
         output.setSampleBufferDelegate(self, queue: outputQueue)
         guard self.captureSession.canAddOutput(output) else {
           print("Failed to add capture session output.")
           return
         }
         self.captureSession.addOutput(output)
         self.captureSession.commitConfiguration()
       }
     }

     private func setUpCaptureSessionInput() {
       sessionQueue.async {
         let cameraPosition: AVCaptureDevice.Position =  .back
         guard let device = self.captureDevice(forPosition: cameraPosition) else {
           print("Failed to get capture device for camera position: \(cameraPosition)")
           return
         }
         do {
           self.captureSession.beginConfiguration()
           let currentInputs = self.captureSession.inputs
           for input in currentInputs {
             self.captureSession.removeInput(input)
           }

           let input = try AVCaptureDeviceInput(device: device)
           guard self.captureSession.canAddInput(input) else {
             print("Failed to add capture session input.")
             return
           }
           self.captureSession.addInput(input)
           self.captureSession.commitConfiguration()
         } catch {
           print("Failed to create capture device input: \(error.localizedDescription)")
         }
       }
     }

     private func startSession() {
       sessionQueue.async {
         self.captureSession.startRunning()
       }
     }

     private func stopSession() {
       sessionQueue.async {
         self.captureSession.stopRunning()
       }
     }

     private func setUpPreviewOverlayView() {
        
        
       cameraView.addSubview(previewOverlayView)
       NSLayoutConstraint.activate([
         previewOverlayView.centerXAnchor.constraint(equalTo: cameraView.centerXAnchor),
         previewOverlayView.centerYAnchor.constraint(equalTo: cameraView.centerYAnchor),
         previewOverlayView.leadingAnchor.constraint(equalTo: cameraView.leadingAnchor),
         previewOverlayView.trailingAnchor.constraint(equalTo: cameraView.trailingAnchor),

       ])
     }

     private func setUpAnnotationOverlayView() {
       cameraView.addSubview(annotationOverlayView)
       NSLayoutConstraint.activate([
         annotationOverlayView.topAnchor.constraint(equalTo: cameraView.topAnchor),
         annotationOverlayView.leadingAnchor.constraint(equalTo: cameraView.leadingAnchor),
         annotationOverlayView.trailingAnchor.constraint(equalTo: cameraView.trailingAnchor),
         annotationOverlayView.bottomAnchor.constraint(equalTo: cameraView.bottomAnchor),
       ])
     }

     private func captureDevice(forPosition position: AVCaptureDevice.Position) -> AVCaptureDevice? {
       if #available(iOS 10.0, *) {
         let discoverySession = AVCaptureDevice.DiscoverySession(
           deviceTypes: [.builtInWideAngleCamera],
           mediaType: .video,
           position: .unspecified
         )
         return discoverySession.devices.first { $0.position == position }
       }
       return nil
     }
    
    private func removeDetectionAnnotations() {
       for annotationView in annotationOverlayView.subviews {
         annotationView.removeFromSuperview()
       }
     }

     private func updatePreviewOverlayView() {
       guard let lastFrame = lastFrame,
         let imageBuffer = CMSampleBufferGetImageBuffer(lastFrame)
       else {
         return
       }
       let ciImage = CIImage(cvPixelBuffer: imageBuffer)
       let context = CIContext(options: nil)
       guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else {
         return
       }
       let rotatedImage = UIImage(cgImage: cgImage, scale: Constant.originalScale, orientation: .up)
       previewOverlayView.image = rotatedImage
     }

     private func convertedPoints(
       from points: [NSValue]?,
       width: CGFloat,
       height: CGFloat
     ) -> [NSValue]? {
       return points?.map {
         let cgPointValue = $0.cgPointValue
         let normalizedPoint = CGPoint(x: cgPointValue.x / width, y: cgPointValue.y / height)
         let cgPoint = previewLayer.layerPointConverted(fromCaptureDevicePoint: normalizedPoint)
         let value = NSValue(cgPoint: cgPoint)
         return value
       }
     }

     private func normalizedPoint(
       fromVisionPoint point: VisionPoint,
       width: CGFloat,
       height: CGFloat
     ) -> CGPoint {
       let cgPoint = CGPoint(x: point.x, y: point.y)
       var normalizedPoint = CGPoint(x: cgPoint.x / width, y: cgPoint.y / height)
       normalizedPoint = previewLayer.layerPointConverted(fromCaptureDevicePoint: normalizedPoint)
       return normalizedPoint
     }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
 

}

// MARK: AVCaptureVideoDataOutputSampleBufferDelegate

extension CameraViewController {

  func captureOutput(
    _ output: AVCaptureOutput,
    didOutput sampleBuffer: CMSampleBuffer,
    from connection: AVCaptureConnection
  ) {
    guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
      print("Failed to get image buffer from sample buffer.")
      return
    }
    lastFrame = sampleBuffer
    let visionImage = VisionImage(buffer: sampleBuffer)
    let orientation = UIUtilities.imageOrientation(
      fromDevicePosition: .back
    )

    visionImage.orientation = orientation
    let imageWidth = CGFloat(CVPixelBufferGetWidth(imageBuffer))
    let imageHeight = CGFloat(CVPixelBufferGetHeight(imageBuffer))
      recognizeTextOnDevice(in: visionImage, width: imageWidth, height: imageHeight)
  
  }
}

private enum Constant {
  static let videoDataOutputQueueLabel = "com.google.mlkit.visiondetector.VideoDataOutputQueue"
  static let sessionQueueLabel = "com.google.mlkit.visiondetector.SessionQueue"
  static let originalScale: CGFloat = 1.0
 
}
