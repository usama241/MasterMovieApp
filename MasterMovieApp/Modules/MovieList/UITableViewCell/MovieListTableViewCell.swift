import UIKit

class MovieListTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var voteCountLabel: UILabel!
    @IBOutlet weak var adultLabel: UILabel!
    @IBOutlet weak var adultView: UIView!
    
    // MARK: - Cell Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        movieImageView.layer.cornerRadius = 8.0
        movieImageView.layer.masksToBounds = true
        movieImageView.contentMode = .scaleAspectFill
        adultView.layer.cornerRadius = 4.0
        adultView.layer.masksToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: - Configure Cell
    func configure(movie: Movie) {
        movieTitleLabel.text = movie.title ?? "N/A"
        releaseDateLabel.text = "Release: \(movie.releaseDate ?? "N/A")"
        
        popularityLabel.text = "Popularity: \(movie.rating ?? 0)"
        voteAverageLabel.text = "Avg Vote: \(movie.voteAverage ?? 0)"
        voteCountLabel.text = "Votes: \(movie.voteCount ?? 0)"
        adultLabel.text = movie.adult == true ? "18+" : "All Ages"
        adultView.backgroundColor = movie.adult == true ? UIColor.red : UIColor.systemPurple
        languageLabel.text = "Language: \(movie.language ?? "N/A")"

        if let path = movie.posterURL {
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
}
