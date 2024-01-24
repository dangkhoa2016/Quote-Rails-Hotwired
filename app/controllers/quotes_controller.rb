class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]
  before_action :build_quote, only: [:new, :create]
  before_action :set_main_page_flag, only: [:new, :edit], unless: :turbo_frame_request?

  def index
    @quotes ||= current_company.quotes.ordered
  end

  def show; end

  def new; end

  def edit; end

  def create
    @main_page = params.dig(:quote, :main_page)
    @quote.assign_attributes(**quote_params, company: current_company)

    if @quote.save
      handle_response('Quote was successfully created.')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @main_page = params.dig(:quote, :main_page)

    if @quote.update(quote_params)
      handle_response('Quote was successfully updated.')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @main_page = params.dig(:main_page)
    @quote.destroy!
    handle_response('Quote was successfully destroyed.', quotes_path)
  end

  private

  def set_quote
    @quote = current_company.quotes.find(params[:id])
  end

  def build_quote
    @quote = Quote.new
  end

  def quote_params
    params.require(:quote).permit(:name)
  end

  def set_main_page_flag
    @main_page = action_name
  end

  def handle_response(notice, redirect_path = quote_path(@quote))
    respond_to do |format|
      format.turbo_stream do
        if @main_page
          redirect_to redirect_path, notice: notice
          return
        end

        flash.now[:notice] = notice
      end
      format.html { redirect_to redirect_path, notice: notice }
    end
  end
end
