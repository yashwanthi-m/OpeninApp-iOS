//
//  ViewModel.swift
//  OpeninApp
//
//  Created by Yashwanthi Manchala on 19/06/2023.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var linkInfo = LinksModel()
    
    func fetchData() async {
        // create url
        guard let apiURL = URL(string: "https://api.inopenapp.com/api/v1/dashboardNew")
        else {
            print("The URL doesn't work")
            return
        }
        var request : URLRequest = URLRequest(url: apiURL)
        request.setValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI", forHTTPHeaderField: "Authorization")
        // fetch data from url
        do {
            
            let (data, _ ) = try await URLSession.shared.data(for: request)
            // decode the data
            do {
                let decodedResponse = try JSONDecoder().decode(LinksModel.self, from: data)
                DispatchQueue.main.async {
                    self.linkInfo = decodedResponse
                   
                }

            } catch(let error) {
                print("Error: \(error)")
            }
        }
        catch {
            print("The data isn't valid")
        }
        
    }
    
}
