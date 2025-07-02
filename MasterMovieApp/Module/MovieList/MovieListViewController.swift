//
//  MovieListViewController.swift
//  MasterMovieApp
//
//  Created by MacBook Pro on 01/07/2025.
//

import Foundation
import UIKit
import Combine

class ZTagListViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Properties
    var viewModel: ZTagListViewModel!
    var coordinator: ZTagListCoordinator!
    private var subscribers: Set<AnyCancellable> = []
    
    //MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var searchTextField: CustomTextField! {
        didSet {
            searchTextField.addTarget(self, action: #selector(onSearchQueryChange(_:)), for: .editingChanged)
            searchTextField.delegate = self
        }
    }
    @IBOutlet weak var noHistoryLabel: UILabel!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            delegate = TableViewDelegate(tableView: tableView)
            tableView.dataSource = delegate
            tableView.delegate = delegate
        }
    }
    
    //MARK: - View Call
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.borderColor = .appCellBorderColor
        self.tabBarController?.tabBar.isHidden = true
        self.getHelp()
        self.getZTagListData()
        self.bindViews()
    }
    
    @IBAction func seeHowItWorkButtonTapped(_ sender: UIButton) {
        coordinator.gTagHelpViewController(helpInfo: viewModel.helpInfo)
    }
    
    func bindViews() {
        viewModel.$progressing.receive(on: RunLoop.main).sink { [weak self] progressing in
            progressing ? self?.showProgress() : self?.hideProgress()
        }.store(in: &subscribers)
        viewModel.$helpHeadInfo.receive(on: RunLoop.main).sink { [weak self] value in
            self?.titleLabel.text = value.first?.title
            self?.detailLabel.text = value.first?.info
            if let urlString = value.first?.imageURL?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: "https://dev-ztag-api.appinsnap.com\(urlString)") {
                self?.imageView.load(url: url)
            }
        }.store(in: &subscribers)
    }
    
    private func getHelp() {
        Task { [weak self] in
            guard let self = self else { return }
            do {
                try await self.viewModel.getHelp()
            } catch {
                await MainActor.run {
                    self.showAlert(title: "", message: error.localizedDescription, icon: .failure)
                }
            }
        }
    }
}

extension ZTagListViewController {
    
    private func setUpTagList() {
        var cellModels: [TableCellModel] = []
        for item in viewModel.zTagsList {
            cellModels.append(
                ZTagListCellModel(data: ZTagListItem(id: item.vehicleID, gTagNo: item.tagNo,vehicleRegNo: item.vehicleRegistrationNo, vehicleType: item.vehicleType, isActive: item.isActive, vehicleImage: item.vehicleImage, vehicleName: item.vehicleName, seeDetailsAction: { self.coordinator.showTagSheetBottomSheet(vehicleImage: item.vehicleImage ?? "", viewDetailImg: item.viewDetailImg ?? "", removeTagImg: item.removeTagImg ?? "", removeTxt: item.removeTxt ?? "", viewDetailTxt: item.viewDetailTxt ?? "", onApplyNow: { data in
                    guard let data = data else { return }
                    if data == "Remove" {
                        
                        self.showCancelableAlert(title: "Remove G-Tag", attribuitedMessage: item.removeTagTxt?.attributedHTMLStringGTag(withFont:  UIFont.systemFont(ofSize: 14), alignment: .center), icon: .attention, showCloseButton: false, cancelButtonTitle: "No".localized, defaultButtonTitle: "Yes".localized, cancelButtonStyle: .secondary, defaultButtonStyle: .primary, dismissOnTapOutside: false, animated: true, cancelButtonAction: {}) {
                            self.removeTag(vehicleID: "\(item.vehicleID ?? 0)")
                        }
                    } else {
                        self.coordinator.zTagHistoryViewController(zTagListItem: ZTagListItem(id: item.vehicleID, gTagNo: item.tagNo, vehicleRegNo: item.vehicleRegistrationNo,vehicleName: item.vehicleName))
                    }
                })
                }, directAction: {
                    self.coordinator.zTagHistoryViewController(zTagListItem: ZTagListItem(id: item.vehicleID, gTagNo: item.tagNo, vehicleRegNo: item.vehicleRegistrationNo,vehicleName: item.vehicleName))
                }))
            )
        }
        
        noHistoryLabel.isHidden = !cellModels.isEmpty
        tableView.isHidden = cellModels.isEmpty
        
        delegate.cellModels = cellModels
        tableView.reloadData()
    }
}

extension ZTagListViewController {
    
    private func setUpTableView(with searchQuery: String? = nil) {
        var contact = self.viewModel.zTagsList
        if let searchQuery, searchQuery.isNotEmpty {
            contact = contact.filter {
                $0.tagNo?.lowercased().contains(searchQuery.lowercased()) ?? false
            }
        }
        
        let cellModels = contact.map { item in
            ZTagListCellModel(data: ZTagListItem(id: item.vehicleID, gTagNo: item.tagNo,vehicleRegNo: item.vehicleRegistrationNo, vehicleType: item.vehicleType, isActive: item.isActive, vehicleImage: item.vehicleImage, vehicleName: item.vehicleName, seeDetailsAction: { self.coordinator.showTagSheetBottomSheet(vehicleImage: item.vehicleImage ?? "", viewDetailImg: item.viewDetailImg ?? "", removeTagImg: item.removeTagImg ?? "", removeTxt: item.removeTxt ?? "", viewDetailTxt: item.viewDetailTxt ?? "", onApplyNow: { data in
                guard let data = data else { return }
                if data == "Remove" {
                    
                    self.showCancelableAlert(title: "Remove G-Tag", attribuitedMessage: item.removeTagTxt?.attributedHTMLStringGTag(withFont:  UIFont.systemFont(ofSize: 14), alignment: .center), icon: .attention, showCloseButton: false, cancelButtonTitle: "No".localized, defaultButtonTitle: "Yes".localized, cancelButtonStyle: .secondary, defaultButtonStyle: .primary, dismissOnTapOutside: false, animated: true, cancelButtonAction: {}) {
                        self.removeTag(vehicleID: "\(item.vehicleID ?? 0)")
                    }
                } else {
                    self.coordinator.zTagHistoryViewController(zTagListItem: ZTagListItem(id: item.vehicleID, gTagNo: item.tagNo, vehicleRegNo: item.vehicleRegistrationNo,vehicleName: item.vehicleName))
                }
            })
            }, directAction: {
                self.coordinator.zTagHistoryViewController(zTagListItem: ZTagListItem(id: item.vehicleID, gTagNo: item.tagNo, vehicleRegNo: item.vehicleRegistrationNo,vehicleName: item.vehicleName))
            }))
        }
        
        noHistoryLabel.isHidden = !cellModels.isEmpty
        tableView.isHidden = cellModels.isEmpty
        
        delegate.cellModels = cellModels
        tableView.reloadData()
    }
    
}
