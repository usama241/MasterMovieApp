import Foundation
import UIKit
import Combine

class MovieDetailsViewController: UIViewController {
    
    //MARK: - Properties
    var viewModel: MovieDetailsViewModel!
    var coordinator: MovieDetailsCoordinator!
    private var subscribers: Set<AnyCancellable> = []
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - View Call
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        self.getMovieDetails()
        self.bindViews()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "MovieHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieHeaderTableViewCell")
    }
    
    private func bindViews() {
        viewModel.$movieFetched
            .receive(on: RunLoop.main)
            .sink { [weak self] fetched in
                if fetched {
                    self?.tableView.reloadData()
                }
            }
            .store(in: &subscribers)
    }

    private func getMovieDetails() {
        Task { [weak self] in
            do {
                try await self?.viewModel.fetchMovieDetail()
            } catch {
                await MainActor.run {
                    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self?.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
}

extension MovieDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieHeaderTableViewCell", for: indexPath) as? MovieHeaderTableViewCell,
                  let movie = viewModel.movieDetails
            else {
                return UITableViewCell()
            }
            cell.configureCell(movie: movie)
            return cell
        }
        return UITableViewCell()
    }
    
}
