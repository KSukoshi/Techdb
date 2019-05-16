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

      end

      def calcula
        variant_correios = Spree::LineItem.last.variant_id
        frete = Correios::Frete::Calculador.new :cep_origem => "01207-000",
                                                :cep_destino => "03615-080",
                                                :peso => Spree::Variant.find(variant_correios).weight,
                                                :comprimento => Spree::Variant.find(variant_correios).depth,
                                                :largura => Spree::Variant.find(variant_correios).width,
                                                :altura => Spree::Variant.find(variant_correios).height

        servicos = frete.calcular :sedex, :pac
        servicos[:sedex].valor
      end
    end
  end
