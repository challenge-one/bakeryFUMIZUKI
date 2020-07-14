module ApplicationHelper
  #timestamp表記を簡略化
  def simple_time(time)
    time.strftime("%Y年%m月%d日　")
  end

  def flash_class_for flash_type
    case flash_type
      when 'success' then 'alert-success'
      when 'danger' then 'alert-danger'
      when 'info' then 'alert-info'
    end
  end

  def price_include_tax(price)
    price = price * 1.08
    "#{price.floor}円"
  end

  def how_to_pay(how_to_pay)
    case how_to_pay
      when true
        "クレジットカード"
      when false
        "銀行振込"
    end
  end

  def order_status(order_status)
    case order_status
      when 0
        "入金待ち"
      when 1
        "入金確認"
      when 2
        "製作中"
      when 3
        "発送準備中"
      when 4
        "発送済み"
    end
  end

end
