<?php

namespace App\Services;

use App\Models\Product;
use App\Repository\Eloquent\ProductRepository;
use App\Repository\Eloquent\ProductReviewRepository;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ProductDetailService 
{
    /**
     * @var ProductRepository
     */
    private $productRepository;

    /**
     * @var ProductReviewService
     */
    private $productReviewService;

    /**
     * @var ProductReviewRepository
     */
    private $productReviewRepository;

    /**
     * ProductService constructor.
     *
     * @param ProductRepository $productRepository
     */
    
    public function __construct(
        ProductRepository $productRepository,
        ProductReviewService $productReviewService,
        ProductReviewRepository $productReviewRepository,
    )
    {
        $this->productRepository = $productRepository;
        $this->productReviewService = $productReviewService;
        $this->productReviewRepository = $productReviewRepository;
    }

    /**
     * Display a listing of the users.
     *
     * @return \Illuminate\Http\Response
     */
    public function show(Product $product)
    {
        // lấy số lượng đã bán
        $productSold = $this->productRepository->getTotalProductSoldById($product->id);
        // lấy màu sản phẩm
        $productColor = DB::table('products_color')
            ->join('colors', 'colors.id', 'products_color.color_id')
            ->select('colors.name as color_name', 'products_color.*')
            ->where('products_color.product_id', $product->id)
            ->whereNull('products_color.deleted_at')
            ->get();
        // lấy kích thước của sản phẩm
        $productsize = DB::table('products_color')
            ->join('products_size', 'products_size.product_color_id', 'products_color.id')
            ->join('sizes', 'sizes.id', 'products_size.size_id')
            ->select('sizes.name as size_name', 'products_size.id as product_size_id', 'products_color.id as product_color_id', 'products_size.quantity')
            ->where('products_color.product_id', $product->id)
            ->whereNull('products_color.deleted_at')
            ->whereNull('products_size.deleted_at')
            ->get();
        
        // lấy tổng số lượng sao được đánh giá và thông tin 
        $ratingsByProduct = $this->productReviewRepository->getRatingByProduct($product->id);

        // thống kê lượt đánh giá
        $ratingStatistics = [
            "1" => 0,
            "2" => 0,
            "3" => 0,
            "4" => 0,
            "5" => 0,
        ];

        //tính trung bình sao
        $totalRating = 0;
        $totalNumberReview = 0;
        foreach ($ratingsByProduct as $rating) {
            $ratingStatistics[$rating->rating] = $rating->sum;
            $totalRating += $rating->rating * $rating->sum;
            $totalNumberReview += $rating->sum;
        }
        $avgRating = count($ratingsByProduct) > 0 ? $totalRating / $totalNumberReview : 5;


        //get product reviews by product
        $productReviews = $this->productReviewRepository->getProductReview($product->id);

        //get related products
        $relatedProducts = $this->productRepository->getRelatedProducts($product);

        foreach($relatedProducts as $key => $relatedProduct) {
            $relatedProducts[$key]->avg_rating = $this->productReviewRepository->avgRatingProduct($relatedProduct->id)->avg_rating ?? 0;
            $relatedProducts[$key]->sum = $this->productRepository->getQuantityBuyProduct($relatedProduct->id);
        }
        //trả dữ liệu cho controller
        return [
            'title' => TextLayoutTitle("payment_method"),
            'productSold' => $productSold,
            'productColor' => $productColor,
            'productSize' => $productsize,
            'product' => $product,
            'ratingStatistics' => $ratingStatistics,
            'avgRating' => $avgRating,
            'productReviews' => $productReviews,
            'relatedProducts' => $relatedProducts,
        ];
    }
}
?>