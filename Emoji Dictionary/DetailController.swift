//
//  DetailController.swift
//  Emoji Dictionary
//
//  Created by Jasmit Tarang on 10/9/18.
//  Copyright © 2018 Jasmit Tarang. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    
    var emojiHeader = "🔒"
    var emojiText = "Lock"
    @IBOutlet weak var emojiIcon: UILabel!
    @IBOutlet weak var emojiLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emojiIcon.text = emojiHeader
        emojiLable.text = emojiText
    }

    override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
    }

}
