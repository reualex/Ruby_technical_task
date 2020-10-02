class Checkout
 require './items.rb'


def scan(item)
  @items ||= {}
  @item ||= {}
  @item = {
    price: item.price,
    count: 1,
    total_price: item.price,
  }

  unless @items.has_key?(item.type)
    @items = @items.merge({item.type => @item})
  else
    @items[item.type][:count] += 1
    @items[item.type][:total_price] += item.price
  end

end

end

