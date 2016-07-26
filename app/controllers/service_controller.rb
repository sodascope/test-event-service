class ServiceController < ApplicationController

  def index
    render json: { status: "ok" }, status: :ok
  end

  def events
    if ( params[:org].present? )
      if ( params[:hostname].present? )
        #do org and host
        @events = Event.where(:org => params[:org], :hostname => params[:hostname])
      else
        #do only org
        @events = Event.where(:org => params[:org])
      end
    else
      @events = Event.all
    end

    if ( @events )
      #check for limit
      if ( params[:n].present? )
        @events = @events.order({ created_at: :asc }).limit(params[:n])
      end
      render :json => @events
    else
      render :json => { error: @events.errors.full_messages }
    end
  end

  def create
    # debug prints, take out for production
    # puts "#{params[:org]} - #{params[:hostname]} - #{params[:description]}"
    @event = Event.create(org: params[:org], hostname: params[:hostname], description: params[:description])
    if ( @event.save )
      render :json => @event
    else
      render :json => { error: @event.errors.full_messages }
    end

  end

end
