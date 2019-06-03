module Spree
  module Admin
    class Spree::Admin::StocklogController < ResourceController
      before_action :load_movements
      def index
      end
      def load_movements
        @stockmovelog = Spree::StockMovement.all
      end
    end
  end
end
