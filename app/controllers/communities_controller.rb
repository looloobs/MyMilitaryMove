class CommunitiesController < ApplicationController

def index
   @move= Move.find(params[:move_id])
   @neighborhood = Neighborhood.find(params[:neighborhood_id])
end

def create
   @community = Community.new(params[:community]) 
   @move= Move.find(params[:move_id])
   @neighborhood = Neighborhood.find(params[:neighborhood_id])   
   
   respond_to do |format|
     if @community.save
       flash[:notice] = 'Neighborhood was successfully created.'
       format.html { redirect_to move_neighborhoods_path(@move) }
       format.xml  { render :xml => @neighborhood, :status => :created, :location => @neighborhood }
     else
       format.html { render :layout => 'form',:action => "new" }
       format.xml  { render :xml => @neighborhood.errors, :status => :unprocessable_entity }
     end
   end
 end

 # PUT /neighborhoods/1
 # PUT /neighborhoods/1.xml
 def update
   @neighborhood = Neighborhood.find(params[:id])
   @move= Move.find(params[:move_id])
   
   respond_to do |format|
     if @community.update_attributes(params[:neighborhood])
       flash[:notice] = 'Neighborhood was successfully updated.'
       format.html { redirect_to move_neighborhoods_path(@move) }
       format.xml  { head :ok }
     else
       format.html { render :layout => 'form',:action => "edit" }
       format.xml  { render :xml => @neighborhood.errors, :status => :unprocessable_entity }
     end
   end
 end
 
 def destroy
   @community = Community.find(params[:id])
   @move= @community.move
   @community.destroy

   respond_to do |format|
     format.html { redirect_to move_neighborhoods_path(@move) }
     format.xml  { head :ok }
   end
 end
 
 end