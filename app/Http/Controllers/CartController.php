<?php

namespace App\Http\Controllers;

use App\Services\CartService;
use Illuminate\Http\Request; //Sử dụng lớp Request của Laravel để xử lý các request HTTP

class CartController extends Controller
{
    /**
     * @var CartService
     */
    private $cartService;

    /**
     * Constructor nhận một đối tượng CartService và gán nó cho biến $cartService của class. 
     * Điều này giúp bạn có thể sử dụng các phương thức của CartService trong CartController.
     *
     * @param HomeService $cartService
     */
    public function __construct(CartService $cartService)
    {
        $this->cartService = $cartService;
    }

    // lấy dữ liệu giỏ hàng từ CartService và trả về view client.cart 
    public function index()
    {
        return view('client.cart', $this->cartService->index());
    }

    //nhận request và gọi cartService->store để thêm sản phẩm vào giỏ hàng
    public function store(Request $request)
    {
        return $this->cartService->store($request);
    }

    public function update(Request $request)
    {
        return $this->cartService->update($request);
    }

    public function delete($id)
    {
        return $this->cartService->delete($id);
    }

    public function clearAllCart()
    {
        $this->cartService->clearAllCart();
    }
}
