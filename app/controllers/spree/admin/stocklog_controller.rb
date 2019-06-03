module Spree
  module Admin
    class Spree::Admin::StocklogController < Spree::Admin::BaseController
      before_action :find_movements
      def index
      end
      def find_movements
        @stockmovelog = Spree::StockMovement.all
      end
    end
  end
end
