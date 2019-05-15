require 'correios-frete'
require_dependency 'spree/calculator'
require_dependency 'spree/shipping_calculator'

module Spree
  module Calculator::Shipping::CustomShippingCalculator < ShippingCalculator
    class PerItem < ShippingCalculator
      preference :weight, :decimal, default: 0
      preference :depth, :decimal, default: 0
      preference :width, :decimal, default: 0
      preference :height, :decimal, default: 0
      preference :zipcode, :string, default: ->{ Spree::Address[:zipcode] }

    def self.description
      "CorreiosAPI"
    end

    def compute_package(_package)
        calcula

      end

      def calcula
        frete = Correios::Frete::Calculador.new :cep_origem => "22790-671",
                                                :cep_destino => :zipcode,
                                                :peso => :weight,
                                                :comprimento => :depth,
                                                :largura => :width,
                                                :altura => :height

        servicos = frete.calcular :sedex, :pac
        servicos[:sedex].valor
      end
    end
  end
end
