// Mocks generated by Mockito 5.4.4 from annotations
// in coolmovies/test/mock/domain/usercase_providers_mock.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i4;
import 'package:riverpod/src/framework.dart' as _i3;
import 'package:riverpod/src/internals.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeProviderElement_0<State1> extends _i1.SmartFake
    implements _i2.ProviderElement<State1> {
  _FakeProviderElement_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeOverride_1 extends _i1.SmartFake implements _i3.Override {
  _FakeOverride_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeProviderSubscription_2<State1> extends _i1.SmartFake
    implements _i3.ProviderSubscription<State1> {
  _FakeProviderSubscription_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAlwaysAliveProviderListenable_3<State1> extends _i1.SmartFake
    implements _i3.AlwaysAliveProviderListenable<State1> {
  _FakeAlwaysAliveProviderListenable_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [Provider].
///
/// See the documentation for Mockito's code generation for more information.
class MockProvider<State> extends _i1.Mock implements _i2.Provider<State> {
  MockProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ProviderElement<State> createElement() => (super.noSuchMethod(
        Invocation.method(
          #createElement,
          [],
        ),
        returnValue: _FakeProviderElement_0<State>(
          this,
          Invocation.method(
            #createElement,
            [],
          ),
        ),
      ) as _i2.ProviderElement<State>);

  @override
  _i3.Override overrideWith(
          _i3.Create<State, _i2.ProviderRef<State>>? create) =>
      (super.noSuchMethod(
        Invocation.method(
          #overrideWith,
          [create],
        ),
        returnValue: _FakeOverride_1(
          this,
          Invocation.method(
            #overrideWith,
            [create],
          ),
        ),
      ) as _i3.Override);

  @override
  _i3.ProviderSubscription<State> addListener(
    _i3.Node? node,
    void Function(
      State?,
      State,
    )? listener, {
    required void Function(
      Object,
      StackTrace,
    )? onError,
    required void Function()? onDependencyMayHaveChanged,
    required bool? fireImmediately,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #addListener,
          [
            node,
            listener,
          ],
          {
            #onError: onError,
            #onDependencyMayHaveChanged: onDependencyMayHaveChanged,
            #fireImmediately: fireImmediately,
          },
        ),
        returnValue: _FakeProviderSubscription_2<State>(
          this,
          Invocation.method(
            #addListener,
            [
              node,
              listener,
            ],
            {
              #onError: onError,
              #onDependencyMayHaveChanged: onDependencyMayHaveChanged,
              #fireImmediately: fireImmediately,
            },
          ),
        ),
      ) as _i3.ProviderSubscription<State>);

  @override
  State read(_i3.Node? node) => (super.noSuchMethod(
        Invocation.method(
          #read,
          [node],
        ),
        returnValue: _i4.dummyValue<State>(
          this,
          Invocation.method(
            #read,
            [node],
          ),
        ),
      ) as State);

  @override
  _i3.AlwaysAliveProviderListenable<Selected> select<Selected>(
          Selected Function(State)? selector) =>
      (super.noSuchMethod(
        Invocation.method(
          #select,
          [selector],
        ),
        returnValue: _FakeAlwaysAliveProviderListenable_3<Selected>(
          this,
          Invocation.method(
            #select,
            [selector],
          ),
        ),
      ) as _i3.AlwaysAliveProviderListenable<Selected>);

  @override
  _i3.Override overrideWithValue(State? value) => (super.noSuchMethod(
        Invocation.method(
          #overrideWithValue,
          [value],
        ),
        returnValue: _FakeOverride_1(
          this,
          Invocation.method(
            #overrideWithValue,
            [value],
          ),
        ),
      ) as _i3.Override);
}