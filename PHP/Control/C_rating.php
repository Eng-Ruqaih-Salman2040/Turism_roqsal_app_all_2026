<?php
require_once __DIR__ . '/../Model/M_rating.php';

class C_rating {

    private $model;

    public function __construct() {
        $this->model = new M_rating();
    }

    // POST: module=rating&action=add
    // body: item_type, item_id, user_id, rating, comment
    public function add() {
        $item_type = $_POST['item_type'] ?? '';
        $item_id   = (int)($_POST['item_id'] ?? 0);
        $user_id   = (int)($_POST['user_id'] ?? 0);
        $rating    = (int)($_POST['rating'] ?? 0);
        $comment   = trim($_POST['comment'] ?? '');

        if (!$item_type || $item_id <= 0 || $user_id <= 0 || $rating < 1 || $rating > 5) {
            $this->json(['status' => 'error', 'message' => 'بيانات غير صحيحة']);
            return;
        }

        $this->model->addOrUpdate($item_type, $item_id, $user_id, $rating, $comment);
        $this->json(['status' => 'success', 'message' => 'تم حفظ التقييم']);
    }

    // GET: module=rating&action=list&item_type=shop&item_id=1&limit=20&offset=0
    public function list() {
        $item_type = $_GET['item_type'] ?? '';
        $item_id   = (int)($_GET['item_id'] ?? 0);
        $limit     = (int)($_GET['limit'] ?? 20);
        $offset    = (int)($_GET['offset'] ?? 0);

        $rows = $this->model->listByItem($item_type, $item_id, $limit, $offset);
        $this->json(['status' => 'success', 'data' => $rows]);
    }

    // GET: module=rating&action=summary&item_type=shop&item_id=1
    public function summary() {
        $item_type = $_GET['item_type'] ?? '';
        $item_id   = (int)($_GET['item_id'] ?? 0);

        $sum = $this->model->summary($item_type, $item_id);
        $this->json(['status' => 'success', 'data' => $sum]);
    }

    private function json($payload) {
        header('Content-Type: application/json; charset=utf-8');
        echo json_encode($payload);
        exit;
    }
}