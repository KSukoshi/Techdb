module Spree
  module Admin
    class Spree::Admin::StocklogController < Spree::Admin::BaseController
      before_action :load_movements
      def index
      end
      def load_movements
        @stockmovelog = Spree::StockMovement.all
      end
    end
  end
end
