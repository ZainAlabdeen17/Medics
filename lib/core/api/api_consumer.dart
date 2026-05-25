abstract  class ApiConsumer{
  Future get({required String path ,Map<String ,dynamic>? queryParameters});
  Future post({required String path ,Map<String ,dynamic>? queryParameters, dynamic data,bool isFormData});
  Future patch({required String path ,Map<String ,dynamic>? queryParameters, dynamic data ,bool isFormData});
  Future delete({required String path ,Map<String ,dynamic>? queryParameters});
}