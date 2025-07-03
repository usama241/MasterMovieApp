//
//  MovieListViewController.swift
//  MasterMovieApp
//
//  Created by MacBook Pro on 01/07/2025.
//

import Foundation
import UIKit
import Combine

class MovieListViewController: UIViewController {
    
    //MARK: - Properties
    var viewModel: MovieListViewModel!
    var coordinator: MovieListCoordinator!
    private var subscribers: Set<AnyCancellable> = []
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noHistoryLabel: UILabel! {
        didSet {
            noHistoryLabel.isHidden = false
            noHistoryLabel.text = "Movie List is Empty!"
        }
    }
    
    //MARK: - View Call
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movies List"
        setupTableView()
        self.moviesList()
        self.bindViews()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = true
        tableView.register(UINib(nibName: "MovieListTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieListTableViewCell")
    }

    func bindViews() {
        viewModel.$moviesList
            .receive(on: RunLoop.main)
            .sink { [weak self] movies in
                self?.tableView.reloadData()
                if let movies = movies {
                    self?.noHistoryLabel.isHidden = !(movies.isEmpty)
                    self?.tableView.isHidden = (movies.isEmpty)
                }
            }
            .store(in: &subscribers)
    }

    private func moviesList() {
        Task { [weak self] in
            guard let self = self else { return }
            do {
                try await self.viewModel.moviesList()
            } catch {
                await MainActor.run {
                    let alert = UIAlertController(title: "Warning", message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    self.noHistoryLabel.isHidden = false
                }
            }
        }
    }
}

extension MovieListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.moviesList?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell", for: indexPath) as? MovieListTableViewCell,
            let movie = viewModel.moviesList?[indexPath.row]
        else {
            return UITableViewCell()
        }
        cell.configure(with: movie)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedMovieId = viewModel.moviesList?[indexPath.row].id {
            coordinator.movieDetailsViewController(selectedMovieId: selectedMovieId)
        }
    }
}
