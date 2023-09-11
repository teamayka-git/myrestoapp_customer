import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter/foundation.dart';
import 'package:myresto_customer/api_utils/dio_error_response.dart';
import 'package:myresto_customer/api_utils/url_utils.dart';
import 'package:myresto_customer/constants/get_storage_box.dart';
import 'package:myresto_customer/constants/get_storage_events.dart';
import 'package:myresto_customer/models/api_response_success/api_response_success.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_request_customer_get/api_request_customer_get.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_request_edit_order/api_request_edit_order.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_request_get_product_data/api_request_get_product_data.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_request_get_tables/api_request_get_tables.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_request_order_create/api_request_order_create.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_request_table_free/api_request_table_free.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_request_user_favorites_change/api_request_user_favorites_change.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_response_category_products/api_response_category_products.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_response_customer_get/api_response_customer_get.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_response_customer_get/customer_detail.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_response_get_tables/api_response_get_tables.dart';
import 'package:myresto_customer/customer_portel/order_create_view/model/api_response_order_create/api_response_order_create.dart';

class ScreenMainOrderCreateRepository {
  var _dio = Dio();
  // static const String _url =
  //     "https://mocki.io/v1/38817dbe-010f-4f0d-9562-d62d6e3474ed";

  // ScreenViewOrderSetProcessNewWorkRepository() {
  //   _dio = Dio(BaseOptions(baseUrl: UrlUtils().baseUrl));
  // }
  ScreenMainOrderCreateRepository() {
    _dio = Dio(BaseOptions(baseUrl: UrlUtils().baseUrl));
  }

  Future<Either<String, ApiResponseCategoryProducts>> getCountry() async {
    try {
      if (!kIsWeb) {
        //this package won't work in WEB platform
        bool isNeworkConnectionFound =
            await InternetConnectionChecker().hasConnection;
        if (!isNeworkConnectionFound) {
          return Left("no_internet_connection_found".tr);
        }
      }

      // final response = await _dio.get(_url);

      final requestApi = ApiRequestGetProductData.create(
          sortType: 1,
          sortOrder: 1,
          statusArray: [1],
          screenType: [1, 2, 3, 4, 7, 11, 12, 14, 15, 16,24],
          searchingText: "",
          responseFormat: [],
          limit: -1,
          skip: -1,
          id: []);

      _dio.options.headers["Authorization"] =
          "Bearer ${UrlUtils().bearerToken}";

      final response =
          await _dio.post(UrlUtils().getProductData, data: requestApi);
      print("initial cat product liost      " + jsonEncode(response.data));
      final ApiResponseCategoryProducts mainApiList =
          ApiResponseCategoryProducts.fromJson(response.data);

      return Right(mainApiList);
    } on DioError catch (e) {
      return Left(DioErrorResponseString().getErrorString(e));
    } catch (dioError) {
      return Left(dioError.toString());
    }
  }

  Future<Either<String, ApiResponseOrderCreate>> orderCreate(
      {required ApiRequestOrderCreate payload}) async {
    try {
      if (!kIsWeb) {
        //this package won't work in WEB platform
        bool isNeworkConnectionFound =
            await InternetConnectionChecker().hasConnection;
        if (!isNeworkConnectionFound) {
          return Left("no_internet_connection_found".tr);
        }
      }

      // final response = await _dio.get(_url);

      _dio.options.headers["Authorization"] =
          "Bearer ${UrlUtils().bearerToken}";

      final response =
          await _dio.post(UrlUtils().updatePaymentSales, data: payload);

      print("___k15");
      // final ApiResponseCategoryProducts mainApiList =

      print("___k6");
      // ApiResponseCategoryProducts.fromJson(response.data);
      print("___orderCreate      ${jsonEncode(response.data)}");
      final ApiResponseOrderCreate mainApiList =
          ApiResponseOrderCreate.fromJson(response.data);
      return Right(mainApiList);
    } on DioError catch (e) {
      return Left(DioErrorResponseString().getErrorString(e));
    } catch (dioError) {
      return Left(dioError.toString());
    }
  }

  Future<Either<String, String>> editCreate(
      {required ApiRequestEditOrder payload}) async {
    try {
      if (!kIsWeb) {
        //this package won't work in WEB platform
        bool isNeworkConnectionFound =
            await InternetConnectionChecker().hasConnection;
        if (!isNeworkConnectionFound) {
          return Left("no_internet_connection_found".tr);
        }
      }

      // final response = await _dio.get(_url);

      _dio.options.headers["Authorization"] =
          "Bearer ${UrlUtils().bearerToken}";

      final response =
          await _dio.post(UrlUtils().updatePaymentSales, data: payload);
      // log("____productDetails   " + jsonEncode(response.data));
      // final ApiResponseCategoryProducts mainApiList =
      ApiResponseCategoryProducts.fromJson(response.data);
      return const Right("Success");
    } on DioError catch (e) {
      return Left(DioErrorResponseString().getErrorString(e));
    } catch (dioError) {
      return Left(dioError.toString());
    }
  }

  Future<Either<String, ApiResponseCustomerGet>> getCustomerData(
      String mobileNumber) async {
    try {
      if (!kIsWeb) {
        //
        //this package won't work in WEB platform
        bool isNeworkConnectionFound =
            await InternetConnectionChecker().hasConnection;
        if (!isNeworkConnectionFound) {
          return Left("no_internet_connection_found".tr);
        }
      }

      // final response = await _dio.get(_url);

      final requestApi = ApiRequestCustomerGet.create(
          sortType: 1,
          sortOrder: 1,
          statusArray: [1],
          screenType: [1, 2, 3, 18, 24],
          searchingText: mobileNumber,
          responseFormat: [],
          limit: -1,
          skip: -1,
          id: []);

      _dio.options.headers["Authorization"] =
          "Bearer ${UrlUtils().bearerToken}";

      final response =
          await _dio.post(UrlUtils().getCustomer, data: requestApi);
      print("____cus data    ${jsonEncode(response.data)}");
      final ApiResponseCustomerGet mainApiList =
          ApiResponseCustomerGet.fromJson(response.data);
      return Right(mainApiList);
    } on DioError catch (e) {
      return Left(DioErrorResponseString().getErrorString(e));
    } catch (dioError) {
      return Left(dioError.toString());
    }
  }

  Future<Either<String, String>> freeTable(ApiRequestTableFree data) async {
    try {
      if (!kIsWeb) {
        //
        //this package won't work in WEB platform
        bool isNeworkConnectionFound =
            await InternetConnectionChecker().hasConnection;
        if (!isNeworkConnectionFound) {
          return Left("no_internet_connection_found".tr);
        }
      }

      // final response = await _dio.get(_url);

      _dio.options.headers["Authorization"] =
          "Bearer ${UrlUtils().bearerToken}";

      final response =
          await _dio.post(UrlUtils().updateTableStatusFree, data: data);
      print("____cus data    ${jsonEncode(response.data)}");
      // final ApiResponseCustomerGet mainApiList =
      //     ApiResponseCustomerGet.fromJson(response.data);
      return Right("success");
    } on DioError catch (e) {
      return Left(DioErrorResponseString().getErrorString(e));
    } catch (dioError) {
      return Left(dioError.toString());
    }
  }

  Future<Either<String, List<CustomerDetail>>> getCustomerDataName(
      String mobileNumber) async {
    try {
      if (!kIsWeb) {
        //
        //this package won't work in WEB platform
        bool isNeworkConnectionFound =
            await InternetConnectionChecker().hasConnection;
        if (!isNeworkConnectionFound) {
          return Left("no_internet_connection_found".tr);
        }
      }

      // final response = await _dio.get(_url);

      final requestApi = ApiRequestCustomerGet.create(
          sortType: 1,
          sortOrder: 1,
          statusArray: [1],
          screenType: [1, 2, 3, 18, 24],
          searchingText: mobileNumber,
          responseFormat: [],
          limit: -1,
          skip: -1,
          id: []);

      _dio.options.headers["Authorization"] =
          "Bearer ${UrlUtils().bearerToken}";

      final response =
          await _dio.post(UrlUtils().getCustomer, data: requestApi);
      print("____cus data    ${jsonEncode(response.data)}");
      final ApiResponseCustomerGet mainApiList =
          ApiResponseCustomerGet.fromJson(response.data);
      return Right(mainApiList.data!.customerDetails!);
    } on DioError catch (e) {
      return Left(DioErrorResponseString().getErrorString(e));
    } catch (dioError) {
      return Left(dioError.toString());
    }
  }

  Future<Either<String, ApiResponseGetTables>> getTables() async {
    try {
      if (!kIsWeb) {
        //this package won't work in WEB platform
        bool isNeworkConnectionFound =
            await InternetConnectionChecker().hasConnection;
        if (!isNeworkConnectionFound) {
          return Left("no_internet_connection_found".tr);
        }
      }

      // final response = await _dio.get(_url);

      final requestApi = ApiRequestGetTables.create(
          sortType: 1,
          sortOrder: 1,
          statusArray: [1],
          screenType: [],
          searchingText: "",
          responseFormat: [],
          limit: -1,
          skip: -1,
          id: []);

      _dio.options.headers["Authorization"] =
          "Bearer ${UrlUtils().bearerToken}";

      final response = await _dio.post(UrlUtils().getTables, data: requestApi);
      print("initial cat product liost      " + jsonEncode(response.data));
      final ApiResponseGetTables mainApiList =
          ApiResponseGetTables.fromJson(response.data);

      return Right(mainApiList);
    } on DioError catch (e) {
      return Left(DioErrorResponseString().getErrorString(e));
    } catch (dioError) {
      return Left(dioError.toString());
    }
  }

  Future<Either<String, String>> userFavoritesChange(
      ApiRequestUserFavoritesChange data) async {
    try {
      if (!kIsWeb) {
        //
        //this package won't work in WEB platform
        bool isNeworkConnectionFound =
            await InternetConnectionChecker().hasConnection;
        if (!isNeworkConnectionFound) {
          return Left("no_internet_connection_found".tr);
        }
      }

      // final response = await _dio.get(_url);

      _dio.options.headers["Authorization"] =
          "Bearer ${UrlUtils().bearerToken}";

      final response = await _dio.post(UrlUtils().addUserFavorites, data: data);
      print("____cus data    ${jsonEncode(response.data)}");
      // final ApiResponseCustomerGet mainApiList =
      //     ApiResponseCustomerGet.fromJson(response.data);
      return Right("success");
    } on DioError catch (e) {
      return Left(DioErrorResponseString().getErrorString(e));
    } catch (dioError) {
      return Left(dioError.toString());
    }
  }


}
