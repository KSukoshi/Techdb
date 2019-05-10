require_dependency 'spree/calculator'
require_dependency 'spree/shipping_calculator'

module Spree
  module Calculator::Shipping
    class CorreiosApi < ShippingCalculator
      preference :api_key, :string

      def compute_package(_package)
        binding.pry
        calcula

        9090.90
      end

      def self.description
        "Correios API"
      end


      def calcula
        binding.pry
        frete = Correios::Frete::Calculador.new :cep_origem => "22790-671",
                                                :cep_destino => "06783-090",
                                                :peso => 7.3,
                                                :comprimento => 30,
                                                :largura => 20,
                                                :altura => 35

        servicos = frete.calcular :sedex, :pac
        binding.pry
      end
    end
  end
end
