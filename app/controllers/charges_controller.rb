class ChargesController < ApplicationController
    def new
        @stripe_btn_data = {
            key: "#{ Rails.configuration.stripe[:publishable_key] }",
            description: "BigMoney Membership - #{current_user.email}",
            amount: 10_00
        }
    end

    def create
        customer = Stripe::Customer.create(
            email: current_user.email,
            card: params[:stripeToken]
            )


        charge = Stripe::Charge.create(
            customer: customer.id,
            amount: 10_00,
            description: "BigMoney Membership - #{current_user.email}",
            currency: 'usd'
            )


        if charge.paid?
            flash[:notice] = "Thanks for all the money, #{current_user.role}! Feel free to pay me again."
            current_user.premium!
            redirect_to user_root_path
        else
            flash[:alert] = 'Charge failed to process, please try again'
            redirect_to user_path(current_user)
        end

        # Stripe will send back CardErrors when something goes wrong
        # this block will catchs and display those errors
    rescue Stripe::CardError => e
        flash[:alert] = e.message
        redirect_to new_charge_path

    end

end
