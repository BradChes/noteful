//
//  TableViewController.swift
//  noteful
//
//  Created by Bradley Chesworth on 31/05/2020.
//  Copyright © 2020 Brad Chesworth. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    private var notes: [Note] = [Note(title: "Test title", body: "Test Body")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Noteful 🗒"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Note", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row].title
        cell.detailTextLabel?.text = notes[indexPath.row].body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

