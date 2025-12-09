<?php
include "../connect.php";

$operation = isset($_POST["checkoperation"]) ? $_POST["checkoperation"] : "";

switch ($operation) {

    // ------------------------------------------------------
    // إضافة متجر الى المفضلة
    // ------------------------------------------------------
    case "add_favorite":
        $shop_id = $_POST["shop_id"];
        $customers_id = $_POST["customers_id"];

        // التأكد أن المفضلة غير موجودة مسبقاً
        $check = $con->prepare("SELECT * FROM favorite WHERE shop_id=? AND customers_id=?");
        $check->execute([$shop_id, $customers_id]);

        if ($check->rowCount() > 0) {
            echo json_encode([
                "success" => false,
                "message" => "Already added",
            ]);
            exit;
        }

        $stmt = $con->prepare("INSERT INTO favorite (shop_id, customers_id) VALUES (?, ?)");
        $stmt->execute([$shop_id, $customers_id]);

        echo json_encode([
            "success" => true,
            "message" => "Added successfully"
        ]);
        break;


    // ------------------------------------------------------
    // حذف متجر من المفضلة
    // ------------------------------------------------------
    case "remove_favorite":
        $shop_id = $_POST["shop_id"];
        $customers_id = $_POST["customers_id"];

        $stmt = $con->prepare("DELETE FROM favorite WHERE shop_id=? AND customers_id=?");
        $stmt->execute([$shop_id, $customers_id]);

        echo json_encode([
            "success" => true,
            "message" => "Removed successfully"
        ]);
        break;


    // ------------------------------------------------------
    // عرض قائمة المفضلة للمستخدم (مع بيانات المحلات كاملة)
    // ------------------------------------------------------
    case "get_favorite":
        $customers_id = $_POST["customers_id"];

        $stmt = $con->prepare("
            SELECT shop.* 
            FROM favorite 
            INNER JOIN shop ON shop.id = favorite.shop_id 
            WHERE favorite.customers_id = ?
        ");

        $stmt->execute([$customers_id]);
        $shops = $stmt->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode([
            "success" => true,
            "message" => "Favorite list loaded",
            "shop" => $shops
        ]);
        break;

        
    default:
        echo json_encode(["success" => false, "message" => "Invalid operation"]);
        break;
}
