module MutuallyHuman::Rails::FormatHelper
  include ActionView::Helpers::NumberHelper
  
  def date_format(date, format = :normal)
    return date if date.is_a?(String)

    if date
      if format == :short
        date.strftime("%B #{date.day}")
      elsif format == :long
        date.strftime("%B #{date.day}, %Y")
      else
        date.strftime("%m-%d-%Y")
      end
    end
  end
  alias_method :d, :date_format
  
  def format_percentage(num)
    if num.is_a?(Numeric) && num > 0.0
      "%.1d%%" % (num / 1.0 * 100)
    end
  end
  alias_method :pct, :format_percentage

  def time_format(time)
    return time if time.is_a?(String)
    time.strftime("%I:%M %p") if time
  end
  alias_method :t, :time_format
  
  def format_money(money)
    if money
      "$" + number_with_delimiter(money.to_money.to_precision(2).to_s)
    else
      "$0.00"
    end
  end
  alias_method :m, :format_money
  
  def format_mileage(mileage)
    "%d" % mileage
  end
  alias_method :mlg, :format_mileage
end
