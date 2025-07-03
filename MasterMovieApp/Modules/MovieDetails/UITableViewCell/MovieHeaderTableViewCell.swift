//
//  MovieHeaderTableViewCell.swift
//  MasterMovieApp
//
//  Created by MacBook Pro on 02/07/2025.
//

import UIKit

class MovieHeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var tagLineLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var releaseDataLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var genreCollectionView: UICollectionView!{
        didSet {
            genreCollectionView.dataSource = self
            genreCollectionView.delegate = self
            genreCollectionView.register(UINib(nibName: "GenreCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GenreCollectionViewCell")
        }
    }
    @IBOutlet weak var productionCompaniesCollectionView: UICollectionView! {
        didSet {
            productionCompaniesCollectionView.dataSource = self
            productionCompaniesCollectionView.delegate = self
            productionCompaniesCollectionView.register(UINib(nibName: "ProductionCompaniesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductionCompaniesCollectionViewCell")
        }
    }
    @IBOutlet weak var overViewLabel: UILabel!
    
    private var genres: [Genres] = []
    private var productionCompanies: [Production_companies] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        movieImageView.layer.cornerRadius = 12.0
        movieImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func configureCell(_ model: MovieHeaderViewModel) {
        movieTitleLabel.text = model.title
        tagLineLabel.text = model.tagLine
        timeLabel.text = "\(model.runtime ?? "N/A") minutes"
        ratingLabel.text = "\(model.rating ?? "N/A") rating"
        releaseDataLabel.text = model.releaseDate
        languageLabel.text = model.language
        overViewLabel.text = model.overview
        genres = model.genres ?? []
        productionCompanies = model.productionCompanies ?? []
        genreCollectionView.reloadData()
        productionCompaniesCollectionView.reloadData()
        if let path = model.posterURL {
            let fullURL = URL(string: "https://image.tmdb.org/t/p/w500\(path)")
            if let url = fullURL {
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url) {
                        DispatchQueue.main.async {
                            self.movieImageView.image = UIImage(data: data)
                        }
                    }
                }
            }
        } else {
            movieImageView.image = UIImage(named: "placeholder")
        }
    }
    
    private func loadImage(from url: URL) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.movieImageView.image = image
                }
            }
        }
    }
}

extension MovieHeaderTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == genreCollectionView {
            return genres.count
        } else if collectionView == productionCompaniesCollectionView {
            return productionCompanies.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == genreCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreCollectionViewCell", for: indexPath) as! GenreCollectionViewCell
            cell.genrelabel.text = genres[indexPath.row].name ?? "N/A"
            return cell
        } else if collectionView == productionCompaniesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductionCompaniesCollectionViewCell", for: indexPath) as! ProductionCompaniesCollectionViewCell
            cell.companyNameLabel.text = productionCompanies[indexPath.row].name ?? "N/A"
            if let path = productionCompanies[indexPath.row].logo_path {
                let fullURL = URL(string: "https://image.tmdb.org/t/p/w500\(path)")
                if let url = fullURL {
                    DispatchQueue.global().async {
                        if let data = try? Data(contentsOf: url) {
                            DispatchQueue.main.async {
                                cell.companyImageView.image = UIImage(data: data)
                            }
                        }
                    }
                }
            } else {
                cell.companyImageView.image = UIImage(named: "placeholder")
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == genreCollectionView {
            let genre = genres[indexPath.item].name
            let font = UIFont.systemFont(ofSize: 14)
            let width = (genre?.size(withAttributes: [NSAttributedString.Key.font: font]).width ?? 0) + 24
            return CGSize(width: width, height: 30)
        } else if collectionView == productionCompaniesCollectionView {
            let totalSpacing = 8 + 8 + 8
            let width = (Int(collectionView.bounds.width) - totalSpacing) / 2
            return CGSize(width: width, height: 110)
        }
        return CGSize(width: 120, height: 100)
    }
}

struct MovieHeaderViewModel {
    let posterURL: String?
    let title: String?
    let tagLine: String?
    let runtime: String?
    let rating: String?
    let releaseDate: String?
    let language: String?
    let overview: String?
    let genres: [Genres]?
    let productionCompanies: [Production_companies]?
}
