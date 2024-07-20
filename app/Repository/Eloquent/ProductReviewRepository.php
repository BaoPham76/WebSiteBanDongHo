<?php

namespace App\Repository\Eloquent;

use App\Models\ProductReview;
use Illuminate\Support\Facades\DB;

/**
 * Class ProductReviewRepository
 * @package App\Repositories\Eloquent
 */
class ProductReviewRepository extends BaseRepository
{
    /**
     * ProductReviewRepository constructor.
     *
     * @param ProductReview $productReview
     */
    public function __construct(ProductReview $productReview)
    {
        parent::__construct($productReview);
    }

    public function exists($orderId, $productId)
    {
        return $this->model->where('order_id', $orderId)
                        ->where('product_id', $productId)
                        ->exists();
    }


    public function getRatingByProduct($productId)
    {
        return DB::select("
            select count(*) as sum, product_reviews.product_id, product_reviews.rating from products 
            join product_reviews on products.id = product_reviews.product_id 
            where products.id = ?
            and product_reviews.deleted_at is null
            group by product_reviews.product_id, product_reviews.rating
        ", [$productId]);
    }

    public function getProductReview($productId)
    {
        return $this->model
            ->join('products', 'products.id', '=', 'product_reviews.product_id')
            ->join('orders', 'orders.id', '=', 'product_reviews.order_id')
            ->join('users', 'users.id', '=', 'orders.user_id') // Join với bảng users
            ->select('users.name as user_name', 'product_reviews.*')
            ->where('product_reviews.product_id', '=', $productId)
            ->whereNull('product_reviews.deleted_at')
            ->whereNull('orders.deleted_at')
            ->orderBy('product_reviews.id', 'desc')
            ->paginate(ProductReview::PRODUCT_REVIEW_NUMBER_ITEM);
    }

    public function getProductReviewInOrder($orderID, $productId)
    {
        return $this->model
            ->join('products', 'products.id', '=', 'product_reviews.product_id')
            ->join('orders', 'orders.id', '=', 'product_reviews.order_id')
            ->where('product_reviews.product_id', '=', $productId)
            ->where('product_reviews.order_id', '=', $orderID)
            ->whereNull('product_reviews.deleted_at')
            ->whereNull('orders.deleted_at')
            ->orderBy('product_reviews.id', 'desc')
            ->first(); // Dùng first() vì mỗi đơn hàng chỉ có một đánh giá cho sản phẩm đó
    }




    public function avgRatingProduct($productId)
    {
        return DB::table('product_reviews')
        ->join('products', 'products.id', '=', 'product_reviews.product_id')
        ->select(DB::raw('sum(product_reviews.rating) / count(*) as avg_rating'))
        ->where('products.id', $productId)
        ->first();
    }
}
