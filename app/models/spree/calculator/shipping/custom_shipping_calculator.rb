require 'correios-frete'
require_dependency 'spree/calculator'
require_dependency 'spree/shipping_calculator'

module Spree
  class Calculator::Shipping::CustomShippingCalculator < Spree::ShippingCalculator
    def self.description
      "CorreiosAPI"
    end

    def compute_package(_package)
        binding.pry
        calcula

        9090.90
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
