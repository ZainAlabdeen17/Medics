import 'package:flutter/material.dart';

@immutable
sealed class InvoiceState {}

final class InvoiceInitial extends InvoiceState {}

final class DownloadInvoiceLoading extends InvoiceState {
  final double progress;

  DownloadInvoiceLoading({required this.progress});
}

final class DownloadInvoiceSuccess extends InvoiceState {
  final String savePath;

  DownloadInvoiceSuccess({required this.savePath});
}

final class DownloadInvoiceFailure extends InvoiceState {
  final String errorMessage;

  DownloadInvoiceFailure({required this.errorMessage});
}
