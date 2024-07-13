<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CheckOutRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'payment_method' => 'required|integer|in:1,2,3',
            'name' => 'required|string', // Adjusted to string type
            'phone_number' => 'required|regex:/^[0-9]{10,11}$/',
            'city' => 'required|string',
            'district' => 'required|string',
            'ward' => 'required|string',
            'apartment_number' => 'required|string',
        ];
    }
    
    /**
     * Get the error messages for the defined validation rules.
     *
     * @return array
     */
    public function messages()
    {
        return [
            'payment_method.integer' => 'Phương thức thanh toán không hợp lệ',
            'payment_method.required' => 'Phương thức thanh toán không được bỏ trống',
            'name.required' => 'Tên người nhận không được bỏ trống',
            'name.string' => 'Tên người nhận phải là chuỗi',
            'phone_number.required' => 'Số điện thoại không được bỏ trống',
            'phone_number.regex' => 'Số điện thoại không hợp lệ',
            'city.required' => 'Không được bỏ trống',
            'district.required' => 'Không được bỏ trống',
            'ward.required' => 'Không được bỏ trống',
            'apartment_number.required' => 'Không được bỏ trống',
            
        ];
    }
    
}
