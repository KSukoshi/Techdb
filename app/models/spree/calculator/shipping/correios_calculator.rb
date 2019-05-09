require_dependency 'spree/calculator'
require_dependency 'spree/shipping_calculator'
require 'correios-frete'

module Spree
  class Calculator::Shipping::CorreiosFrete < Spree::ShippingCalculator
    preference :api_key, :string

    def self.description
      "Correios API"
    end
    def compute_package(package)
      frete = Correios::Frete::Calculador.new :cep_origem => "01207-000",
                                        :cep_destino => Spree::Product.find(1).property('zipcode'),
                                        :peso => Spree::Product.find(1).property('weight'),
                                        :comprimento => Spree::Product.find(1).property('depth'),
                                        :largura => Spree::Product.find(1).property('width'),
                                        :altura => Spree::Product.find(1).property('height')
    end
    def available?(order)
      order.currency == "BRL"
    end
  end
end
