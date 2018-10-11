//
//  ViewController.swift
//  Emoji Dictionary
//
//  Created by Jasmit Tarang on 10/7/18.
//  Copyright © 2018 Jasmit Tarang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var emojiTable: UITableView!
    
    var currentEmoji = ""
    var currentEmojiText = ""
    // TODO: Convert array to JSON object
    var emojis = ["🤪,Silly", "🤨,Mad Face", "💩,Poop", "🌵,Cactus", "🐖,Pig", "⛈,Raining", "🤓,Nerdy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        emojiTable.dataSource = self
        emojiTable.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    
    func LoadEmoji(emojiString: String) {
        let emojiSplit = emojiString.split(separator: ",")
        /*
         For somereason `emojiSplit[0]` doesn't work
         It says its a SubString but doing `.first`
         works cause its a Optional and can get the string out of it using `!`
        */
        currentEmoji = String(emojiSplit.first!)
        currentEmojiText = String(emojiSplit.last!)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        LoadEmoji(emojiString: emojis[indexPath.row])
        cell.textLabel?.text = currentEmoji
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        LoadEmoji(emojiString: emojis[indexPath.row])
        performSegue(withIdentifier: "detailView", sender: currentEmoji)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Detail View Controller
        let dvc = segue.destination as! DetailController
        dvc.emojiHeader = currentEmoji
        dvc.emojiText = currentEmojiText
    }
    
    override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
    }
}
