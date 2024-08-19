/// A base class that defines a contract for callable classes with a single method.
///
/// This abstract class is generic and can be used to define various callable
/// classes with different return types and parameters.
///
/// [Return] - The type of the result that the call method will return.
/// [Params] - The type of the parameter that the call method will accept.
abstract class BaseCallableClass<Return, Params> {
  /// Defines a method that should be implemented by subclasses to perform
  /// an operation and return a result.
  ///
  /// [params] - The input parameter for the operation. The type of this
  /// parameter is specified by the generic type [Params].
  ///
  /// Returns a result of type [Return]. This can be a success or an error
  /// depending on the implementation.
  Return call(Params params);
}
