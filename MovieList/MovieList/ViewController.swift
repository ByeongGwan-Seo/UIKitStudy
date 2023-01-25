//
//  ViewController.swift
//  MovieList
//
//  Created by seobyeonggwan on 2023/01/16.
//

import UIKit

class ViewController: UIViewController {

    var movieModel: MovieModel?
    var networkService = NetworkService()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var movieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTableView.delegate = self
        movieTableView.dataSource = self
        
        searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        networkService.requestMovieAPI { model in
            self.movieModel = model
            print("4")
            DispatchQueue.main.async {
                self.movieTableView.reloadData()
                print("6")
            }
            print("5")
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = UIStoryboard(name: "DetailInfoViewController", bundle: nil).instantiateViewController(withIdentifier: "DetailInfoViewController") as? DetailInfoViewController else { return }
        
        detailVC.movieDetail = self.movieModel?.results[indexPath.row]
        
        tableView.deselectRow(at: indexPath, animated: true)
        present(detailVC, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell else { return UITableViewCell()}
        
        cell.titleLabel.text = movieModel?.results[indexPath.row].trackName
        cell.movieImageView.image = UIImage()
        cell.descriptionLabel.text = movieModel?.results[indexPath.row].shortDescription
        
        let currency = movieModel?.results[indexPath.row].currency ?? ""
        let price = movieModel?.results[indexPath.row].trackPrice ?? 0
        
        cell.priceLabel.text = String(price) + " " + currency
        
        if let hasURL = movieModel?.results[indexPath.row].artworkUrl100 {
            networkService.loadImage(urlString: hasURL) { image in
                DispatchQueue.main.async {
                    cell.movieImageView.image = image
                }
            }
        }
        
        if let isoString = movieModel?.results[indexPath.row].releaseDate {
            let isoFormatter = ISO8601DateFormatter()
            if let isoDate = isoFormatter.date(from: isoString) {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy. MM. dd"
                let dateString = dateFormatter.string(from: isoDate)
                
                cell.dateLabel.text = dateString
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieModel?.results.count ?? 1
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.networkService.term = searchBar.text ?? ""
        networkService.requestMovieAPI { model in
            self.movieModel = model
            DispatchQueue.main.async {
                self.movieTableView.reloadData()
            }
        }
        self.view.endEditing(true)
    }
}


