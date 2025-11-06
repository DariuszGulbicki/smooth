extension String {

    public func assureSuffix(_ suffix: String) -> String {
        if self.hasSuffix(suffix) {
            return self
        } else {
            return self + suffix
        }
    }

    public func assurePrefix(_ prefix: String) -> String {
        if self.hasPrefix(prefix) {
            return self
        } else {
            return prefix + self
        }
    }

}