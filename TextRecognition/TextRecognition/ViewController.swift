//
//  ViewController.swift
//  TextRecognition
//
//  Created by James Lea on 1/27/24.
//

import Vision
import UIKit

class ViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = .red
        label.text = "starting......"
        label.textColor = .black
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "example1")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(imageView)
        
        
        recognizeText(image: imageView.image)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = CGRect(x: 20,
                                 y: view.safeAreaInsets.top,
                                 width: view.frame.size.width - 40,
                                 height: view.frame.size.width - 40)
        label.frame = CGRect(x: 20, 
                             y: view.frame.size.width - 40 + view.safeAreaInsets.top,
                             width: view.frame.size.width - 40,
                             height: 200)
    }

    func recognizeText(image: UIImage?) {
        guard let cgImage = image?.cgImage else {
            fatalError("could not get cgImage")
        }
        
        //Handler
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        
        //Request
        let request = VNDetectRectanglesRequest { request, error in
            guard let observations = request.results as? [VNRecognizedTextObservation], error == nil else { return }
            
            
            let text = observations.compactMap({
                $0.topCandidates(1).first?.string
            }).joined(separator: ", ")
            
            DispatchQueue.main.async {
                self.label.text = text
                
            }
            
        }
        
        //Process
        do {
            try handler.perform([request])
        } catch {
            label.text = "\(error)"
        }
        
    }
}

