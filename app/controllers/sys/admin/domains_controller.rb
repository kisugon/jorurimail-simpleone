class Sys::Admin::DomainsController < Sys::Controller::Admin::Base
  include Sys::Controller::Scaffold::Base

  def pre_dispatch
    return error_auth unless Core.user.has_auth?(:manager)
  end

  def index
    @item = Sys::Domain.find(:first)
    if @item.present?
      #_index @item
      redirect_to(:action => :show, :id => @item.id)
    else
      redirect_to(:action => :new)
    end
  end

  def show
    @item = Sys::Domain.find(params[:id])
    _show @item
  end

  def new
    @item = Sys::Domain.new
  end

  def create
    @item = Sys::Domain.new(params[:item])
    _create @item
  end

  def update
    @item = Sys::Domain.find(params[:id])
    @item.attributes = params[:item]
    _update @item
  end

  def destroy
    @item = Sys::Domain.find(params[:id])
    _destroy @item
  end
end
