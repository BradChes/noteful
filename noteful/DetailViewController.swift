//
//  DetailViewController.swift
//  noteful
//
//  Created by Bradley Chesworth on 31/05/2020.
//  Copyright © 2020 Brad Chesworth. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var noteBody: UITextView!
    
    var note: Note?

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        noteBody.text = note?.body
    }
    
    @objc func adjustForKeyboard(notification: Notification) {
        let userInfo = notification.userInfo!

        let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            noteBody.contentInset = UIEdgeInsets.zero
        } else {
            noteBody.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height, right: 0)
        }

        noteBody.scrollIndicatorInsets = noteBody.contentInset

        let selectedRange = noteBody.selectedRange
        noteBody.scrollRangeToVisible(selectedRange)
    }
}
