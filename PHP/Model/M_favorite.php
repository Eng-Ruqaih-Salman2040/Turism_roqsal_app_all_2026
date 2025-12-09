<?php
include_once '../include/vars.php';
include_once 'Database.php';

class M_favorite extends Database {

    // إضافة إلى المفضلة
    public function add_favorite($shop_id, $customers_id) {
        $query = "INSERT INTO favorite (shop_id, customers_id)
                  VALUES ('$shop_id', '$customers_id')";
        return $this->execute($query);
    }

    // حذف من المفضلة
    public function delete_favorite($shop_id, $customers_id) {
        $query = "DELETE FROM favorite 
                  WHERE shop_id='$shop_id' AND customers_id='$customers_id'";
        return $this->execute($query);
    }

    // جلب المفضلة الخاصة بالمستخدم
    public function get_favorite($customers_id) {
        $query = "SELECT s.* FROM shop s
                  INNER JOIN favorite f ON s.id = f.shop_id
                  WHERE f.customers_id = '$customers_id'";
        return $this->getAll($query);
    }
}
?>
