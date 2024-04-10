class PagesController < ApplicationController

  def square_new
    render({ :template => "/calc_template/square_new"})
  end
  def square_results
    @input = params.fetch("sq").to_f
    @output = @input ** 2

    render({ :template => "/calc_template/square_results"})
  end

  def sqrt_new
    render({ :template => "/calc_template/sqrt_new"})
  end
  def sqrt_results
    @sqrt_input = params.fetch("sqrt").to_f
    @sqrt_output = @sqrt_input ** 0.5

    render({ :template => "/calc_template/sqrt_results"})
  end

  def payment_new
    render({ :template => "/calc_template/payment_new"})
  end
  def payment_results
    @apr_input = '%.4f' % params.fetch("apr").to_f.round(4)
    @apr_input += "%"
    @years_input = params.fetch("years").to_i
    @principal_input = params.fetch("principal").to_f.to_fs(:currency)
  
    r = @apr_input.to_f / 100 / 12
    term = @years_input * 12
  
    @nominator = r * params.fetch("principal").to_f
    @denominator = 1 - (1 + r) ** -term
  
    @payment = (@nominator / @denominator)  

    render({ :template => "/calc_template/payment_results"})
  end

  def random_new
    render({ :template => "/calc_template/random_new"})
  end
  def random_results
    @minimum = params.fetch("minimum").to_f
    @maximum = params.fetch("maximum").to_f

    @random = rand(@minimum..@maximum).to_f

    render({ :template => "/calc_template/random_results"})
  end

end
