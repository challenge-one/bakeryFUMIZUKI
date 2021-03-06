Order.create!(
  [
    {
      id: 1,
      customer_id: 1,
      addressee: '稲継亜矢子',
      post_code: '1111111',
      send_to_address: '月川県岩青山町四南寺2-15',
      how_to_pay: true,
      order_status: 0,
    },

    {
      id: 2,
      customer_id: 2,
      addressee: '鈴鹿由美子',
      post_code: '2222222',
      send_to_address: '細野県城見市世史が丘3-1-7',
      how_to_pay: true,
      order_status: 2,
    },

    {
      id: 3,
      customer_id: 3,
      addressee: '関沢智恵美',
      post_code: '3333333',
      send_to_address: '赤田県初山市十越智町6-12',
      how_to_pay: true,
      order_status: 1,
    },

    {
      id: 4,
      customer_id: 4,
      addressee: '巻譲',
      post_code: '4444444',
      send_to_address: '根野県羽島市後目台8-12',
      how_to_pay: false,
      order_status: 2,
    },

    {
      id: 5,
      customer_id: 5,
      addressee: '岡崎弥生',
      post_code: '5555555',
      send_to_address: '古岡県紫波市刈唯山3-5-2',
      how_to_pay: true,
      order_status: 0,
    },
  ]
  )