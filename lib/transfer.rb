#The Transfer class acts as a space for a transaction between two instances of the bank account class. Think of it this way: you can't just transfer money to another account without the bank running checks first.Transfer instances will do all of this, as well as check the validity of the accounts before the transaction occurs. Transfer instances should be able to reject a transfer if the accounts aren't valid or if the sender doesn't have the money.

#Transfers start out in a "pending" status. They can be executed and go to a "complete" state. They can also go to a "rejected" status. A completed transfer can also be reversed and go into a "reversed" status.

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
  
  def execute_transaction #successful transaction includes: transfer happening only once, sender has enough funds and is valid
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


