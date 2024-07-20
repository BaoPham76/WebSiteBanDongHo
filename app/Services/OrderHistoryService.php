<?php

namespace App\Services;

use App\Helpers\TextSystemConst;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\ProductSize;
use App\Repository\Eloquent\OrderRepository;
use App\Repository\Eloquent\ProductReviewRepository;
use Exception;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;

class OrderHistoryService 
{
    /**
     * @var OrderRepository
     */
    private $orderRepository;

    /**
     * OrderService constructor.
     *
     * @param OrderRepository $orderRepository
     */

     /**
     * @var ProductReviewService
     */

    /**
     * ProductService constructor.
     *
     * @param ProductRepository $productRepository
     */
    private $productReviewRepository;
    private $productReviewService;
    public function __construct(OrderRepository $orderRepository, ProductReviewService $productReviewService, ProductReviewRepository $productReviewRepository)
    {
        $this->orderRepository = $orderRepository;
        $this->productReviewService = $productReviewService;
        $this->productReviewRepository = $productReviewRepository;
    }


    public function index()
    {
        $orderHistorys = $this->orderRepository->getOrderByUser(Auth::user()->id);

        return ['orderHistorys' => $orderHistorys];
    }

    public function show(Order $order)
    {
        
        $infoUserOfOrder = $this->orderRepository->getInfoUserOfOrder($order->id);
        $infomationUser['id'] = $infoUserOfOrder->user_id;
        $infomationUser['name'] = $infoUserOfOrder->order_name;
        $infomationUser['email'] = $infoUserOfOrder->user_email;
        $infomationUser['phone_number'] = $infoUserOfOrder->order_phone_number;
        $infomationUser['apartment_number'] = $infoUserOfOrder->order_apartment_number;
        $infomationUser['payment_name'] = $infoUserOfOrder->payment_name;
        $infomationUser['orders_transport_fee'] = $infoUserOfOrder->orders_transport_fee;
        $infomationUser['order_status'] = $infoUserOfOrder->order_status;
        $response = Http::withHeaders([
            'token' => '5ba2f299-3fee-11ef-8de7-a6386691fa55'
        ])->get('https://online-gateway.ghn.vn/shiip/public-api/master-data/province');
        $data = json_decode($response->body(), true);
        foreach ($data['data'] as $item) {
            if ($infoUserOfOrder->order_city == $item['ProvinceID']) {
                $infomationUser['city'] = $item['NameExtension'][1];
            }
        }
        $response = Http::withHeaders([
            'token' => '5ba2f299-3fee-11ef-8de7-a6386691fa55'
        ])->get('https://online-gateway.ghn.vn/shiip/public-api/master-data/district', [
            'province_id' => $infoUserOfOrder->order_city,
        ]);
        $data = json_decode($response->body(), true);
        foreach ($data['data'] as $item) {
            if ($infoUserOfOrder->order_district == $item['DistrictID']) {
                $infomationUser['district'] = $item['DistrictName'];
            }
        }

        $response = Http::withHeaders([
            'token' => '5ba2f299-3fee-11ef-8de7-a6386691fa55'
        ])->get('https://online-gateway.ghn.vn/shiip/public-api/master-data/ward', [
            'district_id' => $infoUserOfOrder->order_district,
        ]);
        $data = json_decode($response->body(), true);
        foreach ($data['data'] as $item) {
            if ($infoUserOfOrder->order_ward == $item['WardCode']) {
                $infomationUser['ward'] = $item['NameExtension'][0];
            }
        }
        
        // Get order details
        $orderDetails = $this->orderRepository->getOrderDetail($order->id);
        
        // Check if the user is allowed to rate the product
        $checkReviewProduct = [];
        foreach ($orderDetails as $orderDetail) {
            $checkReviewProduct[$orderDetail->product_id] = $this->productReviewService->checkProductReview($order->id, $orderDetail->product_id);
        }
        $isOrderStatusValid = $infoUserOfOrder->order_status === 3;
        
        $productReviewsInOrder = [];
        foreach ($orderDetails as $orderDetail) {
            $productReviewsInOrder[$orderDetail->product_id] = $this->productReviewRepository->getProductReviewInOrder($order->id, $orderDetail->product_id);
        }
        
        return [

            'order' => $order,
            'infomation_user' => $infomationUser,
            'order_details' => $this->orderRepository->getOrderDetail($order->id),
            'checkReviewProduct' => $checkReviewProduct,
            'isOrderStatusValid' => $isOrderStatusValid,
            'productReviewsInOrder' => $productReviewsInOrder,
        ];
    }

    public function update(Order $order)
    {
        try {
            switch($order->order_status){
                case 0:
                    $this->orderRepository->update($order, ['order_status' => Order::STATUS_ORDER['cancel']]);
                    $orderDetails = OrderDetail::where('order_id', $order->id)->get();
                    foreach($orderDetails as $orderDetail) {
                        $productSize = ProductSize::where('id', $orderDetail->product_size_id)->first();
                        $productSize->update(['quantity' => $productSize->quantity + $orderDetail->quantity]);
                    }
                    return back()->with('success', TextSystemConst::MESS_ORDER_HISTORY['cancel']);
                case 1:
                    $this->orderRepository->update($order, ['order_status' => Order::STATUS_ORDER['received']]);
                    return back()->with('success', TextSystemConst::MESS_ORDER_HISTORY['confirm']);
                case 2:
                    $this->orderRepository->delete($order);
                    return back()->with('success', TextSystemConst::MESS_ORDER_HISTORY['delete']);
                case 3:
                    $this->orderRepository->delete($order);
                    return back()->with('success', TextSystemConst::MESS_ORDER_HISTORY['delete']);
            }
        } catch (Exception $e) {
            return back()->with('error', $e->getMessage());
        }
    }
}
?>