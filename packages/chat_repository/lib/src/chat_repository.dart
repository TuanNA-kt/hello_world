import 'package:chat_repository/src/chat_remote_data_source.dart';
import 'package:api_client/src/api_service.dart';

class ChatRepository {
  final ChatRemoteDataSource _remoteDataSource;
  final ApiService _apiService;

  ChatRepository({required ChatRemoteDataSource remoteDataSource, required ApiService apiService}) :
        _remoteDataSource = remoteDataSource, _apiService = apiService;


}