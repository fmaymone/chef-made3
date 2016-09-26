class CheckoutController < ApplicationController
  def test
    # O modo como você irá armazenar os produtos que estão sendo comprados
    # depende de você. Neste caso, temos um modelo Order que referência os
    # produtos que estão sendo comprados.
    # order = Order.find(params[:id])
    
    # session = PagSeguro::Session.create
    # if session.errors.any?
    #   puts "=> ERRORS"
    #   puts session.errors.join("\n")
    #   puts session.inspect
    # else
    #   puts "=> SESSION"
    #   puts session.id
    #   puts session.inspect
    # end
    
     payment = PagSeguro::PaymentRequest.new
   
    puts payment;
  #   puts "*******register*****"
  #   puts payment.register
  #   puts "*******register*****"
  # condicoesParcelado


     payment.reference = "12"
  #   payment.notification_url = "https://sandbox.pagseguro.uol.com.br"
  #   payment.redirect_url = "https://sandbox.pagseguro.uol.com.br"

    
      payment.items << {
        id: "12",
        description: "otimo produto",
        amount: "100",
        weight: "35"
      }
    

  #   # Caso você precise passar parâmetros para a api que ainda não foram
  #   # mapeados na gem, você pode fazer de maneira dinâmica utilizando um
  #   # simples hash.
  #   payment.extra_params << { paramName: 'paramValue' }
  #   payment.extra_params << { senderBirthDate: '07/05/1981' }
  #   payment.extra_params << { extraAmount: '-15.00' }

     response = payment.register
    
    


    if response.errors.any?
       
      puts response.url
      
      puts "******response.errors"
      puts response.errors.join("\n")
      puts "******response.errors"
    else
      redirect_to response.url
    end
   end
  
  def condicoesParcelado

    
    visa_installments = PagSeguro::Installment.find("100.00", "visa")
    
    puts
    puts "=> VISA INSTALLMENTS"
    puts
    visa_installments.each do |installment|
      puts installment.inspect
    end
        
  end
end
