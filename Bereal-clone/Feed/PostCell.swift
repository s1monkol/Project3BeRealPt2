//
//  PostCell.swift
//  Bereal-clone
//
//  Created by Semen Kolesnykov on 2/16/25.
//

import UIKit
import Alamofire
import AlamofireImage

class PostCell: UITableViewCell {
    
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var caption: UILabel!
    @IBOutlet weak var dates: UILabel!
    @IBOutlet weak var blur: UIVisualEffectView!
    
    private var imageDataRequest: DataRequest?
    
    func configure(with post: Post) {
        
        if let user = post.user {
            userName.text = user.username
        }

        
        if let imageFile = post.imageFile,
           let imageUrl = imageFile.url {
            
            
            imageDataRequest = AF.request(imageUrl).responseImage { [weak self] response in
                switch response.result {
                case .success(let image):
                    // Set image view image with fetched image
                    self?.postImage.image = image
                case .failure(let error):
                    print("❌ Error fetching image: \(error.localizedDescription)")
                    break
                }
            }
        }

        // Caption
        caption.text = post.caption
        if let user = Users.current{
            if user.lastPostedDate == nil{
                blur.isHidden = true
            }
        }
        
        // Date
        if let date = post.createdAt {
            dates.text = DateFormatter.postFormatter.string(from: date)
        }
        
        if let currentUser = Users.current,

            // Get the date the user last shared a post (cast to Date).
           let lastPostedDate = currentUser.lastPostedDate,
        
            // Get the date the given post was created.
           let postCreatedDate = post.createdAt,

           
           let diffHours = Calendar.current.dateComponents([.hour], from: postCreatedDate, to: lastPostedDate).hour {

           
            blur.isHidden = abs(diffHours) < 24
        } else {

            
            blur.isHidden = false
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        postImage.image = nil

        
        imageDataRequest?.cancel()
    }

}
