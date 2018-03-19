//
//  Photo.swift
//  Photorama
//
//  Created by FERNANDO ITO on 2018-03-12.
//  Copyright © 2018 Centennial College. All rights reserved.
//  Photo.swift - represents each photo that is returned from the web service request.
//  GitHub: https://github.com/300960367/Photorama1

import Foundation

class Photo {
    
    let title: String
    let remoteURL: URL
    let photoID: String
    let dateTaken: Date
    
    init(title: String, photoID: String, remoteURL: URL, dateTaken: Date) {
        self.title = title
        self.photoID = photoID
        self.remoteURL = remoteURL
        self.dateTaken = dateTaken
    }
}
