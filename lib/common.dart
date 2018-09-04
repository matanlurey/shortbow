/// Internal common functions and classes.
///
/// @nodoc
library shortbow.src.common;

/// Whether or not `assert(...)` is enabled in the current runtime.
///
/// Optimizing compilers can remove `if (!assertionsEnabled) { ... }`.
bool get assertionsEnabled {
  var enabled = false;
  assert(enabled = true);
  return enabled;
}

/// Returns the result of hashing the two provided objects.
int hash2(Object a, Object b) {
  return a.hashCode ^ b.hashCode;
}

/// Returns the result of hashing the three provided objects.
int hash3(Object a, Object b, Object c) {
  return a.hashCode ^ b.hashCode ^ c.hashCode;
}

/// Returns the result of hashing the four provided objects.
int hash4(Object a, Object b, Object c, Object d) {
  return a.hashCode ^ b.hashCode ^ c.hashCode ^ d.hashCode;
}
