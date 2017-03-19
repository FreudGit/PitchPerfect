//
//  ViewController.swift
//  PitchPerfect
//
//  Created by François Hébert on 2017-03-18.
//  Copyright © 2017 francois. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var btnStopRecord: UIButton!
    @IBOutlet weak var btnRecord: UIButton!
    @IBOutlet weak var lblRecording: UILabel!
    var audioRecorder: AVAudioRecorder!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnStopRecord.isEnabled=false
        btnRecord.isEnabled=true
    }


    @IBAction func recordAudio(_ sender: Any) {
        lblRecording.text = "Recordong in progress..."
        btnStopRecord.isEnabled=true
        btnRecord.isEnabled=false
        print("record button was ressed")


            let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
            let recordingName = "recordedVoice.wav"
            let pathArray = [dirPath, recordingName]
            let filePath = URL(string: pathArray.joined(separator: "/"))

            let session = AVAudioSession.sharedInstance()
            try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)

            try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate=self

            audioRecorder.isMeteringEnabled = true
            audioRecorder.prepareToRecord()
            audioRecorder.record()
    }

    @IBAction func stopRecording(_ sender: Any) {
        print("stop recording")
        btnStopRecord.isEnabled=false
        btnRecord.isEnabled=true
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)

    }

    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("record finished")
        if flag {
            performSegue(withIdentifier: "segueStopRecording", sender: audioRecorder.url)
        } else {
            print("record failed")

        }
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="segueStopRecording"{

            //let vc: UINavigationController = segue.destination as! UINavigationController


            let playSoundsVC = segue.destination as! PlaySoundsViewController


            let recordedAudioURl = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURl;
        }
    }
}

