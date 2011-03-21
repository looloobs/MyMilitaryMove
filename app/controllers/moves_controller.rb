class MovesController < ApplicationController
  # GET /moves
  # GET /moves.xml
  def index
    @moves = Move.all
    @itinerary = @move.itinerary
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @moves }
    end
  end

  # GET /moves/1
  # GET /moves/1.xml
  def show
    @move = Move.find(params[:id])
    @installation = @move.end.installation_id
    @user = current_user
    @start = @move.start.installation
    @end = @move.end.installation
    
    @family = @user.families
    @spouse = @user.spouse
    @pets = @user.pets
    @events = @move.events
    @today = Event.find(:all, :conditions => ['move_id = ? AND start_at >= ? AND start_at < ?', @move.id, Date.today, Date.today+1.day], :order => :start_at)
    @tomorrow = Event.find(:all, :conditions => ['move_id = ? AND start_at >= ? AND start_at < ?', @move.id, Date.today + 1.day, Date.today + 2.days], :order => :start_at)
    @nextday = Event.find(:all, :conditions => ['move_id = ? AND start_at >= ? AND start_at < ?', @move.id, Date.today + 2.days, Date.today + 3.days], :order => :start_at)
    @lists = List.find(:all, :conditions => ['move_id = ?', @move], :limit => 3)
    @notes = Note.find(:all, :conditions => ['move_id = ?', @move])
    @neighborhoods = Neighborhood.find(:all, :conditions => ['move_id = ?', @move])
    @homes = Home.find(:all, :conditions => ['move_id = ?', @move])
    @schools = School.find(:all, :conditions => ['move_id = ?', @move])
  end

  # GET /moves/new
  # GET /moves/new.xml
  def new
    @move = Move.new
    @move.build_start
    @move.build_end
    @move.build_installation

    
    @user = current_user
    render :layout => "form"
  end

  # GET /moves/1/edit
  def edit
    @move = Move.find(params[:id])
    render :layout => "form"
  end

  # POST /moves
  # POST /moves.xml
  def create
    @move = Move.new(params[:move])
    @user = current_user

    respond_to do |format|
      if @move.save

        flash[:notice] = 'Move was successfully created.'
        format.html { redirect_to move_path(@move) }
        format.xml  { render :xml => @move, :status => :created, :location => @move }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @move.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /moves/1
  # PUT /moves/1.xml
  def update
    @move = Move.find(params[:id])

    respond_to do |format|
      if @move.update_attributes(params[:move])
        flash[:notice] = 'Move was successfully updated.'
        format.html { redirect_to(@move) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @move.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /moves/1
  # DELETE /moves/1.xml
  def destroy
    @move = Move.find(params[:id])
    @move.destroy

    respond_to do |format|
      format.html { redirect_to(moves_url) }
      format.xml  { head :ok }
    end
  end
  
  def list
       @move = Move.find(params[:id])
       @list = List.new(:name => '2-3 Months Before Move', :move_id => @move.id)
       @list.save
       @tasks = [
          'If you have orders call transportation office about scheduling a meeting to signing up with the DPS system.',
          'Begin research for deciding to live on-post or off-post.',
          'Research schools/childcare. Get on waiting lists if necessary.',
          'Research what kids activities are available at your new duty station.',
          'Start talking to kids about the transfer.',
          'Notify landlord of move without naming a specific date.',
          'Start working on your inventory of valuable items (use My Things to track them).',
          'Obtain any medical/dental/optical records will not be transferred by the military.',
          'Obtain pet health records and ensure pets are up to date on all vaccines.',
          'Ensure your power of attorney is up to date.',
          'Organize and set aside all birth/marriage certificates, SS cards, insurance policies, pet health records, powers of attorney and warranties. Make copies or scan. These items should travel with you in the move.',
          'Start clearing out closets, have a yard sale or give it away.',
          'If you are going to rent out your current home arrange with a property manager to care for that home.',
          ]
       @tasks.each do |t|
          @item = Task.new(:task => t, :list_id => @list.id)
          @item.save
       end
       @list2 = List.new(:name => '1 Month Before Move', :move_id => @move.id)
       @list2.save
       @tasks2 = [
          'If you have not already call transportation office about scheduling a meeting to signing up with the DPS system.',
          'Determine where you are going to live. If you are buying a new home you should have an offer and financing lined up. Aim to have your closing date very close to your moving date.',
          'Work on your itinerary. How are you getting from start to end point? Are you going to build a vacation into this move?',
          'Get all maintenance work done on cars.',
          'Be sure that all proper paperwork is in your car.',
          'Start eating through or giving away your non-perishable food items.',
          ]
       @tasks2.each do |s|
         @item = Task.new(:task => s, :list_id => @list2.id)
         @item.save
       end
       @list3 = List.new(:name => ' 1-3 Weeks Before Your Move', :move_id => @move.id)
       @list3.save
       @tasks3 = [
          'Reconfirm your packing, pick-up and delivery dates with your mover.',
          'If you are getting an advance on your move pay apply at finance.',
          'Call service providers (electricity, cable, internet) and set up a cancellation date.',
          'Notify service providers, credit cards companies etc of you new or temporary address.',
          'Arrange for carpet cleaners to come after you move out.',
          'Arrange for move out cleaners.',
          'Renew and pick up prescriptions.',
          'If you are concerned about weight, prepare/separate professional gear weight (this includes pro books and equipment). ',
          'Buy a bunch of ziplock bags -- these will come in handy when packing large sets of small items, like silverware, or for components of furniture that need to be broken down (i.e., screws, bolts).',
          'Remove wall accessories such as drapery rods, small appliances, food and utensil racks.',
          'If required fill in screw holes in the wall.',
          'Pull out all items from beneath stairways, attics or any other hidden area.',
          'Drain garden hoses.',
          'Drain oil and gas from lawn mowers and other gas operated tools. ',
          'Disconnect spark plugs.',
          'Dispose of flammables such as fireworks, cleaning fluids, matches, acids, chemistry sets, aerosal cans, ammunition, oil, paint and thinners.',
          'Disassemble outdoor play equipment and structures such as utility sheds.',
          'Schedule walk-through with property manager.'
          ]
       @tasks3.each do |r|
         @item = Task.new(:task => r, :list_id => @list3.id)
         @item.save
       end
       @list4 = List.new(:name => 'Day before and Day of Move', :move_id => @move.id)
       @list4.save
       @tasks4 = [
          'If you still own them repack your flat screen TV into original box.',
          'Unplug all electronics. Collect any removable wires/cables, label and box beforehand.',
          'Ensure your computer drive is backed up.',
          'Set aside cleaning materials.',
          'Return cable boxes',
          'Clean refridgerator/freezer and oven',
          'Leave all the old keys that are needed by the new tenant or owner with your realtor/property manager or a neighbor.',
          'Get pets under control before movers arrive. If necessary, ask a neighbor to keep them for you if you have not made boarding arrangements.',
          'Empty all trash.',
          'Clean out trash cans.',
          'Come up with a plan to feed your family and the movers day of move.',
          'Clean out coffee maker.',
          'Set aside weapons to move yourself or track movement through movers.',
          'Make sure you have the number of your transportation office in your phone in case of an issue.',
          'Check every square foot of your home for items.'
          ]
       @tasks4.each do |y|
         @item = Task.new(:task => y, :list_id => @list4.id)
         @item.save
       end
       @list5 = List.new(:name => 'Items that should be Separated for Move Day', :move_id => @move.id)
        @list5.save
        @tasks5 = [
           'Suitcases',
           'Important documents',
           'Hardware you are carrying with you.',
           'Sentimental items you are carrying with you.',
           'Photos/jewelry you are carrying with you.',
           'Every valuable item should be photographed and recorded using My Things.'
           ]
        @tasks5.each do |y|
          @item = Task.new(:task => y, :list_id => @list5.id)
          @item.save
        end
       @list6 = List.new(:name => 'Pack a MOVE-IN box to take with you:', :move_id => @move.id)
        @list6.save
        @tasks6 = [
           'Toilet paper',
           'Cleaning supplies',
           'Air mattress(es)',
           'Sheets',
           'Towels',
           'Snacks',
           'Paper plates/napkins/utensils',
           'Paper towels'
           ]
        @tasks6.each do |u|
          @item = Task.new(:task => u, :list_id => @list6.id)
          @item.save
        end
        redirect_to :back
  end 
end
