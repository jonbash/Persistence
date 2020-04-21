import Foundation


public protocol PersistentModel {
    static func deleteAll(in context: PersistentContext) throws
}


public protocol PersistentFetchable: PersistentModel {
    static func fetch(
        in context: PersistentContext,
        options: FetchOptions?)
        throws -> AnyCollection<Self>
}


public protocol PersistentContext {}


public protocol PersistentRepository {
    func fetch<T: PersistentFetchable>(_ model: T.Type, options: FetchOptions?)
        throws -> AnyCollection<T>
    func save<T: PersistentModel>(_ entity: T) throws
    func write<T: PersistentModel>(_ entity: T, changes: () throws -> ()) throws
    func delete<T: PersistentModel>(_ entity: T) throws
    func deleteAll<T: PersistentModel>(_ model: T.Type) throws
}


public protocol Timestampable {
    var dateCreated: Date { get }
    var dateModified: Date { get set }
}
