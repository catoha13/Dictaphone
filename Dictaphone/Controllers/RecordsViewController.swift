//
//  RecordsViewController.swift
//  Dictaphone
//
//  Created by Артём on 07.05.2022.
//

import UIKit

class RecordsViewController: UIViewController {
    
    var state: AGAudioRecorderState = .Ready
    var names = [String]()
    var dates = [String]()
    var time = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFile()
        
    }
    
    func loadFile() {
        do {
            // Get the document directory url
            let documentDirectory = try FileManager.default.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: true
            )
            print("documentDirectory", documentDirectory.path)
            // Get the directory contents urls (including subfolders urls)
            var directoryContents = try FileManager.default.contentsOfDirectory(
                at: documentDirectory,
                includingPropertiesForKeys: nil
            )
            print("directoryContents:", directoryContents.map { $0.localizedName ?? $0.lastPathComponent })
            directoryContents.removeFirst()
            for url in directoryContents {
                //                print("Name: " + (url.localizedName ?? "") )
                //                print(url.dateCreation ?? url.lastPathComponent)
                names.append((url.localizedName ?? ""))
                let formatterDate = DateFormatter()
                formatterDate.dateFormat = "dd.MM.yy"
                let formatterTime = DateFormatter()
                formatterTime.dateFormat = "hh:mm"
                time.append(formatterTime.string(from: url.dateCreation ?? Date()))
                dates.append(formatterDate.string(from: url.dateCreation ?? Date()))
            }
        } catch {
            print(error)
        }
    }
    
}

extension URL {
    var typeIdentifier: String? { (try? resourceValues(forKeys: [.typeIdentifierKey]))?.typeIdentifier }
    var isM4A: Bool { typeIdentifier == "newRecord 1.m4a" }
    var localizedName: String? { (try? resourceValues(forKeys: [.localizedNameKey]))?.localizedName }
    var dateCreation: Date? { (try? resourceValues(forKeys: [.creationDateKey]))?.creationDate}
    var hasHiddenExtension: Bool {
        get { (try? resourceValues(forKeys: [.hasHiddenExtensionKey]))?.hasHiddenExtension == true }
        set {
            var resourceValues = URLResourceValues()
            resourceValues.hasHiddenExtension = newValue
            try? setResourceValues(resourceValues)
        }
    }
}
