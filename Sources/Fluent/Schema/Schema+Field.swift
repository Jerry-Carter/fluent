extension Schema {
    /// Various types of fields
    /// that can be used in a Schema.
    public struct Field {
        public let name: String
        public let type: DataType
        public let optional: Bool
        public let unique: Bool
        public let `default`: Node?
        public let primary: Bool

        public enum DataType {
            case id(type: IdentifierType)
            case int
            case string(length: Int?)
            case double
            case bool
            case data
            case custom(type: String)
        }

        public init(
            name: String,
            type: DataType,
            optional: Bool = false,
            unique: Bool = false,
            default: Node? = nil,
            primary: Bool = false
        ) {
            self.name = name
            self.type = type
            self.optional = optional
            self.unique = unique
            self.default = `default`
            self.primary = primary
        }
        
        public init(
            name: String,
            type: DataType,
            optional: Bool = false,
            unique: Bool = false,
            default: NodeRepresentable? = nil,
            primary: Bool = false
        ) {
            let node: Node?
            
            if let d = `default` {
                node = try? d.makeNode()
            } else {
                node = nil
            }
            
            self.init(
                name: name,
                type: type,
                optional: optional,
                unique: unique,
                default: node,
                primary: primary
            )
        }
    }
}
