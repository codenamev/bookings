class BookingsController < ApplicationController
  respond_to :html, :json

  before_action :find_booking, except: [:create, :index]

  def index
    @bookings = Booking.current.order(:starts_at)
    respond_with @bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      if request.xhr?
        render json: {status: :success}.to_json
      else
        redirect_to bookings_url
      end
    else
      if request.xhr?
        render json: {errors: @booking.errors.full_messages, status: :error}.to_json
      else
        render 'new'
      end
    end
  end

  def show
    @booking = Booking.find(params[:id])
    respond_with @bookings
  end

  def destroy
    if @booking.destroy
      flash[:notice] = "Booking: #{@booking} deleted"
      redirect_to bookings_url
    else
      render 'index'
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      flash[:notice] = 'Your booking was updated successfully'

      if request.xhr?
        render json: {status: :success}.to_json
      else
        redirect_to bookings_url
      end
    else
      if request.xhr?
        render json: {errors: @booking.errors.full_messages, status: :error}.to_json
      else
        render 'edit'
      end
    end
  end

  private

  def booking_params
    params[:booking].permit!
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

end
