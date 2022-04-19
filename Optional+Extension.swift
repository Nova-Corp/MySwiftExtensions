protocol _CollectionOrStringish {
    var isEmpty: Bool { get }
}

extension String: _CollectionOrStringish { }
extension Array: _CollectionOrStringish { }
extension Dictionary: _CollectionOrStringish { }
extension Set: _CollectionOrStringish { }

extension Optional where Wrapped: _CollectionOrStringish {
    var isNilOrEmpty: Bool {
        switch self {
        case let .some(value): return value.isEmpty
        default: return true
        }
    }
}

extension Optional {
    func value(or defaultValue: Wrapped) -> Wrapped {
        return self ?? defaultValue
    }
}

/// A type that has an empty value representation, as opposed to `nil`.
public protocol EmptyValueRepresentable {
    /// Provide the empty value representation of the conforming type.
    static var emptyValue: Self { get }

    /// - returns: `true` if `self` is the empty value.
    var isEmpty: Bool { get }

    /// `nil` if `self` is the empty value, `self` otherwise.
    /// An appropriate default implementation is provided automatically.
    func nilIfEmpty() -> Self?
}

extension EmptyValueRepresentable {
    public func nilIfEmpty() -> Self? {
        return self.isEmpty ? nil : self
    }
}

extension Array: EmptyValueRepresentable {
    public static var emptyValue: [Element] { return [] }
}

extension Set: EmptyValueRepresentable {
    public static var emptyValue: Set<Element> { return Set() }
}

extension Dictionary: EmptyValueRepresentable {
    public static var emptyValue: Dictionary<Key, Value> { return [:] }
}

extension String: EmptyValueRepresentable {
    public static var emptyValue: String { return "" }
}

public extension Optional where Wrapped: EmptyValueRepresentable {
    /// If `self == nil` returns the empty value, otherwise returns the value.
    public func valueOrEmpty() -> Wrapped {
        switch self {
        case .some(let value):
            return value
        case .none:
            return Wrapped.emptyValue
        }
    }

    /// If `self == nil` returns the empty value, otherwise returns the result of
    /// mapping `transform` over the value.
    public func mapOrEmpty(_ transform: (Wrapped) -> Wrapped) -> Wrapped {
        switch self {
        case .some(let value):
            return transform(value)
        case .none:
            return Wrapped.emptyValue
        }
    }
}

extension Optional { 
     var descriptionOrEmpty: String { 
         return self.flatMap(String.init(describing:)) ?? ""
     } 

     var descriptionOrNil: String { 
         return self.flatMap(String.init(describing:)) ?? "(nil)" 
     } 
}
