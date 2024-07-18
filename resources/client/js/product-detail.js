$(document).ready(function(){
   let sizes = JSON.parse(jQuery('#data-size').attr('data-sizes'))
   let color = $('#data-color').val()
   showSize(color, sizes);
   
   // Lắng nghe sự thay đổi của màu sắc
   $(document).on('change', '#data-color', function(){
      let color = $('#data-color').val()
      showSize(color, sizes);
   })

   // Lắng nghe sự thay đổi của size
   $(document).on('change', '#data-size', function(){
      let sizes = JSON.parse(jQuery('#data-size').attr('data-sizes'))
      let productSizeId = $('#data-size').val();
      let dataColor = $('#data-color').val()
      sizes.forEach(element => {
         if (element.product_color_id == dataColor && element.product_size_id == productSizeId) {
            $('#quantity_remain').text(element.quantity)
         }
      });
   })

   // Khi dùng chọn sao thì tô màu
   $(document).on('click', '.star', function(){
         $('.rating label .fa-star').css({
            "color": "#b1b1b1",
         })
         let star = $(this).attr('id');
         for (let i = 1; i <= star.split('star')[1]; i++){
            $(`#icon-star${i} i`).css({
               "color": "#F5A623",
            });
         }
   })

   // Lắng nghe sự kiện click trên ảnh nhỏ
   $(document).on('click', '.thumbnail', function(event){
      event.preventDefault();
      const largeImage = $('#zoom_03');
      const newSrc = $(this).attr('data-image');
      const newZoomImage = $(this).attr('data-zoom-image');
      
      largeImage.attr('src', newSrc);
      largeImage.attr('data-zoom-image', newZoomImage);
   });
})

function showSize(color, sizes)
{
   let option = '';
   sizes.forEach(element => {
    if (element.product_color_id == color) {
       option += `
          <option value='${element.product_size_id}'>${element.size_name}</option>
       `
    }
   });
   $('#data-size').html(option)
   showQuantity(sizes);
}

function showQuantity(sizes)
{
   let size = $('#data-size').val()
   sizes.forEach(element => {
      if (element.product_size_id == size) {
         $('#quantity_remain').text(element.quantity)
      }
     });
}
