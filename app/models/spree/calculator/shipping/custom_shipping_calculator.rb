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
        weight = order.line_items.inject(0) do |weight, line_item|
          line_item_weight = line_item.variant.weight
        depth = order.line_items.inject(0) do |depth, line_item|
          line_item_depth = line_item.variant.depth
        width = order.line_items.inject(0) do |width, line_item|
          line_item_width = line_item.variant.width
        height = order.line_items.inject(0) do |height, line_item|
          line_item_height = line_item.variant.height

        frete = Correios::Frete::Calculador.new :cep_origem => "22790-671",
                                                :cep_destino => ":zipcode",
                                                :peso => weight,
                                                :comprimento => depth,
                                                :largura => width,
                                                :altura => height

        servicos = frete.calcular :sedex, :pac
        servicos[:sedex].valor
      end
    end
  end
