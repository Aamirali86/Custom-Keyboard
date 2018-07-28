//
//  ViewController.swift
//  Custom Keyboard
//
//  Created by Amir on 28/07/2018.
//  Copyright © 2018 Techy tech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet var textView: UITextView!
  
  let imageNames : [String] = ["Accordian", "Bar Dice", "Beastie", "Bratwurst", "Bronze Fonz’s Thumbs", "Cheesehead (Female)", "Cheesehead (Male)", "One Mitchell Park Dome", "The Mitchell Park Domes", "Hoan Bridge", "Lake Michigan", "Laverne", "The Milverine", "The Milwaukee Flag", "Old Fashioned", "Rumchata", "Shirley", "Mark di Suervo’s “The Calling”", "Shorts & Melting Snow (Female)", "Shorts & Melting Snow (Male)"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.text = imageNames[indexPath.row]
    cell.imageView!.image = UIImage(named: imageNames[indexPath.row])
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return imageNames.count
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

