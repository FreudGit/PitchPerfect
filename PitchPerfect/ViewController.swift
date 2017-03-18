//
//  ViewController.swift
//  PitchPerfect
//
//  Created by François Hébert on 2017-03-18.
//  Copyright © 2017 francois. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnStopRecord: UIButton!
    @IBOutlet weak var btnRecord: UIButton!
    @IBOutlet weak var lblRecording: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any ad   ditional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(_ sender: Any) {
        lblRecording.text = "Recordong in progress..."

        print("record button was ressed")
    }

    @IBAction func stopRecording(_ sender: Any) {
        print("stop recording")

    }
}

