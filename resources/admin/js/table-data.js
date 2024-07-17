import Swal from 'sweetalert2';

$(document).ready(function(){
  var table;
  var columnsExport = [];
  // Count columns export
  Array.from($('#table-crud tr th')).forEach((child, index) => {
    columnsExport.push(index)
  });
  // Remove colomn action
  columnsExport.pop();

  toast = toast();
  table = $('#table-crud').DataTable({
    "paging": true,
    "lengthChange": false,
    "searching": true,
    "ordering": false,
    "info": true,
    "autoWidth": false,
    "responsive": true,
    "buttons": [ 
      {
          extend: 'excelHtml5',
          exportOptions: {
            columns: columnsExport
          }
      },
      {
          extend: 'pdfHtml5',
          exportOptions: {
            columns: columnsExport
          }
          
      },
    ],
    "language": {
      search: "Tìm kiếm",
      emptyTable: "Không có dữ liệu",
      paginate: {
          first: "Trang đầu",
          previous: "Trang trước",
          next: "Trang sau",
          last: "Trang cuối",
      },
      "info": "Bản ghi từ _START_ đến _END_ tổng cộng _TOTAL_ bản ghi",
      "infoFiltered": "",
    }
  });

  //Add buttons print pdf excel
  table.buttons().container().appendTo('#table-crud_wrapper .col-md-6:eq(0)');
  //change content of buttons
  $('.buttons-print').html('<i class="fas fa-print"></i>');
  $('.buttons-pdf').html('<i class="fas fa-file-pdf"></i>');
  $('.buttons-excel').html('<i class="fas fa-file-excel"></i>');
  //change background-color buttons
  $('.dt-buttons button').css("background-color", "#28a745");
  //set width input search
  $('#table-crud_filter input').css('width', '250px');

  // Confirm delete
  $(document).on('click', '#delete__js', function(){
    let id = $(this).closest('tr').attr('id');
    let url = $(this).attr('url');
    Swal.fire({
      title: "Bạn có chắc muốn xóa?",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'CÓ',
      cancelButtonText: 'KHÔNG',
    }).then((result) => {
      if (result.isConfirmed) {
        // Display loading
        $('#loading__js').css('display', 'flex');

        // Call api delete user
        $.ajax({
          url: url,
          type: 'POST',
          data: {
            id: id
          }
        }).done((response) => {
          // Hidden loading
          $('#loading__js').css('display', 'none');

          //If delete success
          if (response.status == 'success') {
            //Show success toast message 
            fire(toast, 'success', response.message)
            // Delete row in data table
            table.rows(`#${id}`).remove().draw();
          } else if (response.status == 'failed') {
            // Show error toast message 
            fire(toast, 'error', response.message)
          } else {
            // Show error toast message 
            fire(toast, 'error', response.message)
            // Reload page
            setTimeout(()=>{
              location.reload();
            }, 2000);
          }
        })
      }
    })
  });
});

// Confirm restore
$(document).on('click', '#restore__js', function(){
  let id = $(this).closest('tr').attr('id'); // Lấy ID của item cần phục hồi (nếu cần)
  let url = $(this).siblings('form#form-restore__js').attr('action'); // Lấy URL action của form phục hồi
  Swal.fire({
      title: "Bạn có chắc muốn phục hồi?",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'CÓ',
      cancelButtonText: 'KHÔNG',
  }).then((result) => {
      if (result.isConfirmed) {
          // Hiển thị loading
          $('#loading__js').css('display', 'flex');

          // Gọi API phục hồi người dùng
          $.ajax({
              url: url,
              type: 'POST',
              data: {
                  id: id // Truyền ID người dùng cần phục hồi
              }
          }).done((response) => {
              // Ẩn loading
              $('#loading__js').css('display', 'none');
              // Nếu phục hồi thành công
              if (response.status == 'success') {
                  // Hiển thị toast message thành công
                  fire(toast, 'success', response.message);
                  // Cập nhật hoặc làm mới bảng dữ liệu
                  //table.rows(`#${id}`).remove().draw();
                  setTimeout(() => {
                    location.reload();
                }, 2000);
                  
              } else if (response.status == 'failed') {
                  // Hiển thị toast message lỗi
                  fire(toast, 'error', response.message);
                  setTimeout(() => {
                    location.reload();
                }, 2000);
              } else {
                  // Hiển thị toast message lỗi
                  fire(toast, 'error', response.message);
                  // Reload trang sau một khoảng thời gian
                  setTimeout(() => {
                      location.reload();
                  }, 2000);
              }
          }).fail((jqXHR, textStatus, errorThrown) => {
              // Xử lý lỗi khi gọi API
              console.error('Error:', textStatus, errorThrown);
              console.log('ID cần phục hồi:', id);
              console.log('URL phục hồi:', url);
              // Ẩn loading
              $('#loading__js').css('display', 'none');
              // Hiển thị toast message lỗi
              fire(toast, 'error', 'Đã xảy ra lỗi khi phục hồi.');
          });
      }
  });
});


// function init toast message
function toast() 
{
  return Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 3000,
    timerProgressBar: true,
    didOpen: (toast) => {
      toast.addEventListener('mouseenter', Swal.stopTimer)
      toast.addEventListener('mouseleave', Swal.resumeTimer)
    }
  });
}

function fire(toast, type, message) 
{
  let background;
  let icon;
  if (type == 'success') {
    background = 'rgba(40,167,69,.85)';
    icon = 'success';
  } else if (type == 'error') {
    background = 'rgba(220,53,69,.85)';
    icon = 'error';
  }
  toast.fire({
    icon: icon,
    title: message,
    background: background,
    color: '#fff',
  })
}