//
//  SearchEngine.swift
//  KumparanNews-Evel
//
//  Created by DDL10 on 17/08/23.
//

import SwiftUI

struct SearchEngine: ViewModifier {
    let isSearchable: Bool
    @ObservedObject var newsVM: NewsViewModel
    
    func body(content: Content) -> some View {
        if isSearchable {
            return AnyView(content.searchable(text: $newsVM.searchText))
        } else {
            return AnyView(content)
        }
    }
}

extension View {
    func searchEngine(isSearchable: Bool, viewModel: NewsViewModel) -> some View {
        self.modifier(SearchEngine(isSearchable: isSearchable, newsVM: viewModel))
    }
}


