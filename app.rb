class Checkout
 require './items.rb'
 require './rules.rb'

def initialize(rules)
  @rules = rules
end

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
  proceed_discount(@rules[item.type.to_sym], @items[item.type])
end

def proceed_discount(rule, item)
  unless (rule.nil?)
      if item[:count].send(rule[:condition_method], rule[:condition]).zero?
        item[:total_price] = item[:total_price].send(rule[:operation], rule[:discount])
      end
    end
  end

def general_rules(items, total)
  rule = @rules[:total]
  items.values.each do |item|
    total += item[:total_price]
  end

  if total.send(rule[:condition_method], rule[:condition])
    return total = total.send(rule[:operation], rule[:discount])
  else
    return total
  end
end

def total
  @total ||= 0
  @total = general_rules(@items, @total)
end

end