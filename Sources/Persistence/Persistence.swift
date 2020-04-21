import Foundation


public protocol PersistentModel {
    public static func deleteAll(in context: PersistentContext) throws
}


public protocol PersistentFetchable: PersistentModel {
    public static func fetch(
        in context: PersistentContext,
        options: FetchOptions?)
        throws -> AnyCollection<Self>
}


public protocol PersistentContext {}


public protocol PersistentRepository {
    public func fetch<T: PersistentFetchable>(_ model: T.Type, options: FetchOptions?)
        throws -> AnyCollection<T>
    public func save<T: PersistentModel>(_ entity: T) throws
    public func write<T: PersistentModel>(_ entity: T, changes: () throws -> ()) throws
    public func delete<T: PersistentModel>(_ entity: T) throws
    public func deleteAll<T: PersistentModel>(_ model: T.Type) throws
}


public protocol Timestampable {
    public var dateCreated: Date { get }
    public var dateModified: Date { get set }
}
