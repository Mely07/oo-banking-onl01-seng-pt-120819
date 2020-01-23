class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount 
  end
  
  def valid? #valid if sender & receiver (bank acct holders) are valid
    if @sender.valid? && @receiver.valid?
      return true
    else 
      return false
    end
  end
  
  def execute_transaction #successful transaction includes: transfer happening only once, sender has enough funds to cover and is valid
    if (self.valid? == false || sender.balance < amount)
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif self.status == "complete" 
      return "Transaction already completed"
    elsif self.valid? == true
       ((receiver.balance += amount) && (sender.balance -= amount))
       self.status = "complete" 
    end
  end
  
  def reverse_transfer
    if self.status == "complete"
      ((receiver.balance -= amount) && (sender.balance += amount))
      self.status = "reversed"
    end  
  end
end

