//
//  ApolloNetwork.swift
//  StarWarFilms
//
//  Created by Khoa Nguyen on 05/12/2023.
//

import Foundation
import Apollo

class ApolloNetwork {
  static let shared = ApolloNetwork()

  private init() {}

  private(set) lazy var apollo = ApolloClient(url: URL(string: "https://swapi-graphql.netlify.app/.netlify/functions/index")!)
}
