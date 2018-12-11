class Transaction < ApplicationRecord

  validates :amount, :currency, :quotation, :transaction_type, presence: true

 def en_to_pt(word)
   return 'Dólar' if word == 'dollar'
   return 'Real' if word == 'real'
   return 'Venda' if word == 'sell'
   return 'Compra' if word == 'buy'
 end


 def real_to_dollar(value)
   value / self.quotation
 end


 def total
   total = 0
   if currency == 'dollar'
     return total += self.amount if transaction_type == 'buy'
     return total -= self.amount if transaction_type == 'sell'
   else
     return total += real_to_dollar(self.amount) if transaction_type == 'buy'
     return total -= real_to_dollar(self.amount) if transaction_type == 'sell'
   end
 end

end
