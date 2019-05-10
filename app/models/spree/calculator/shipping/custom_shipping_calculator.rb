require 'correios-frete'
require_dependency 'spree/calculator'
require_dependency 'spree/shipping_calculator'

module Spree
  class Calculator::Shipping::CustomShippingCalculator < Spree::ShippingCalculator
    def self.description
      "CorreiosAPI"
    end

    def compute_package(_package)
        calcula

        9090.90
      end

      def calcula
        frete = Correios::Frete::Calculador.new :cep_origem => "22790-671",
                                                :cep_destino => "06783-090",
                                                :peso => 7.3,
                                                :comprimento => 30,
                                                :largura => 20,
                                                :altura => 35

        servicos = frete.calcular :sedex
      end
  end
end
