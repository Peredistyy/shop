Admin.create!(email: 'admin@shop.com', password: 'admin123', password_confirmation: 'admin123')

Product.create!(
    title: 'iPhone 6',
    description: 'Экран 5.5" Retina (1920x1080, сенсорный емкостный, Multi‑Touch) / моноблок / Apple A8
                  / камера 8 Мп + фронтальная 1.2 Мп / Bluetooth 4.0 / Wi-Fi 802.11 a/b/g/n/ac
                  / 1 ГБ оперативной памяти / 16 ГБ встроенной памяти / NFC / 3G / LTE / GPS
                  / GLONASS / разъем 3.5 мм / iOS 8 / 158.1 x 77.8 x 7.1 мм, 172 г / серебристый',
    image: File.new("#{Rails.root}/db/seed/product/images/iphone6.png"),
    price: 199.99
)
Product.create!(
    title: 'MacBook Pro',
    description: 'Экран 13.3" IPS (2560x1600) Retina LED, глянцевый / Intel Core i7 (3.0 ГГц)
                  / RAM 16 ГБ / SSD 256 ГБ / Intel Iris Graphics / без ОД / Wi-Fi / Bluetooth / веб-камера
                  / Mac OS X (Mavericks) / 1.62 кг',
    image: File.new("#{Rails.root}/db/seed/product/images/macbook-pro.png"),
    price: 1199.99
)