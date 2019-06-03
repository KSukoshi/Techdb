module Spree
  module Admin
    class Spree::Admin::StocklogController < Spree::Admin::BaseController
      def index
        @stockmovelog = Spree::StockMovement.order(:id)
      end
    end
  end
end
