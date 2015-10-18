class ProfilesController < ApplicationController

  def show
    #instance variable are available to controller and views..params hash is sent in by web browser with id parameter

    @user = User.find_by_profile_name(params[:id])

    # I know i know if..else..end read better.
    unless @user
      render file: 'public/404', status: 404, formats: [:html] #when rails cant find, render 404 with 404 status
    else
      # we will use scoping(@__) to get only user's statuses instead of all statuses, we have association relation user.hasmany.statuses
      @statuses = @user.statuses.to_a #below is how it should be..but just let it goo...to_a is lazy loading (statuses.load works too)
      #@statuses = @user.statuses.order('created_at DESC').limit(5).to_a
      render action: :show
    end
  end
end
