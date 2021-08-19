class CashRegister
  attr_accessor :total, :discount, :transaction, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    self.transaction = price * quantity
    self.total += self.transaction
    quantity.times do
      self.items << title
    end
  end

  def apply_discount
    if self.discount > 0
      total_discount_percentage = (100.00 - self.discount.to_f) / 100
      self.total = (self.total * total_discount_percentage).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.transaction
  end
end