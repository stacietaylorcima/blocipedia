class ChargesController < ApplicationController
  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Upgrade to Premium",
      amount: 15.00
    }
  end

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Stripe customer',
      :currency    => 'usd'
    )

    # Update user's role to premium after they are charged
    current_user.update_attribute(:role, 'premium')

    flash[:notice] = "Thank you for your payment, #{current_user.email}! You are now a Premium member."
    redirect_to users_show_path

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end
end
