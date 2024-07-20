<?php

namespace App\Services;

use App\Helpers\TextSystemConst;
use App\Http\Requests\ProductReviewRequest;
use App\Models\Product;
use App\Repository\Eloquent\ProductReviewRepository;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class ProductReviewService 
{
    private $productReviewRepository;

    public function __construct(ProductReviewRepository $productReviewRepository)
    {
        $this->productReviewRepository = $productReviewRepository;
    }
    public function store(Request $request, Product $product)
    {
        try {
            $data = $request->only('rating', 'content');
            $orderId = $request->input('order_id'); // Lấy order_id từ request
            $productId = $product->id; // Lấy product_id từ route parameter
            
            // Kiểm tra nếu người dùng đã đánh giá sản phẩm này
            if ($this->productReviewRepository->exists($orderId, $productId)) {
                return back()->with('error', 'Bạn đã đánh giá sản phẩm này rồi.');
            }
            
            // Tạo đánh giá mới
            $data['order_id'] = $orderId;
            $data['product_id'] = $productId;
            $this->productReviewRepository->create($data);
            
            return back()->with('success', 'Đánh giá sản phẩm thành công.');
        } catch (\Exception $e) {
            Log::error($e->getMessage());
            return back()->with('error', 'Đánh giá sản phẩm thất bại. Vui lòng thử lại sau.');
        }
    }
    public function checkProductReview($orderId, $productId)
    {
        if (! Auth::check()) {
            return false;
        }
        if ($this->productReviewRepository->exists($orderId, $productId)) {
            return false;
        }
        return true;
    }



    public function delete(Request $request)
    {
        try{
            if($this->productReviewRepository->delete($this->productReviewRepository->find($request->id))) {
                return response()->json(['status' => 'success', 'message' => TextSystemConst::DELETE_SUCCESS], 200);
            }

            return response()->json(['status' => 'failed', 'message' => TextSystemConst::DELETE_FAILED], 200);
        } catch (Exception $e) {
            Log::error($e);
            return response()->json(['status' => 'error', 'message' => TextSystemConst::SYSTEM_ERROR], 200);
        }
    }
}
?>
