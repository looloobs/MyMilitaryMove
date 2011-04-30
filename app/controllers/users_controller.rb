class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
    before_filter :require_user, :only => [:show, :edit, :update]

    def new
      @user = User.new
    end

    def create
      
      @user = User.new(params[:user])
      @user_session = UserSession.new
      @user.level = "Basic"
      if @user.save
         /@user.deliver_welcome!/
         redirect_to account_url
         /if @user.level == "Premium"
            flash[:notice] = "Account registered!"
            #UserSession.create(@user, false)
            @user.deliver_welcome!
            redirect_to new_order_path
         else 
            @user.deliver_welcome!
            redirect_to new_move_path
         end/
      else
        render :layout => 'user_sessions_new', :template => 'user_sessions/new'
      end
    end

    def show
      @user = @current_user
      @moves = @user.moves
      @last_move = @moves.last
      @address = Address.new
      @add = @user.address
      @family = Family.new
      @spouse = Spouse.new
      @have_spouse = @user.spouse
      @children = Family.find(:all, :conditions=> ["family_type = ? AND user_id = ?", "Child", @user.id])
      @pets = @user.pets
      @pet = Pet.new
      render :layout => "users"
    end

    def edit
      @user = @current_user
      @family = @user.families
      @pets = @user.pets
      @address = @user.address
      render :layout => "form"
    end

    def update
      @user = @current_user # makes our views "cleaner" and more consistent
      @family = @user.families
      if @user.update_attributes(params[:user])
        flash[:notice] = "Account updated!"
        redirect_to account_url
      else
        render :action => :edit
      end
    end
end
