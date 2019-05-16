require 'correios-frete'
require_dependency 'spree/calculator'
require_dependency 'spree/shipping_calculator'

module Spree
  module Calculator::Shipping::CustomShippingCalculator < Spree::ShippingCalculator
    class PerItem < ShippingCalculator

    def self.description
      "CorreiosAPI"
    end

    def compute_package(_package)
        calcula

      end

      def calcula
        binding.pry
        frete = Correios::Frete::Calculador.new :cep_origem => "01207-000",
                                                :cep_destino => :zipcode,
                                                :peso => Spree::Variant.select(:weight),
                                                :comprimento => Spree::Variant.select(:depth),
                                                :largura => Spree::Variant.select(:width),
                                                :altura => Spree::Variant.select(:height)

        servicos = frete.calcular :sedex, :pac
        servicos[:sedex].valor
      end
    end
  end
end
