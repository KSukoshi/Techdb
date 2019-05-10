require 'correios-frete'
require_dependency 'spree/calculator'
require_dependency 'spree/shipping_calculator'

module Spree
  class Calculator::Shipping::CustomShippingCalculator < Spree::ShippingCalculator
    def self.description
      "SEDEX"
    end

    def compute_package(package)
      frete = Correios::Frete::Calculador.new :cep_origem => "04094-050",
                                              :cep_destino => "90619-900",
                                              :peso => 0.3,
                                              :comprimento => 30,
                                              :largura => 15,
                                              :altura => 2
    end
  end
end
