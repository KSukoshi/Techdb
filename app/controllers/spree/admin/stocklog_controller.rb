module Spree
  module Admin
    class Spree::Admin::StocklogController < Spree::Admin::BaseController
      def index
        @stockmovelog = Spree::StockMovement.select("DISTINCT id, quantity, created_at, updated_at, action")
      end
    end
  end
end
