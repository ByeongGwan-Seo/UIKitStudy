//
//  DetailInfoViewController.swift
//  MovieList
//
//  Created by seobyeonggwan on 2023/01/17.
//

import UIKit
import AVKit

class DetailInfoViewController: UIViewController {

    var movieDetail: Result?
    
    @IBOutlet weak var movieContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = movieDetail?.trackName
        descriptionLabel.text = movieDetail?.longDescription
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let hasURL = movieDetail?.previewUrl {
            makePlayerAndPlay(urlString: hasURL)
        }
    }
    
    func makePlayerAndPlay(urlString: String) {
        if let hasUrl = URL(string: urlString) {
            let player = AVPlayer(url: hasUrl)
            let playerLayer = AVPlayerLayer(player: player)
            
            movieContainer.layer.addSublayer(playerLayer)
            
            playerLayer.frame = movieContainer.bounds
            
            player.play()
        }
    }
}
