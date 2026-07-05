import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/core/api/api_interceptor.dart';
import 'package:medics/features/appointments/presentation/cubit/invoice_cubit/invoice_state.dart';
import 'package:path_provider/path_provider.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  InvoiceCubit() : super(InvoiceInitial());
  Future<void> downloadInvoice(String url, String fileName) async {
    emit(DownloadInvoiceLoading(progress: 0.0));
    try {
      Directory? directory = Directory('/storage/emulated/0/Download');
      if (!await directory.exists()) {
        directory = await getExternalStorageDirectory();
      }
      final savePath = "${directory!.path}/$fileName.pdf";
      Dio dio = Dio();
      dio.interceptors.add(ApiInterceptor());
      await dio.download(
        url,
        savePath,
        onReceiveProgress: (count, total) {
          if (total != -1) {
            double progressPercentage = count / total;
            emit(DownloadInvoiceLoading(progress: progressPercentage));
          }
        },
      );
      emit(DownloadInvoiceSuccess(savePath: savePath));
    } catch (e) {
      emit(DownloadInvoiceFailure(errorMessage: e.toString()));
    }
  }
}
