//
//  MovieListViewModel.swift
//  MasterMovieApp
//
//  Created by MacBook Pro on 01/07/2025.
//

import Foundation

class ZTagListViewModel {
    
    //MARK: - Properties
    let service: ZTagServices
    @Published var zTagsList: [ZTagsBody] = []

    //MARK: - Published
    @Published var progressing: Bool = false
 
    //MARK: - Init
    init(service: ZTagServices) {
        self.service = service
    }
}

extension ZTagListViewModel {
    
    func getHelp() async throws -> ZTagSettingsResponse {
        do{
            progressing = true
            let response  = try await service.getUserWalletSetting(mobile: authentication.user.mobileNumber)
          
            progressing = false
            return response
        } catch {
            progressing = false
            throw error
        }
    }
}

