//
//  RecordsVC+Extension.swift
//  Dictaphone
//
//  Created by Артём on 07.05.2022.
//

import Foundation
import UIKit


extension RecordsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        cell.configure(name: names[indexPath.row], time: time[indexPath.row], date: dates[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else { return }
        
        controller.modalTransitionStyle = .coverVertical
        
        controller.date = dates[indexPath.row]
        controller.name = names[indexPath.row]
        print(names[indexPath.row])
        print(dates[indexPath.row])

        present(controller, animated: true)
    }
    
}
