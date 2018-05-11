//
//  ViewController.swift
//  SmartCam
//
//  Created by Mayank Daswani on 5/11/18.
//  Copyright © 2018 Mayank Daswani. All rights reserved.
//

import UIKit
import AVKit
import Vision

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //start up camera
        let capturesession = AVCaptureSession()
        
        guard let captureDevice = AVCaptureDevice.default(for: .video) else{return}
        
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else{return}
        capturesession.addInput(input
        )
        
        capturesession.startRunning()
        
        let previewlayer = AVCaptureVideoPreviewLayer(session: capturesession)
        view.layer.addSublayer(previewlayer)
        previewlayer.frame = view.frame
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        capturesession.addOutput(dataOutput)
        
        //let request = VNCoreMLRequest(model: <#T##VNCoreMLModel#>, completionHandler: <#T##VNRequestCompletionHandler?##VNRequestCompletionHandler?##(VNRequest, Error?) -> Void#>)
        //VNImageRequestHandler(cgImage: <#T##CGImage#>, options: <#T##[VNImageOption : Any]#>).perform(request)
        
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        print("snapshot taken", Date())
        
        guard let pixelbuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {retun}
        VNImageRequestHandler(cvPixelBuffer: pixelbuffer, options: <#T##[VNImageOption : Any]#>)
        
    }
    
}

