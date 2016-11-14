class ChargesController < ApplicationController    
    def new
        @stripe_btn_data = {
            key: "#{ Rails.configuration.stripe[:publishable_key] }",
            description: "BigMoney Membership - #{current_user.email}",
            amount: Amount.default
        }
    end
    
    def create
        
        # to creates a Stripe Customer object, for associating with the charge
        customer = Stripe::Customer.create(
                email: current_user.email,
                card: params[:stripeToken]
            )
        
        
        charge = Stripe::Charge.create(
                
                # this is not the user_id in my app
                customer: customer.id,
                amount: Amount.default,
                description: "BigMoney Membership - #{current_user.email}",
                currency: 'usd'
            )
        
        
        
        
        flash[:notice] = "Thanks for all the money, #{current_user.role}! Feel free to pay me again."
        @user = User.find(current_user.id)
        @user.role = "premium"
        @user.save
        redirect_to user_root_path
        
        # Stripe will send back CardErrors when something goes wrong
        # this block will catchs and display those errors
        rescue Stripe::CardError => e
            flash[:alert] = e.message
            redirect_to new_charge_path
        
    end
    
   
    
    private
        
    Amount = Hash.new(10_00)
    
    
    
end