//
//  PhotoDataSource.swift
//  Photorama
//
//  Created by FERNANDO ITO on 2018-03-19.
//  Copyright © 2018 Centennial College. All rights reserved.
//  GitHub: https://github.com/300960367/Photorama2

import UIKit

class PhotoDataSource: NSObject, UICollectionViewDataSource {
    
    var photos = [Photo]()
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "PhotoCollectionViewCell"
        let cell =
            collectionView.dequeueReusableCell(withReuseIdentifier: identifier,
                                               for: indexPath) as! PhotoCollectionViewCell
        
        return cell
    }
}
