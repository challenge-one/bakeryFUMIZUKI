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
    "#{price.round}円"
  end

end
