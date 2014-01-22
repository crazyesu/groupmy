class GroupsController < ApplicationController

	def index
		@groups = Group.all

    respond_to do |format|
      format.html # index.html.haml
      format.json { render :json => @groups }
    end
	end

  def show
    @group = Group.find(params[:id])

    respond_to do |format|
      format.html  # show.html.haml
      format.json  { render :json => @group }
    end   
  end

  def new
    @group = Group.new

    respond_to do |format|
      format.html  # new.html.haml
      format.json  { render :json => @group }
    end
  end

  def create
    @group = Group.new(params[:group])

    respond_to do |format|
      if @group.save
        format.html  { redirect_to(@group,
                      :notice => 'Group was successfully created.') }
        format.json  { render :json => @group,
                      :status => :created, :location => @group }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @group.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html  { redirect_to(group_path,
                      :notice => 'Group was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @group.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do|format|
      format.html { redirect_to(groups_path) }
      format.json {head :ok}
    end
  end

  # private

  #   def group_params
  #     params.require(:group).permit(:title, :description)
  #   end

end
