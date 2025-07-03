//
//  MovieDetailsViewController.swift
//  MasterMovieApp
//
//  Created by MacBook Pro on 01/07/2025.
//

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
        self.movieDetail()
        self.bindViews()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "MovieHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieHeaderTableViewCell")
    }
    
    func bindViews() {
        viewModel.$movieDetail
            .receive(on: RunLoop.main)
            .sink { [weak self] movies in
                self?.tableView.reloadData()
            }
            .store(in: &subscribers)
    }

    private func movieDetail() {
        Task { [weak self] in
            guard let self = self else { return }
            do {
                try await self.viewModel.fetchMovieDetail()
            } catch {
                await MainActor.run {
                    let alert = UIAlertController(title: "Warning", message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
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
                  let movie = viewModel.movieDetail
            else {
                return UITableViewCell()
            }
            cell.configureCell(MovieHeaderViewModel(posterURL: movie.poster_path, title: movie.title, tagLine: movie.tagline, runtime: "\(movie.runtime ?? 0)", rating: "\(movie.popularity ?? 0)", releaseDate: movie.release_date, language: movie.original_language, overview: movie.overview, genres: movie.genres, productionCompanies: movie.production_companies))
            return cell
        }
        return UITableViewCell()
    }
    
}
