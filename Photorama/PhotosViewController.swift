//
//  PhotosViewController.swift
//  Photorama
//
//  Created by FERNANDO ITO on 2018-03-19.
//  Copyright © 2018 Centennial College. All rights reserved.
//  PhotosViewController.swift - Photorama User Interface
//  GitHub: https://github.com/300960367/Photorama2

//import Foundation
import UIKit

class PhotosViewController: UIViewController, UICollectionViewDelegate {

    @IBOutlet var collectionView: UICollectionView!
    
    var store: PhotoStore!
    let photoDataSource = PhotoDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = photoDataSource
        collectionView.delegate = self
        
        store.fetchInterestingPhotos {
            (photosResult) -> Void in
            
            switch photosResult {
            case let .success(photos):
                print ("Successfully found \(photos.count) photos.")
                self.photoDataSource.photos = photos
            case let .failure(error):
                print ("Error fetching interesting photos: \(error)")
                self.photoDataSource.photos.removeAll()
            }
            self.collectionView.reloadSections(IndexSet(integer: 0))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
    
        let photo = photoDataSource.photos[indexPath.row]
    
        //Download the image data, which could take some time
        store.fetchImage(for: photo) { (result) -> Void in
    
            //The index path for the photo might have changed between the
            // time the request started and finished, so find the most
            // recent index path
    
            // (Note: You will have an error on the next line; you will fix it soon)
            guard let photoIndex = self.photoDataSource.photos.index(of: photo),
                case let .success(image) = result else {
                    return
            }
            let photoIndexPath = IndexPath(item: photoIndex, section: 0)
    
            //When the request finishes, only update the cell if it's still visible
            if let cell = self.collectionView.cellForItem(at: photoIndexPath)
                                                        as? PhotoCollectionViewCell {
                cell.update(with: image)
            } // if
        } // store.fetchImage
    } // function
} // class

