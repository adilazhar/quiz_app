// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_repostiory.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$quizRepositoryHash() => r'876e288485ff02553fa2412115de1b8cb8cc4bd1';

/// See also [quizRepository].
@ProviderFor(quizRepository)
final quizRepositoryProvider = Provider<QuizRepository>.internal(
  quizRepository,
  name: r'quizRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$quizRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef QuizRepositoryRef = ProviderRef<QuizRepository>;
String _$fetchQuizHash() => r'a46e5ee578219d3ecccb0928641e3fd7fc79286d';

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

/// See also [fetchQuiz].
@ProviderFor(fetchQuiz)
const fetchQuizProvider = FetchQuizFamily();

/// See also [fetchQuiz].
class FetchQuizFamily extends Family<AsyncValue<Quiz>> {
  /// See also [fetchQuiz].
  const FetchQuizFamily();

  /// See also [fetchQuiz].
  FetchQuizProvider call(
    String quizId,
  ) {
    return FetchQuizProvider(
      quizId,
    );
  }

  @override
  FetchQuizProvider getProviderOverride(
    covariant FetchQuizProvider provider,
  ) {
    return call(
      provider.quizId,
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
  String? get name => r'fetchQuizProvider';
}

/// See also [fetchQuiz].
class FetchQuizProvider extends FutureProvider<Quiz> {
  /// See also [fetchQuiz].
  FetchQuizProvider(
    String quizId,
  ) : this._internal(
          (ref) => fetchQuiz(
            ref as FetchQuizRef,
            quizId,
          ),
          from: fetchQuizProvider,
          name: r'fetchQuizProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchQuizHash,
          dependencies: FetchQuizFamily._dependencies,
          allTransitiveDependencies: FetchQuizFamily._allTransitiveDependencies,
          quizId: quizId,
        );

  FetchQuizProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.quizId,
  }) : super.internal();

  final String quizId;

  @override
  Override overrideWith(
    FutureOr<Quiz> Function(FetchQuizRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchQuizProvider._internal(
        (ref) => create(ref as FetchQuizRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        quizId: quizId,
      ),
    );
  }

  @override
  FutureProviderElement<Quiz> createElement() {
    return _FetchQuizProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchQuizProvider && other.quizId == quizId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quizId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchQuizRef on FutureProviderRef<Quiz> {
  /// The parameter `quizId` of this provider.
  String get quizId;
}

class _FetchQuizProviderElement extends FutureProviderElement<Quiz>
    with FetchQuizRef {
  _FetchQuizProviderElement(super.provider);

  @override
  String get quizId => (origin as FetchQuizProvider).quizId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
