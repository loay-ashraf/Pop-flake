//
//  SearchViewController.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import Foundation
import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - Properties
    
    var searchController: UISearchController = UISearchController()
    private lazy var searchTimer = SearchTimer { [weak self] in self?.performSearch() }
    
    @IBOutlet weak var segtmentedControl: UISegmentedControl!
    @IBOutlet weak var movieContainerView: UIView!
    @IBOutlet weak var seriesContainerView: UIView!
    
    var movieViewController: MovieSearchViewController!
    var seriesViewController: SeriesSearchViewController!
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    // MARK: - View Helper Methods
    
    func configureView() {
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Tap to Search..."
        searchController.searchBar.autocapitalizationType = .none
        searchController.searchBar.returnKeyType = .done
        searchController.searchBar.enablesReturnKeyAutomatically = false
//        searchController.searchBar.searchTextField.backgroundColor = UIColor(named: "Foreground Color")
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        navigationItem.searchController = searchController
    }
    
    // MARK: - View Actions
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch segtmentedControl.selectedSegmentIndex {
        case 0: movieContainerView.isHidden = false
                seriesContainerView.isHidden = true
                if let movieViewController = movieViewController, let query = searchController.searchBar.text {
                    movieViewController.setQuery(query: query)
                }
        case 1: seriesContainerView.isHidden = false
                movieContainerView.isHidden = true
                if let seriesViewController = seriesViewController, let query = searchController.searchBar.text {
                    seriesViewController.setQuery(query: query)
                }
        default: break
        }
    }
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let movieViewController as MovieSearchViewController: self.movieViewController = movieViewController
        case let seriesViewController as SeriesSearchViewController: self.seriesViewController = seriesViewController
        default:break
        }
    }
    
    // MARK: - Search Method
    
   func performSearch() {
        searchTimer.cancel()
        switch segtmentedControl.selectedSegmentIndex {
        case 0: if let movieViewController = movieViewController, let query = searchController.searchBar.text {
                    movieViewController.setQuery(query: query)
                }
        case 1: if let seriesViewController = seriesViewController, let query = searchController.searchBar.text {
                    seriesViewController.setQuery(query: query)
                }
        default: break
        }
    }
    
}

extension SearchViewController: UISearchControllerDelegate, UISearchBarDelegate {
    
    // MARK: - Search Controller Delegate
    
    func didPresentSearchController(_ searchController: UISearchController) {
    }
    
    func didDismissSearchController(_ searchController: UISearchController) {
    }
    
    // MARK: - Search Bar Delegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            searchTimer.activate()
        } else {
            searchTimer.cancel()
        }
    }
    
}
