@extends('layouts.client')
@section('content-client')
<style>
  .a-hover:hover{
    color:black !important;
  }
  .rating .fa-star{
    color: #b1b1b1;
  }
  .preview-small{
    margin-top: unset !important;
  }

  .quantyti_sold{
    font-size: 14px !important;
  }

  .products-description div{
    font-size: 14px;
    line-height: 20px;
  }
</style>


<div class="container_fullwidth">
    <div class="container shopping-cart">
      <div class="row">
        <div class="col-md-12">
          <h3 class="title">
            Chi Tiết Đơn Hàng {{ $order->id }}
          </h3>
          <div style="padding-bottom: 30px;">
            <a href="{{ route('order_history.index') }}" class="btn-a">Quay Lại</a>
          </div>
          <div class="clearfix">
          </div>
          <table class="table table-bordered table-cart">
            <thead>
              <tr>
                <th scope="col" class="text-center" style="width: 100px;">Mã SP</th>
                <th scope="col" class="text-center">Tên SP</th>
                <th scope="col" class="text-center">Hình Ảnh</th>
                <th scope="col" class="text-center">Màu</th>
                <th scope="col" class="text-center">Kích Thước</th>
                <th scope="col" class="text-center">Số Lượng</th>
                <th scope="col" class="text-center">Đơn Giá</th>
                <th scope="col" class="text-center">Thành Tiền</th>
              </tr>
            </thead>
            <tbody>
              <?php $totalProductMoney = 0;?>
              @foreach ($order_details as $order_detail)
                <?php $totalProductMoney +=  $order_detail->unit_price *  $order_detail->quantity;?>
                <tr>
                    <td>{{ $order_detail->product_id }}</td>
                    <td>
                      <a href="{{ route('user.products_detail', $order_detail->product_id) }}">{{ $order_detail->product_name }}</a>
                    </td>
                    <td class="text-center">
                      <img style="width: 70px; height:auto; object-fit: cover;" src="{{ asset("asset/client/images/products/small/$order_detail->product_img") }}" alt="">
                    </td>
                    <td>{{ $order_detail->color_name }}</td>
                    <td>{{ $order_detail->size_name }}</td>
                    <td>{{ $order_detail->quantity }}</td>
                    <td>{{ format_number_to_money($order_detail->unit_price) }}</td>
                    <td>{{ format_number_to_money($order_detail->unit_price *  $order_detail->quantity) }}</td>
                </tr>
              @endforeach
              <tr>
                <td colspan="7">Tổng Tiền Sản Phẩm</td>
                <td style="font-weight: 600;">{{ format_number_to_money($totalProductMoney) }} VND</td>
              </tr>
              <tr>
                <td colspan="7">Phí Vận Chuyển</td>
                <td style="font-weight: 600;">{{ format_number_to_money($infomation_user['orders_transport_fee']) }} VND</td>
              </tr>
              <tr>
                <td colspan="7">Phương Thức Thanh Toán</td>
                <td>
                    <span class="badge badge-info">{{ $infomation_user['payment_name'] }}</span>
                </td>
              </tr>
              <tr>
                <td colspan="7">Tổng Tiền Đơn Hàng</td>
                <td style="font-weight: 600;"   >
                    {{ format_number_to_money($order->total_money) }} VND
                </td>
              </tr>
            </tbody>
          </table>


          <table class="table table-bordered table-cart"><table class="table table-bordered table-cart">
            <thead>
              <tr>
                <th scope="col" class="text-center" style="width: 300px;">Tên người nhận</th>
                <th scope="col" class="text-center">SDT</th>
                <th scope="col" class="text-center">Email</th>
                <th scope="col" class="text-center">Địa Chỉ Nhận Hàng</th>

              </tr>
            </thead>
            <tr>
              <th th scope="col" class="text-center" style="width: 250px;">{{ $infomation_user['name'] }}</th>
              <th scope="col" class="text-center">{{$infomation_user['phone_number']}}</th>
              <th scope="col" class="text-center">{{ $infomation_user['email'] }}</th>
              <th scope="col" class="text-center">{{ $infomation_user['apartment_number'] . ', ' . $infomation_user['ward'] . ', ' . $infomation_user['district'] . ', ' . $infomation_user['city'] }}</th>
            </tr>
          </table>

          {{-- đánh giá --}}
          @if($isOrderStatusValid)
          <div class="clearfix">
              <div class="tab-box">
                  <div class="title-review">
                      <ul>
                          <li>
                            <h3 class="title">
                              Đánh giá sản phẩm
                            </h3>
                          </li>
                      </ul>
                  </div>
                  <div class="tab-content-wrap">
                      <div class="tab-content">
                          @foreach($order_details as $order_detail)
                              @if($checkReviewProduct[$order_detail->product_id])
                                  <form method="POST" action="{{ route('product_review.store', $order_detail->product_id) }}">
                                      @csrf
                                      <input type="hidden" name="order_id" value="{{ $order->id }}">
                                      <div class="row">
                                          <div class="col-md-6 col-sm-6">
                                              <div class="form-row">
                                                  <label class="review-lable">
                                                      Chọn sao cho sản phẩm {{ $order_detail->product_name }}
                                                  </label>
                                                  <div class="rating">
                                                    <input class="star" type="radio" hidden id="star1" name="rating" value="1" />
                                                    <label for="star1" title="Poor" id="icon-star1">
                                                        <i class="fas fa-star"></i>
                                                    </label>
                                                    <input class="star" type="radio" hidden id="star2" name="rating" value="2" />
                                                    <label for="star2" title="Fair" id="icon-star2">
                                                        <i class="fas fa-star"></i>
                                                    </label>
                                                    <input class="star" type="radio" hidden id="star3" name="rating" value="3" />
                                                    <label for="star3" title="Good" id="icon-star3">
                                                        <i class="fas fa-star"></i>
                                                    </label>
                                                    <input class="star" type="radio" hidden id="star4" name="rating" value="4" />
                                                    <label for="star4" title="Very Good" id="icon-star4">
                                                        <i class="fas fa-star"></i>
                                                    </label>
                                                    <input class="star" type="radio" hidden id="star5" name="rating" value="5" />
                                                    <label for="star5" title="Excellent" id="icon-star5">
                                                        <i class="fas fa-star"></i>
                                                    </label>
                                                </div>

                                              </div>
                                              <div class="form-row">
                                                  <label class="review-lable">
                                                      Nội dung đánh giá
                                                  </label>
                                                  <textarea style="width: 100%;" name="content" rows="7"></textarea>
                                              </div>
                                              <div class="form-row">
                                                  <input type="submit" value="Đánh Giá" class="button">
                                              </div>
                                          </div>
                                      </div>
                                  </form>
                                  @else
                                    <div class="tab-content row">
                                      
                                        <div class="review__comment-header">
                                          <div class="row">
                                            <div class="col-sm-4 review__comment-header--title">
                                              Sản phẩm
                                            </div>
                                            <div class="col-sm-8 review__comment-header--title">
                                              Nội dung đánh giá
                                            </div>
                                          </div>
                                        </div>
                                        <div class="review__comment-list" style="padding-top: 30px;">
                                          <div class="row">
                                            
                                              <div class="col-sm-4">
                                                <span class="review__comment-author">{{$order_detail->product_name}}</span>
                                                <div class="review__comment-time">
                                                  <span>{{ $productReviewsInOrder[$order_detail->product_id]->created_at }}</span>
                                                </div>
                                              </div>
                                              <div class="col-sm-8">
                                                <div class="review__comment-rating">
                                                  <x-stars number="{{ $productReviewsInOrder[$order_detail->product_id]->rating }}"/>
                                                </div>
                                                <div class="review__comment-content">
                                                  <p>
                                                    {{ $productReviewsInOrder[$order_detail->product_id]->content }}
                                                  </p>
                                                </div>
                                              </div>
                                              <div class="col-sm-12 review_comment-line"></div>
                                          </div>
                                        </div>
                                    </div>
                              @endif
                          @endforeach
                      </div>
                  </div>
              </div>
          </div>
          @endif
{{-- đánh giá --}}

        </div>
      </div>
      <div class="clearfix">
      </div>
    </div>
</div>

@vite(['resources/client/js/order-history-detail.js', 'resources/client/css/product-review.css', 'resources/client/css/cart.css', 'resources/client/css/product-detail.css'])
@endsection