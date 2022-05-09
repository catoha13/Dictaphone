//
//  DetailsViewController.swift
//  Dictaphone
//
//  Created by Артём on 07.05.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var recordNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    //MARK: var/let
    var recorder: AGAudioRecorder = AGAudioRecorder(withFileName: "newRecord")
    var time = ""
    var name = ""
    var date = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recordNameLabel.text = name
        dateLabel.text = date
        timeLabel.text = time
    }
    
    //MARK: IBActions
    @IBAction func playButton(_ sender: UIButton) {
        recorder.doPlay()
    }
    

}
