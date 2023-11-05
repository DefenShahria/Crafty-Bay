class Urls{
  static const String baseUrls = 'https://ecom-api.teamrabbil.com/api';

  static String VerifyEmail(String email) => '$baseUrls/UserLogin/$email';
  static String Verifyotp(String email,String otp) => '$baseUrls/VerifyLogin/$email/$otp';
  static String getHomeSlider = '$baseUrls/ListProductSlider';
  static String getCategory = '$baseUrls/CategoryList';
  static String getProductByCategory(int categoryID) => '$baseUrls/ListProductByCategory/$categoryID';
  static String GetPproductDetails(int productId) => '$baseUrls/ProductDetailsById/$productId';
  static String GetProduct(String type) => '$baseUrls/ListProductByRemark/$type';
  static String AddtoCart = '$baseUrls/CreateCartList';
  static String getCartlist = '$baseUrls/CartList';
  static String CreateProfile = '$baseUrls/CreateProfile';
  static String ReadProfile = '$baseUrls/ReadProfile';
  static String removeFromCart(int id) => '$baseUrls/DeleteCartList/$id';
}