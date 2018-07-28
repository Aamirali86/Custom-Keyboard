//
//  KeyboardViewController.swift
//  emojis
//
//  Created by Amir on 28/07/2018.
//  Copyright © 2018 Techy tech. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

  let emojiList : [String] = ["test1", "test2"]
  var imagePaths : NSArray!
  
  @IBOutlet var fullAccessWarningView: UIView!
  @IBOutlet var emojiCollectionView: UICollectionView!
  
  @IBOutlet var deleteButton: UIButton!
  @IBOutlet var nextKeyboardButton: UIButton!
  
  override func updateViewConstraints() {
    super.updateViewConstraints()
    // Add custom view sizing constraints here
  }
  
  @IBAction func button1(_ sender: AnyObject) {
    imagePaths = Bundle.main.paths(forResourcesOfType: "png", inDirectory: "/array1") as NSArray
    self.emojiCollectionView.reloadData()
  }
  
  @IBAction func button2(_ sender: AnyObject) {
    imagePaths = Bundle.main.paths(forResourcesOfType: "png", inDirectory: "/array2") as NSArray
    self.emojiCollectionView.reloadData()
  }
  
  @IBAction func button3(_ sender: AnyObject) {
    imagePaths = Bundle.main.paths(forResourcesOfType: "png", inDirectory: "/array3") as NSArray
    self.emojiCollectionView.reloadData()
  }
  
  @IBAction func button4(_ sender: AnyObject) {
    imagePaths = Bundle.main.paths(forResourcesOfType: "png", inDirectory: "/array4") as NSArray
    self.emojiCollectionView.reloadData()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let nib = UINib(nibName: "Keyboard", bundle: nil)
    self.view = nib.instantiate(withOwner: self, options: nil).first as! UIView
    
    if(UIPasteboard.general.isKind(of: UIPasteboard.self))
    {
      self.fullAccessWarningView.isHidden = true
    }
    
    emojiCollectionView.register(UINib.init(nibName: "emojiCell", bundle: nil), forCellWithReuseIdentifier: "theOne")
    self.nextKeyboardButton.addTarget(self, action: #selector(UIInputViewController.advanceToNextInputMode), for: .touchUpInside)
    self.deleteButton.addTarget(self.textDocumentProxy, action: #selector(UIKeyInput.deleteBackward), for: .touchUpInside)
    imagePaths = Bundle.main.paths(forResourcesOfType: "png", inDirectory: "/array1") as NSArray
    
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return imagePaths.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell : emojiCell =  emojiCollectionView.dequeueReusableCell(withReuseIdentifier: "theOne", for: indexPath) as! emojiCell
    cell.emojiIMage.contentMode = UIViewContentMode.scaleAspectFit;
    cell.emojiIMage.image = UIImage(contentsOfFile: (imagePaths[indexPath.row] as? String) ?? "")
    cell.copiedView.layer.cornerRadius = 8
    cell.copiedView.layer.masksToBounds = true
    return cell
    
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let selectedCell : emojiCell = emojiCollectionView.cellForItem(at: indexPath) as! emojiCell
    UIPasteboard.general.image = UIImage(contentsOfFile: (imagePaths[indexPath.row] as? String) ?? "")
    
    UIView.animate(withDuration: 0.7, animations: { () -> Void in
      selectedCell.copiedView.isHidden = false
      selectedCell.copiedView.alpha = 1;
    }, completion: { (completed) -> Void in
      UIView.animate(withDuration: 0.7, delay: 1, options: UIViewAnimationOptions.curveEaseOut, animations: { () -> Void in
        selectedCell.copiedView.alpha = 0
      }, completion: { (completed) -> Void in
        selectedCell.copiedView.isHidden = true
      })
    })
    
    //selectedCell.copiedView.hidden = false
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 54, height: 51);
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 40;
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0;
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsetsMake(15, 15, 15, 15);
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated
  }
  
  override func textWillChange(_ textInput: UITextInput?) {
    // The app is about to change the document's contents. Perform any preparation here.
  }
  
  override func textDidChange(_ textInput: UITextInput?) {
    // The app has just changed the document's contents, the document context has been updated.
    
  }

}
