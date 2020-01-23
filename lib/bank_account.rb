#Build a BankAccount class where one instance of the class can transfer money to another instance through a Transfer class. 

class BankAccount
  attr_reader :name 
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  
  def deposit(money)
    @balance += money
  end
  
  def display_balance 
    return "Your balance is $#{@balance}."
  end
  
  def valid?
    if self.status == "open" && self.balance > 0 
      true 
    else 
      false
    end
  end
  
  def close_account
    self.status = "closed"
  end

end
