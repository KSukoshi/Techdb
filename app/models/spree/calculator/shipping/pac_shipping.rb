require 'correios-frete'
require_dependency 'spree/calculator'
require_dependency 'spree/shipping_calculator'

module Spree
  class Calculator::Shipping::PacShipping < Spree::ShippingCalculator
    def self.description
      "Correios API PAC"
    end

    def compute_package(_package)
        run_api
      end

      def run_api
        order_correios = Spree::LineItem.last.order_id
        current_correios = Spree::Order.find(order_correios).ship_address_id
        zip_correios = Spree::Address.find(current_correios).zipcode
        variant_correios = Spree::LineItem.last.variant_id
        frete = Correios::Frete::Calculador.new :cep_origem => "01207-000",
                                                :cep_destino => zip_correios,
                                                :peso => Spree::Variant.find(variant_correios).weight,
                                                :comprimento => Spree::Variant.find(variant_correios).depth,
                                                :largura => Spree::Variant.find(variant_correios).width,
                                                :altura => Spree::Variant.find(variant_correios).height

        servicos = frete.calcular :sedex, :pac
        servicos[:pac].valor
      end
    end
  end
