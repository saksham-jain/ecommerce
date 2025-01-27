require "minitest/autorun"
require "mutant/minitest/coverage"

require_relative "../lib/pricing"

module Pricing
  class Test < Infra::InMemoryTest

    def before_setup
      super
      Configuration.new.call(cqrs)
    end

    private

    def set_price(product_id, amount)
      run_command(SetPrice.new(product_id: product_id, price: amount))
    end

    def calculate_total_value(order_id)
      run_command(CalculateTotalValue.new(order_id: order_id))
    end

    def add_item(order_id, product_id)
      run_command(
        AddPriceItem.new(order_id: order_id, product_id: product_id)
      )
    end

    def remove_item(order_id, product_id)
      run_command(
        RemovePriceItem.new(order_id: order_id, product_id: product_id)
      )
    end

    def register_coupon(uid, name, code, discount)
      run_command(RegisterCoupon.new(coupon_id: uid, name: name, code: code, discount: discount))
    end

    def fake_name
      "Fake name"
    end
  end
end
