//
//  DetailsVC+Extension.swift
//  Dictaphone
//
//  Created by Артём on 08.05.2022.
//

import Foundation
import UIKit

extension DetailsViewController: AGAudioRecorderDelegate {
    func agAudioRecorder(_ recorder: AGAudioRecorder, withStates state: AGAudioRecorderState) {
        switch state {
        case .error(let e): debugPrint(e)
        case .Failed(let s): debugPrint(s)
            
        case .Finish:
            timeLabel.isHidden = false
            
        case .Recording:
            timeLabel.isHidden = false
            
        case .Pause:
            playButton.setTitle("Pause", for: .normal)
            
        case .Play:
            playButton.setTitle("Play", for: .normal)
            
        case .Ready:
            playButton.setTitle("Play", for: .normal)
        }
        debugPrint(state)
    }
    
    func agAudioRecorder(_ recorder: AGAudioRecorder, currentTime timeInterval: TimeInterval, formattedString: String) {
        timeLabel.text = formattedString
    }
}
