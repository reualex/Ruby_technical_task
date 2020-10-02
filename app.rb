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
  @items = @items.merge({item.type => @item})
end

end

