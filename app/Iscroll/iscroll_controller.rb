require 'rho/rhocontroller'
require 'helpers/browser_helper'

class IscrollController < Rho::RhoController
  include BrowserHelper

  # GET /Iscroll
  def index
    @iscrolls = Iscroll.find(:all)
    render :back => '/app'
  end

  # GET /Iscroll/{1}
  def show
    @iscroll = Iscroll.find(@params['id'])
    if @iscroll
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Iscroll/new
  def new
    @iscroll = Iscroll.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Iscroll/{1}/edit
  def edit
    @iscroll = Iscroll.find(@params['id'])
    if @iscroll
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Iscroll/create
  def create
    @iscroll = Iscroll.create(@params['iscroll'])
    redirect :action => :index
  end

  # POST /Iscroll/{1}/update
  def update
    @iscroll = Iscroll.find(@params['id'])
    @iscroll.update_attributes(@params['iscroll']) if @iscroll
    redirect :action => :index
  end

  # POST /Iscroll/{1}/delete
  def delete
    @iscroll = Iscroll.find(@params['id'])
    @iscroll.destroy if @iscroll
    redirect :action => :index  
  end

end
