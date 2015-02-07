class LandingController < ApplicationController
  def index
  	if params[:pid]
	  	if params[:toggle]
	  		preference = current_user.preferences.find(params[:pid])
	  		if preference.enable == 1
	  			preference_order = Preference.all
	  			preference_order.each do |f|
	  				if f.order < preference.order and f.enable==1
	  					f.order+=1
	  					f.save!
	  				end
	  			end
	  			preference.enable = 0
	  			preference.order = -1
	  		else
	  			preference_order = Preference.all
	  			preference_order.each do |f|
	  				if f.enable==1 and f.order==0
	  					f.order+=1
	  					f.save!
	  				end
	  			end
	  			preference_order_first = Preference.order(:order)
	  			preference_order_first.each do |f|
	  				if f.order>0
	 					preference.enable = 1
	  					preference.order = f.order - 1
	  					break
	  				end
	  			end
	  		end
	  	preference.save!
	  	end

	  	if params[:op]
	  		preference = current_user.preferences.find(params[:pid])
	  		if params[:op].to_i==1
	  			select_preference = current_user.preferences.where(order: preference.order+1).first
	  			select_preference.order-=1 
	  			preference.order+=1
	  		else
	  			select_preference = current_user.preferences.where(order: preference.order-1).first
	  			select_preference.order+=1
	  			preference.order-=1
	  		end
	  		preference.save!
	  		select_preference.save!
	  	end
	  	redirect_to index_preferences_path
	  end

  	if current_user.preferences.exists?
    @preferences = current_user.preferences.order(order: :desc)
    else
    Preference.create!(:name=>"WhatsApp",:order=>1,:enable=>1,:user_id=>current_user.id)
    Preference.create!(:name=>"Text Messages",:order=>2,:enable=>1,:user_id=>current_user.id)
    Preference.create!(:name=>"Email",:order=>3,:enable=>1,:user_id=>current_user.id)
    Preference.create!(:name=>"Phone Calls",:order=>0,:enable=>1,:user_id=>current_user.id)
    @preferences = current_user.preferences.order(order: :desc)
  end
  end
	respond_to do |format|
		format.html
		format.js
	end

end
