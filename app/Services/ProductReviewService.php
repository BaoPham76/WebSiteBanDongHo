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
    private $productReviewReprository;

    public function __construct(ProductReviewRepository $productReviewReprository)
    {
        $this->productReviewReprository = $productReviewReprository;
    }
    
    public function store(ProductReviewRequest $request, Product $product)
    {
        try {
            $data = $request->validated();
            if (!$this->checkProductReview($product)){
                return back()->with('error', "Đánh giá thất bại vì người dùng chưa đủ điều kiện đánh giá.");
            }
            $data['user_id'] = Auth::user()->id;
            $data['product_id'] = $product->id;
            $this->productReviewReprository->create($data);
            return back()->with('success', "Đánh giá sản phẩm thành công");
        } catch (Exception $e) {
            Log::error($e);
            return back()->with('error', TextSystemConst::CREATE_FAILED);
        }
    }

    public function checkProductReview(Product $product)
    {
        //Kiểm tra đăng nhập
        if (! Auth::check()) {
            Log::info('Người dùng chưa đăng nhập.');
            return false;
        }
        $user = Auth::user();
        //số lần mua
        $purchaseCount = $this->productReviewReprository->checkUserBuyProduct($product->id, $user->id)[0]->purchase_count;
        //số lần đánh giá
        $reviewCount = $this->productReviewReprository->checkUserProductReview($product->id, $user->id);
        
        if ($purchaseCount <= 0) {
            Log::info('Người dùng chưa mua sản phẩm này.', ['product_id' => $product->id, 'user_id' => $user->id]);
            return false;
        }
        
        if ($reviewCount >= $purchaseCount) {
            Log::info('Người dùng đã đánh giá sản phẩm này đủ số lần mua.', ['product_id' => $product->id, 'user_id' => $user->id]);
            return false;
        }
        
        return true;
    }

    public function delete(Request $request)
    {
        try{
            if($this->productReviewReprository->delete($this->productReviewReprository->find($request->id))) {
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
