$(document).ready(function(){
    $.ajaxSetup({
        headers: {
            token: "5ba2f299-3fee-11ef-8de7-a6386691fa55"
        },
    });
    getProvind();
    $(document).on('change', '#city', function(){
        $('#district').html("");
        $('#ward').html("");
        //get list province
        getProvind();
    });

    $(document).on('change', '#district', function(){
        $('#ward').html("");
        // get list ward
        getWard();
    });
});


// fucntion get district
function getProvind()
{
    let provinceId = $('#city').val();
    $.ajax({
        type: 'GET',
        url: 'https://online-gateway.ghn.vn/shiip/public-api/master-data/district',
        data: {
            province_id: provinceId
        }
    }).done((respones) => {
        let option = '';
        //add data to district select
        respones.data.forEach(element => {
            option = `<option value="${element.DistrictID}">${element.DistrictName}</option>`
            $('#district').append(option);
        });
        getWard();
    });
}

//function get ward
function getWard()
{
    let district_id  = $('#district').val();
    $.ajax({
        type: 'GET',
        url: 'https://online-gateway.ghn.vn/shiip/public-api/master-data/ward',
        data: {
            district_id : district_id 
        }
    }).done((respones) => {
        let option = '';
        //add data to ward select
        respones.data.forEach(element => {
            option = `<option value="${element.WardCode}">${element.NameExtension[0]}</option>`
            $('#ward').append(option);
        });
        getFee()
    });
}

function getFee()
{
    let shop_id = "5191028";
    let from_district = "3226";
    let to_district = $('#district').val();
    $.ajax({
        type: 'GET',
        url: 'https://online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/available-services',
        data: {
            shop_id: shop_id,
            from_district: from_district,
            to_district: to_district
        }
    }).done((respones) => {
        let from_district = "3226";
        let service_type = respones.data[0].service_id;
        let to_district_id = $('#district').val();
        let to_ward_code = $('#ward').val();
        let data = {
            service_id: service_type,
            insurance_value: 500000,
            coupon: null,
            from_district_id: from_district,
            to_district_id: to_district_id,
            to_ward_code: to_ward_code,
            height:15,
            length:15,
            weight:1000,
            width:15
        }

        $.ajax({
            type: 'GET',
            url: 'https://online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/fee',
            data: data
        }).done((respones) => {

            // Lấy giá trị phí vận chuyển mới từ response.data.total và tổng sản phẩm từ #total-order-input
            let fee = parseFloat(respones.data.total);

            // Lấy tổng phí vận chuyển cũ từ #fee (nếu đã được hiển thị)
            let oldFee = parseInt($('#fee').text().replace(/\D/g, '')); // Loại bỏ các ký tự không phải số

            // Trừ đi phí vận chuyển cũ và cộng phí vận chuyển mới vào tổng đơn hàng
            let newTotal = (parseInt($('#total-order-input').val()) - oldFee) + fee;
            let shipFee = fee;
            // Hiển thị phí vận chuyển mới và tổng đơn hàng mới
            $('#fee').text(new Intl.NumberFormat().format(fee));
            $('#total-order').text(new Intl.NumberFormat().format(newTotal));
            $('#total-order-input').val(newTotal);
            $('#shipping-fee-input').val(shipFee);

            
        });
    });

}
