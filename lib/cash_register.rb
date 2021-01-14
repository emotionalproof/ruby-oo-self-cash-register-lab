require 'pry'

class CashRegister
    attr_accessor :total, :last_transaction, :items, :previous_total
    attr_reader :discount

    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @items = []
    end


    def add_item(title, price, quantity=1)
        @previous_total = total
        subtotal = 0.0

        quantity.times do |count|
            subtotal += price
            items << title
        end
        @last_transaction = subtotal
        @total += subtotal
    end

    def apply_discount
        if discount
            new_total = self.total - ((total * (discount/100.0).to_f)).to_i
            # binding.pry
            self.total = new_total.to_i
            "After the discount, the total comes to $#{total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= last_transaction
        @items.pop
        if items.empty? 
            self.total = previous_total
        end
    end
end
