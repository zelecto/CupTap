// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedido_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$consultaPedidoHash() => r'8bf724c9285a4bed2201a3996db9def87e51f2bc';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [consultaPedido].
@ProviderFor(consultaPedido)
const consultaPedidoProvider = ConsultaPedidoFamily();

/// See also [consultaPedido].
class ConsultaPedidoFamily extends Family<AsyncValue<List<Pedido>>> {
  /// See also [consultaPedido].
  const ConsultaPedidoFamily();

  /// See also [consultaPedido].
  ConsultaPedidoProvider call(
    String cedula,
  ) {
    return ConsultaPedidoProvider(
      cedula,
    );
  }

  @override
  ConsultaPedidoProvider getProviderOverride(
    covariant ConsultaPedidoProvider provider,
  ) {
    return call(
      provider.cedula,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'consultaPedidoProvider';
}

/// See also [consultaPedido].
class ConsultaPedidoProvider extends AutoDisposeFutureProvider<List<Pedido>> {
  /// See also [consultaPedido].
  ConsultaPedidoProvider(
    String cedula,
  ) : this._internal(
          (ref) => consultaPedido(
            ref as ConsultaPedidoRef,
            cedula,
          ),
          from: consultaPedidoProvider,
          name: r'consultaPedidoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$consultaPedidoHash,
          dependencies: ConsultaPedidoFamily._dependencies,
          allTransitiveDependencies:
              ConsultaPedidoFamily._allTransitiveDependencies,
          cedula: cedula,
        );

  ConsultaPedidoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.cedula,
  }) : super.internal();

  final String cedula;

  @override
  Override overrideWith(
    FutureOr<List<Pedido>> Function(ConsultaPedidoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ConsultaPedidoProvider._internal(
        (ref) => create(ref as ConsultaPedidoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        cedula: cedula,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Pedido>> createElement() {
    return _ConsultaPedidoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConsultaPedidoProvider && other.cedula == cedula;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cedula.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ConsultaPedidoRef on AutoDisposeFutureProviderRef<List<Pedido>> {
  /// The parameter `cedula` of this provider.
  String get cedula;
}

class _ConsultaPedidoProviderElement
    extends AutoDisposeFutureProviderElement<List<Pedido>>
    with ConsultaPedidoRef {
  _ConsultaPedidoProviderElement(super.provider);

  @override
  String get cedula => (origin as ConsultaPedidoProvider).cedula;
}

String _$numeroPedidoHash() => r'e94d44984b8a643377928b848c81f2081919fde7';

/// See also [numeroPedido].
@ProviderFor(numeroPedido)
final numeroPedidoProvider = AutoDisposeProvider<int>.internal(
  numeroPedido,
  name: r'numeroPedidoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$numeroPedidoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NumeroPedidoRef = AutoDisposeProviderRef<int>;
String _$pedidoEstadoHash() => r'a7ae6f0e3c98ae72021087437b440aa9e4110556';

/// See also [PedidoEstado].
@ProviderFor(PedidoEstado)
final pedidoEstadoProvider =
    AutoDisposeNotifierProvider<PedidoEstado, List<Pedido>>.internal(
  PedidoEstado.new,
  name: r'pedidoEstadoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$pedidoEstadoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PedidoEstado = AutoDisposeNotifier<List<Pedido>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
