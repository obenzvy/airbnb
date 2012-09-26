class Financial < ActiveRecord::Base
  attr_accessible :days, :fixed_costs, :price, :rent, :utilities, :duration, :security_deposit

  def total_income
  	self.price * self.days * self.duration
  end

  def total_risk
  	self.rent * (self.duration - 1) + (self.utilities * self.duration) + self.fixed_costs + security_deposit
  end

  def total_net
	total_income - total_risk
  end

  def duration_expense
     
    arry = [-1 * self.security_deposit]
    (self.duration - 1).times do
    arry << -1 * (self.rent + self.utilities)
    end
    arry << -self.utilities 
  end

  def duration_income
    arry = [0, 0]
    self.duration.times do 
      arry << self.price * self.days 
    end
    arry
  end

  def monthly_cashflow
    duration_income.map.with_index { |value, index| value + duration_expense[index].to_i }

  end

  def aggregate_cashflow
    arry = []
    monthly_cashflow.each.with_index do |value, index| 
      arry << arry[index - 1].to_i + monthly_cashflow[index].to_i 
    end
    arry
  end

  def breakeven
    aggregate_cashflow.index do |x|
      x >= 0
    end
  end

  def monthly_income
    (self.price * self.days) 
  end

  def monthly_expense
    (self.rent + self.utilities)
  end

  def monthly_net
    monthly_income - monthly_expense
  end

  def monthly_roi
    ((monthly_net / monthly_expense.to_f).round(2) * 100).to_i
  end

  def total_roi
    ((aggregate_cashflow.last / total_risk.to_f).round(2) * 100).to_i
  end



end
