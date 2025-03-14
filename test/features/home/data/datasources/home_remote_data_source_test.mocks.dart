// Mocks generated by Mockito 5.4.5 from annotations
// in climax/test/features/home/data/datasources/home_remote_data_source_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:climax/core/api/api_consumer.dart' as _i4;
import 'package:climax/features/home/data/models/weather_model.dart' as _i3;
import 'package:dio/dio.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeResponse_0<T> extends _i1.SmartFake implements _i2.Response<T> {
  _FakeResponse_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeMain_1 extends _i1.SmartFake implements _i3.Main {
  _FakeMain_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeWind_2 extends _i1.SmartFake implements _i3.Wind {
  _FakeWind_2(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeWeatherModel_3 extends _i1.SmartFake implements _i3.WeatherModel {
  _FakeWeatherModel_3(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [ApiConsumer].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiConsumer extends _i1.Mock implements _i4.ApiConsumer {
  @override
  _i5.Future<_i2.Response<dynamic>> get(
    String? endPoint, {
    Map<String, dynamic>? query,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#get, [endPoint], {#query: query}),
            returnValue: _i5.Future<_i2.Response<dynamic>>.value(
              _FakeResponse_0<dynamic>(
                this,
                Invocation.method(#get, [endPoint], {#query: query}),
              ),
            ),
            returnValueForMissingStub: _i5.Future<_i2.Response<dynamic>>.value(
              _FakeResponse_0<dynamic>(
                this,
                Invocation.method(#get, [endPoint], {#query: query}),
              ),
            ),
          )
          as _i5.Future<_i2.Response<dynamic>>);

  @override
  _i5.Future<_i2.Response<dynamic>> post(
    String? endPoint, {
    Map<String, dynamic>? query,
    Object? body,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#post, [endPoint], {#query: query, #body: body}),
            returnValue: _i5.Future<_i2.Response<dynamic>>.value(
              _FakeResponse_0<dynamic>(
                this,
                Invocation.method(
                  #post,
                  [endPoint],
                  {#query: query, #body: body},
                ),
              ),
            ),
            returnValueForMissingStub: _i5.Future<_i2.Response<dynamic>>.value(
              _FakeResponse_0<dynamic>(
                this,
                Invocation.method(
                  #post,
                  [endPoint],
                  {#query: query, #body: body},
                ),
              ),
            ),
          )
          as _i5.Future<_i2.Response<dynamic>>);

  @override
  _i5.Future<_i2.Response<dynamic>> put(
    String? endPoint, {
    Map<String, dynamic>? query,
    Object? body,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#put, [endPoint], {#query: query, #body: body}),
            returnValue: _i5.Future<_i2.Response<dynamic>>.value(
              _FakeResponse_0<dynamic>(
                this,
                Invocation.method(
                  #put,
                  [endPoint],
                  {#query: query, #body: body},
                ),
              ),
            ),
            returnValueForMissingStub: _i5.Future<_i2.Response<dynamic>>.value(
              _FakeResponse_0<dynamic>(
                this,
                Invocation.method(
                  #put,
                  [endPoint],
                  {#query: query, #body: body},
                ),
              ),
            ),
          )
          as _i5.Future<_i2.Response<dynamic>>);

  @override
  _i5.Future<_i2.Response<dynamic>> delete(
    String? endPoint, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #delete,
              [endPoint],
              {#query: query, #body: body},
            ),
            returnValue: _i5.Future<_i2.Response<dynamic>>.value(
              _FakeResponse_0<dynamic>(
                this,
                Invocation.method(
                  #delete,
                  [endPoint],
                  {#query: query, #body: body},
                ),
              ),
            ),
            returnValueForMissingStub: _i5.Future<_i2.Response<dynamic>>.value(
              _FakeResponse_0<dynamic>(
                this,
                Invocation.method(
                  #delete,
                  [endPoint],
                  {#query: query, #body: body},
                ),
              ),
            ),
          )
          as _i5.Future<_i2.Response<dynamic>>);

  @override
  _i5.Future<_i2.Response<dynamic>> patch(
    String? endPoint, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#patch, [endPoint], {#query: query, #body: body}),
            returnValue: _i5.Future<_i2.Response<dynamic>>.value(
              _FakeResponse_0<dynamic>(
                this,
                Invocation.method(
                  #patch,
                  [endPoint],
                  {#query: query, #body: body},
                ),
              ),
            ),
            returnValueForMissingStub: _i5.Future<_i2.Response<dynamic>>.value(
              _FakeResponse_0<dynamic>(
                this,
                Invocation.method(
                  #patch,
                  [endPoint],
                  {#query: query, #body: body},
                ),
              ),
            ),
          )
          as _i5.Future<_i2.Response<dynamic>>);
}

/// A class which mocks [WeatherModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherModel extends _i1.Mock implements _i3.WeatherModel {
  @override
  List<_i3.Weather> get weather =>
      (super.noSuchMethod(
            Invocation.getter(#weather),
            returnValue: <_i3.Weather>[],
            returnValueForMissingStub: <_i3.Weather>[],
          )
          as List<_i3.Weather>);

  @override
  _i3.Main get main =>
      (super.noSuchMethod(
            Invocation.getter(#main),
            returnValue: _FakeMain_1(this, Invocation.getter(#main)),
            returnValueForMissingStub: _FakeMain_1(
              this,
              Invocation.getter(#main),
            ),
          )
          as _i3.Main);

  @override
  _i3.Wind get wind =>
      (super.noSuchMethod(
            Invocation.getter(#wind),
            returnValue: _FakeWind_2(this, Invocation.getter(#wind)),
            returnValueForMissingStub: _FakeWind_2(
              this,
              Invocation.getter(#wind),
            ),
          )
          as _i3.Wind);

  @override
  int get timezone =>
      (super.noSuchMethod(
            Invocation.getter(#timezone),
            returnValue: 0,
            returnValueForMissingStub: 0,
          )
          as int);

  @override
  String get name =>
      (super.noSuchMethod(
            Invocation.getter(#name),
            returnValue: _i6.dummyValue<String>(this, Invocation.getter(#name)),
            returnValueForMissingStub: _i6.dummyValue<String>(
              this,
              Invocation.getter(#name),
            ),
          )
          as String);

  @override
  List<Object> get props =>
      (super.noSuchMethod(
            Invocation.getter(#props),
            returnValue: <Object>[],
            returnValueForMissingStub: <Object>[],
          )
          as List<Object>);

  @override
  bool get stringify =>
      (super.noSuchMethod(
            Invocation.getter(#stringify),
            returnValue: false,
            returnValueForMissingStub: false,
          )
          as bool);

  @override
  _i3.WeatherModel copyWith({
    List<_i3.Weather>? weather,
    _i3.Main? main,
    _i3.Wind? wind,
    int? timezone,
    String? name,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#copyWith, [], {
              #weather: weather,
              #main: main,
              #wind: wind,
              #timezone: timezone,
              #name: name,
            }),
            returnValue: _FakeWeatherModel_3(
              this,
              Invocation.method(#copyWith, [], {
                #weather: weather,
                #main: main,
                #wind: wind,
                #timezone: timezone,
                #name: name,
              }),
            ),
            returnValueForMissingStub: _FakeWeatherModel_3(
              this,
              Invocation.method(#copyWith, [], {
                #weather: weather,
                #main: main,
                #wind: wind,
                #timezone: timezone,
                #name: name,
              }),
            ),
          )
          as _i3.WeatherModel);

  @override
  Map<String, dynamic> toMap() =>
      (super.noSuchMethod(
            Invocation.method(#toMap, []),
            returnValue: <String, dynamic>{},
            returnValueForMissingStub: <String, dynamic>{},
          )
          as Map<String, dynamic>);

  @override
  String toJson() =>
      (super.noSuchMethod(
            Invocation.method(#toJson, []),
            returnValue: _i6.dummyValue<String>(
              this,
              Invocation.method(#toJson, []),
            ),
            returnValueForMissingStub: _i6.dummyValue<String>(
              this,
              Invocation.method(#toJson, []),
            ),
          )
          as String);
}
