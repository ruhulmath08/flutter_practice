class AppApiConstants {
  ///For details: https://dummyjson.com/docs

  static const String baseUrl = 'https://dummyjson.com';

  ///auth
  static const String login = '$baseUrl/auth/login';
  static const String getCurrentUser = '$baseUrl/auth/me';
  static const String refreshAuthSession = '$baseUrl/auth/refresh';

  ///posta
  static const String getAllPosts = '$baseUrl/posts';
  static String getSinglePost(int id) => '$baseUrl/posts/$id';
  static String searchPost(String word) => '$baseUrl/posts/search?q=$word';
  static String getAllPostByUserId(int userId) => '$baseUrl/posts/user/$userId';
  static String getAllPostCommentsByUserId(int userId) =>
      '$baseUrl/posts/$userId/comments';
  static const String addNewPost = '$baseUrl/posts/add';
  static String updatePost(int postId) => '$baseUrl/posts/$postId';
  static String deletePost(int postId) => '$baseUrl/posts/$postId';

  ///comments
  static  String getSingleComment(int id) => '$baseUrl/comments/$id';
  static  String getAllCommentByPostId(int postId) => '$baseUrl/comments/$postId';
  static  String addComment = '$baseUrl/comments/add';
  static  String updateComment(int commentId) => '$baseUrl/comments/$commentId';
  static  String deleteComment(int commentId) => '$baseUrl/comments/$commentId';
}
