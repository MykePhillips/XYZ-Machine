//
//  ViewController.swift
//  XYZ-Machine
//
//  Created by Myke Phillips on 11/09/2018.
//  Copyright © 2018 Myke Phillips. All rights reserved.
//

import UIKit
import CoreMotion

class MainVC: UIViewController {

    @IBOutlet weak var xlabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!

    var motionManager: CMMotionManager!

    override func viewDidLoad() {
        super.viewDidLoad()

        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates(to: .main, withHandler: updateLabels)

    }


    func updateLabels(data: CMAccelerometerData?, error: Error?) {

        guard let accelerometorData = data else { return }

        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1

        let x = formatter.string(for: accelerometorData.acceleration.x)!
        let y = formatter.string(for: accelerometorData.acceleration.y)!
        let z = formatter.string(for: accelerometorData.acceleration.z)!


        xlabel.text = "X: \(x)"
        yLabel.text = "Y: \(y)"
        zLabel.text = "Z: \(z)"









    }


}

