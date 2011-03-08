class SponsoredProjectAllocationsController < ApplicationController

  layout 'cmu_sv'

  def index
    @allocations = SponsoredProjectAllocation.current
  end

  def new
    @allocation = SponsoredProjectAllocation.new
    @people = Person.staff
    @projects = SponsoredProject.current
  end

  def edit
    @allocation = SponsoredProjectAllocation.find(params[:id])
    @people = Person.staff
    @projects = SponsoredProject.current
  end

  def create
    @allocation = SponsoredProjectAllocation.new(params[:sponsored_project_allocation])
    @people = Person.staff
    @projects = SponsoredProject.current

    if @allocation.save
      flash[:notice] = 'Allocation was successfully created.'
      redirect_to(sponsored_project_allocations_path)
    else
      render "new"
    end

  end

  def update
    @allocation = SponsoredProjectAllocation.find(params[:id])
    @people = Person.staff
    @projects = SponsoredProject.current

    if @allocation.update_attributes(params[:sponsored_project_allocation])
      flash[:notice] = 'Allocation was successfully updated.'
      redirect_to(sponsored_project_allocations_path)
    else
      render "edit"
    end

  end

  
end