class Dish
  def initialize(item, cost)
    @attributes = {:item => item, :cost => cost}
  end

  def item
    return @attributes[:item]
  end
  
  def cost 
    return @attributes[:cost]
  end
end