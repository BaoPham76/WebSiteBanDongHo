<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $databases = [
            [
                'table' => 'roles',
                'data' => [
                    [
                        'id' => 1,
                        'name' => 'Quản trị viên',
                    ],
                    [
                        'id' => 2,
                        'name' => 'Nhân Viên',
                    ],
                    [
                        'id' => 3,
                        'name' => 'Khách hàng',
                    ]
                ],
            ],
            [
                'table' => 'users',
                'data' => [
                    [
                        'id' => 1,
                        'name' => 'Admin',
                        'email' => 'admin@gmail.com',
                        'password' => Hash::make('password'),
                        'email_verified_at' => now(),
                        'phone_number' => '0000000000',
                        'active' => 1,
                        'role_id' => 1
                    ]
                ]
            ],
            [
                'table' => 'brands',
                'data' => [
                    [
                        'id' => 1,
                        'name' => 'Casio'
                    ],
                    [
                        'id' => 2,
                        'name' => 'Seiko'
                    ],
                    [
                        'id' => 3,
                        'name' => 'Citizen'
                    ],
                    [
                        'id' => 4,
                        'name' => 'Omega'
                    ],
                    [
                        'id' => 5,
                        'name' => 'Tissot'
                    ],
                ]
            ],
            [
                'table' => 'categories',
                'data' => [
                    [
                        'id' => 1,
                        'name' => 'Đồng hồ nam',
                        'parent_id' => 0,
                        'slug' => 'dong-ho-nam'
                    ],
                    [
                        'id' => 2,
                        'name' => 'Đồng hồ nữ',
                        'parent_id' => 0,
                        'slug' => 'dong-ho-nu'
                    ],
                    [
                        'id' => 3,
                        'name' => 'Kim (Analog) - Nam',
                        'parent_id' => 1,
                        'slug' => 'analog-1'
                    ],
                    [
                        'id' => 4,
                        'name' => 'Điện tử (Digital) - Nam',
                        'parent_id' => 1,
                        'slug' => 'digital-1'
                    ],
                    [
                        'id' => 5,
                        'name' => 'Kim (Analog) - Nữ',
                        'parent_id' => 2,
                        'slug' => 'analog-2'
                    ],
                    [
                        'id' => 6,
                        'name' => 'Điện tử (Digital) - Nữ',
                        'parent_id' => 2,
                        'slug' => 'digital-2'
                    ]
                ]
            ],
            [
                'table' => 'payments',
                'data' => [
                    [
                        'id' => 1,
                        'name' => 'Khi nhận hàng',
                        'status' => 1,
                        'img' => '1682960154.png',
                    ],
                    [
                        'id' => 2,
                        'name' => 'Ví điện tử Momo',
                        'status' => 1,
                        'img' => '1682960202.png',
                    ],
                ]
            ],
            [
                'table' => 'colors',
                'data' => [
                    [
                        'id' => 1,
                        'name' => 'Trắng'
                    ],
                    [
                        'id' => 2,
                        'name' => 'Đen'
                    ],
                    [
                        'id' => 3,
                        'name' => 'Xám'
                    ],
                    [
                        'id' => 4,
                        'name' => 'Đỏ'
                    ],
                    [
                        'id' => 5,
                        'name' => 'Vàng'
                    ],
                    [
                        'id' => 6,
                        'name' => 'Xanh'
                    ],
                    [
                        'id' => 7,
                        'name' => 'Tím'
                    ],
                ]
            ],
            [
                'table' => 'sizes',
                'data' => [
                    [
                        'id' => 1,
                        'name' => '29-33mm'
                    ],
                    [
                        'id' => 2,
                        'name' => '33-37mm'
                    ],
                    [
                        'id' => 3,
                        'name' => '37-40mmm'
                    ],
                    [
                        'id' => 4,
                        'name' => '40-42mm'
                    ],
                    [
                        'id' => 5,
                        'name' => '42-45mm'
                    ]

                ]
            ],
            [
                'table' => 'setting',
                'data' => [
                    [
                        'id' => 1,
                        'logo' => 'logo.png',
                        'name' => 'WATCHSTYLE',
                        'email' => 'WATCHSTYLE@gmail.com',
                        'address' => '97 Đường Man Thiện, Phường Hiệp Phú, Quận 9, TP. Hồ Chí Minh',
                        'phone_number' => '02838.295.258',
                        'maintenance' => 2,
                        'notification' => '<b>WEBSITE tạm thời bảo trì để nâng cấp xin  quay lại sau</b>',
                        'introduction' => '
                        <h3 style="text-align: center;">
                            <b>GIỚI THIỆU VỀ WATCHSTYLE</b>
                        </h3>
                        <h5><br></h5>
                        <h5>
                            <span style="font-family: \'Source Sans Pro\', \'Times New Roman\';">
                            Chào mừng đến với website bán đồng hồ của chúng tôi! 
                            Chúng tôi tự hào là một trong những cửa hàng trực tuyến hàng đầu về đồng hồ, 
                            cung cấp cho khách hàng những sản phẩm đồng hồ chất lượng cao và đa dạng.
                            </span>
                            <br>
                        </h5>
                        <h5><br></h5>
                        <h5>
                            Đối với chúng tôi, đồng hồ không chỉ là một công cụ để xem giờ mà còn là một biểu tượng của phong cách và đẳng cấp. 
                            Chúng tôi không chỉ cung cấp cho khách hàng những chiếc đồng hồ đẹp và chất lượng, 
                            mà còn mang đến cho họ những trải nghiệm mua sắm tuyệt vời. Chúng tôi luôn nỗ lực để đáp ứng nhu cầu của khách hàng,
                            từ việc cung cấp những mẫu đồng hồ mới nhất đến việc cải tiến dịch vụ khách hàng.
                            <br>
                        </h5>
                        <h5><br></h5>
                        <h5>
                            Chúng tôi cam kết chỉ bán những chiếc đồng hồ được làm từ chất liệu tốt nhất, 
                            đảm bảo độ bền cao và giá trị sử dụng lâu dài. Chúng tôi luôn đảm bảo rằng mỗi sản phẩm đều được kiểm tra kỹ lưỡng trước khi đưa vào bán hàng, 
                            để đảm bảo rằng chúng đáp ứng các tiêu chuẩn chất lượng mà chúng tôi đặt ra.
                            <br>
                        </h5>
                        <h5><br></h5>
                        <h5>
                            Chúng tôi luôn cập nhật các xu hướng đồng hồ mới nhất, 
                            đảm bảo rằng bạn sẽ luôn có những chiếc đồng hồ đẹp và phù hợp với phong cách của mình. 
                            Từ những mẫu đồng hồ thể thao năng động đến những thiết kế sang trọng cho các buổi tiệc, 
                            chúng tôi có tất cả những gì bạn cần để thể hiện phong cách cá nhân của mình.
                            <br>
                        </h5>
                        <h5><br></h5>
                        <h5>
                            Ngoài ra, 
                            chúng tôi cũng cung cấp cho khách hàng các phụ kiện đồng hồ đa dạng, từ dây đeo, hộp đựng, 
                            đến các dụng cụ bảo dưỡng, giúp khách hàng hoàn thiện và bảo quản chiếc đồng hồ của mình một cách tốt nhất.
                            <br>
                        </h5>
                        <h5><br></h5>
                        <h5>
                            Đội ngũ nhân viên của chúng tôi luôn sẵn sàng hỗ trợ bạn trong quá trình mua sắm. 
                            Chúng tôi cam kết đem đến cho khách hàng những trải nghiệm mua sắm tuyệt vời, từ việc tìm kiếm sản phẩm đến việc đặt hàng và nhận hàng.
                        </h5>
                        <p><br></p>
                        <h5>
                            Chúng tôi tự hào giới thiệu cho bạn những mẫu đồng hồ đa dạng và phong phú. 
                            Từ những mẫu đồng hồ casual hàng ngày đến những thiết kế sang trọng cho các dịp đặc biệt, 
                            chúng tôi có tất cả những gì bạn cần để thể hiện phong cách cá nhân của mình.
                            <br>
                        </h5>
                        <h5><br></h5>
                        <h5>
                            Với những thiết kế đa dạng, 
                            chúng tôi cam kết đem đến cho khách hàng những trải nghiệm mua sắm tuyệt vời. 
                            Những sản phẩm của chúng tôi được thiết kế và sản xuất bởi những thương hiệu nổi tiếng trên thế giới, 
                            đảm bảo về chất lượng và độ bền.
                            <br>
                        </h5>
                        <h5><br></h5>
                        <h5>
                            Nếu bạn đang tìm kiếm những mẫu đồng hồ năng động và trẻ trung, 
                            hãy khám phá các sản phẩm đồng hồ thể thao, đồng hồ thông minh, 
                            hoặc các thiết kế đồng hồ phong cách vintage. 
                            Nếu bạn cần một chiếc đồng hồ lịch sự cho một buổi tiệc hoặc sự kiện quan trọng, 
                            chúng tôi cũng có các thiết kế sang trọng như đồng hồ kim loại, đồng hồ đính đá quý, đồng hồ dây da hay đồng hồ cơ.
                            <br>
                        </h5>
                        <h5><br></h5>
                        <h5>
                            Ngoài ra, chúng tôi cũng cung cấp các sản phẩm đồng hồ thể thao, 
                            đáp ứng nhu cầu của những khách hàng yêu thích các hoạt động thể thao và thích sự chính xác khi sử dụng.
                            <br>
                            Hãy truy cập vào website của chúng tôi để khám phá thêm các sản phẩm đồng hồ đa dạng và phong phú. 
                            Chúng tôi tin rằng, bạn sẽ tìm thấy những sản phẩm ưng ý và phù hợp với phong cách cá nhân của mình.
                        </h5>
                    '

                    ],
                ]
            ]
        ];

        foreach ($databases as $database ) {
            $recordNumber = DB::table($database['table'])->count();
            foreach ($database['data'] as $key => $record) {
                if ($key >= $recordNumber)
                DB::table($database['table'])->insert($record);
            }
        }
    }
}