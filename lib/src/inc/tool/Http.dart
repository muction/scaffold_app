import 'dart:convert';

import 'package:dio/dio.dart';
import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:scaffold_app/src/inc/tool/Tool.dart';

class Http {

  Dio _httpClient;

  //构造函数
  Http(){
    _httpClient = Dio(BaseOptions(
        baseUrl: "http://hse.dev.muction.net",
       // baseUrl: "https://hse-app.xieheng.ltd",
        connectTimeout: 5000,
        receiveTimeout: 100000,
    ));


    /// 添加拦截器
    _httpClient.interceptors.add(InterceptorsWrapper(
        onRequest:(RequestOptions options) async {
          // 在请求被发送之前做一些事情
          options.headers['api-version'] = 2;
          options.headers['version'] = '20.11.27';
          options.headers['token'] = Tool().cacheGetString("token");
          options.headers['user-agent'] = 'dio';
          options.contentType = Headers.formUrlEncodedContentType;
          options.responseType= ResponseType.json;

          return options; //continue
          // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
          // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
          //
          //
          // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
          // 这样请求将被中止并触发异常，上层catchError会被调用。
        },
        onResponse:(Response response) async {
          // 在返回响应数据之前做一些预处理
          if(response.data['error'] == 0){
            return response.data;
          }

          EasyLoading.showInfo(response.data['msg']);
          return null;
        },
        onError: (DioError e) async {
          // 当请求失败时做一些预处理
          EasyLoading.showInfo("网络异常，请稍后再试~");
          print(e);
          return e;//continue
        }
    ));
  }


  /// Http get 请求
  get(String path) async{
    var response= await _httpClient.get(path);
    return jsonDecode(response.toString());
  }

  /// Http Post 请求
  post(String path, Object data) async {
    var response= await _httpClient.post(path, data: data);
    return jsonDecode(response.toString());

  }
}