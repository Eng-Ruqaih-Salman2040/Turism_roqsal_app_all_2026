//const urlApi = 'https://test.link-pm.com/';

// تقييم: Paths تضاف فوق urlBase في ApiService
const urlAddRatingPath = "?checkopration=addRating";

  const urlApi = 'http://10.0.2.2/damar_roq2026/';

const urlBase = urlApi+'PHP/api.php';
const Url_user  = urlApi+"image/user/";
const Url_section = urlApi+"image/section/";
const Url_shop  = urlApi+"image/shop/";
const Url_gallery  = urlApi+"image/gallery/";
const Url_ads  = urlApi+"image/ads/";



String urlGetRatingsPath(int shopId, {int limit = 20, int offset = 0}) =>
    "?checkopration=getRatings&shop_id=$shopId&limit=$limit&offset=$offset";

String urlGetRatingSummaryPath(int shopId) =>
    "?checkopration=getRatingSummary&shop_id=$shopId";