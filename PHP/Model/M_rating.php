<?php
class M_rating extends Database {

    public function addOrUpdate($item_type, $item_id, $user_id, $rating, $comment = null) {
        $sql = "INSERT INTO ratings (item_type, item_id, user_id, rating, comment, updated_at)
                VALUES (:item_type, :item_id, :user_id, :rating, :comment, NOW())
                ON DUPLICATE KEY UPDATE rating = VALUES(rating),
                                        comment = VALUES(comment),
                                        updated_at = NOW()";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([
            ':item_type' => $item_type,
            ':item_id'   => $item_id,
            ':user_id'   => $user_id,
            ':rating'    => $rating,
            ':comment'   => $comment
        ]);
        return true;
    }

    public function listByItem($item_type, $item_id, $limit = 20, $offset = 0) {
        $sql = "SELECT * FROM ratings
                WHERE item_type = :item_type AND item_id = :item_id
                ORDER BY created_at DESC
                LIMIT :limit OFFSET :offset";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindValue(':item_type', $item_type);
        $stmt->bindValue(':item_id', $item_id, PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int)$limit, PDO::PARAM_INT);
        $stmt->bindValue(':offset', (int)$offset, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function summary($item_type, $item_id) {
        $sql = "SELECT COUNT(*) AS total, COALESCE(AVG(rating),0) AS avg_rating
                FROM ratings
                WHERE item_type = :item_type AND item_id = :item_id";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([':item_type' => $item_type, ':item_id' => $item_id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}