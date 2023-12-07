// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

protocol StarWarsApi_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == StarWarsApi.SchemaMetadata {}

protocol StarWarsApi_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == StarWarsApi.SchemaMetadata {}

protocol StarWarsApi_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == StarWarsApi.SchemaMetadata {}

protocol StarWarsApi_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == StarWarsApi.SchemaMetadata {}

extension StarWarsApi {
  typealias ID = String

  typealias SelectionSet = StarWarsApi_SelectionSet

  typealias InlineFragment = StarWarsApi_InlineFragment

  typealias MutableSelectionSet = StarWarsApi_MutableSelectionSet

  typealias MutableInlineFragment = StarWarsApi_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
      switch typename {
      case "Root": return StarWarsApi.Objects.Root
      case "FilmsConnection": return StarWarsApi.Objects.FilmsConnection
      case "Film": return StarWarsApi.Objects.Film
      case "Person": return StarWarsApi.Objects.Person
      case "Planet": return StarWarsApi.Objects.Planet
      case "Species": return StarWarsApi.Objects.Species
      case "Starship": return StarWarsApi.Objects.Starship
      case "Vehicle": return StarWarsApi.Objects.Vehicle
      case "FilmSpeciesConnection": return StarWarsApi.Objects.FilmSpeciesConnection
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}