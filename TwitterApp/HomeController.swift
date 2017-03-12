//
//  HomeController.swift
//  TwitterApp
//
//  Created by Mehrdad Rafiee on 3/11/17.
//  Copyright © 2017 bepetese. All rights reserved.
//

import UIKit

class WordCell: UICollectionViewCell {
  //this gets called when a cell is dequeed
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  let wordLabel: UILabel = {
    let label = UILabel()
    label.text = "Text text test"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  func setupViews() {
    backgroundColor = .green
    
    addSubview(wordLabel)
    wordLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    wordLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    wordLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    wordLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

class HomeController:UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  let cellId = "cellId"
  let headerId = "headerId"
  let footerId = "footerId"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView?.backgroundColor = .white
    collectionView?.register(WordCell.self, forCellWithReuseIdentifier: cellId)
    collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
    collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerId)
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 50)
  }
  
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
    if kind == UICollectionElementKindSectionHeader {
      let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
      header.backgroundColor = .blue
      return header
    } else {
      let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath)
      footer.backgroundColor = .black
      return footer
    }
    
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: view.frame.width, height: 60)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    return CGSize(width: view.frame.width, height: 80)
  }
}
