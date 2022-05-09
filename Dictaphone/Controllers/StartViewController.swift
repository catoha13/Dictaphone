//
//  ViewController.swift
//  Dictaphone
//
//  Created by Артём on 07.05.2022.
//

import UIKit
import AVFoundation

class StartViewController: UIViewController {

    
    
    //MARK: IBOutlets
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    //MARK: let/var
    var state: AGAudioRecorderState = .Ready
    var recorder: AGAudioRecorder = AGAudioRecorder(withFileName: "newRecord")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recorder.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func recordButtonPressed(_ sender: UIButton) {
        recorder.doRecord()
    }
    
    @IBAction func listButtonPressed(_ sender: UIButton) {
        showRecordsList()
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        recorder.doPlay()
    }
}



