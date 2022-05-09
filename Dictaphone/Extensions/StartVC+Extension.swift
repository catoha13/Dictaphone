//
//  StartVC+Extension.swift
//  Dictaphone
//
//  Created by Артём on 07.05.2022.
//

import Foundation
import UIKit


extension StartViewController {
    
    //MARK: Show Records List
    func showRecordsList() {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "RecordsViewController") as? RecordsViewController else { return }
        
        navigationController?.pushViewController(controller, animated: true)
    }
}
    //MARK: Audio recoreder delegate
extension StartViewController: AGAudioRecorderDelegate {
    func agAudioRecorder(_ recorder: AGAudioRecorder, withStates state: AGAudioRecorderState) {
        switch state {
        case .error(let e): debugPrint(e)
        case .Failed(let s): debugPrint(s)
            
        case .Finish:
            recordButton.setTitle("Recode", for: .normal)
            timerLabel.isHidden = true
            
        case .Recording:
            recordButton.setTitle("Recoding Finished", for: .normal)
            timerLabel.isHidden = false
            
        case .Pause:
            playButton.setTitle("Pause", for: .normal)
            
        case .Play:
            playButton.setTitle("Play", for: .normal)
            
        case .Ready:
            recordButton.setTitle("Recode", for: .normal)
            playButton.setTitle("Play", for: .normal)
            recordButton.setTitle("Refresh", for: .normal)
        }
        debugPrint(state)
    }
    
    func agAudioRecorder(_ recorder: AGAudioRecorder, currentTime timeInterval: TimeInterval, formattedString: String) {
//        debugPrint(formattedString)
        timerLabel.text = formattedString
    }
}
