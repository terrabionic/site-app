class PagefeedsController < ApplicationController
  before_action :set_pagefeed, only: [:show, :edit, :update, :destroy]

  # GET /pagefeeds
  # GET /pagefeeds.json
  def index
    @pagefeeds = Pagefeed.all
  end

  # GET /pagefeeds/1
  # GET /pagefeeds/1.json
  def show
  end

  # GET /pagefeeds/new
  def new
    @pagefeed = Pagefeed.new
  end

  # GET /pagefeeds/1/edit
  def edit
  end

  # POST /pagefeeds
  # POST /pagefeeds.json
  def create
    @pagefeed = Pagefeed.new(pagefeed_params)

    respond_to do |format|
      if @pagefeed.save
        format.html { redirect_to @pagefeed, notice: 'Pagefeed was successfully created.' }
        format.json { render :show, status: :created, location: @pagefeed }
      else
        format.html { render :new }
        format.json { render json: @pagefeed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pagefeeds/1
  # PATCH/PUT /pagefeeds/1.json
  def update
    respond_to do |format|
      if @pagefeed.update(pagefeed_params)
        format.html { redirect_to @pagefeed, notice: 'Pagefeed was successfully updated.' }
        format.json { render :show, status: :ok, location: @pagefeed }
      else
        format.html { render :edit }
        format.json { render json: @pagefeed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pagefeeds/1
  # DELETE /pagefeeds/1.json
  def destroy
    @pagefeed.destroy
    respond_to do |format|
      format.html { redirect_to pagefeeds_url, notice: 'Pagefeed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_notice_tofeed_url
    require 'rss'
    require "date"
    @pagefeed = Pagefeed.find(params[:pagefeed_id])
    rss_a = RSS::Parser.parse(@pagefeed.link, false)
    case rss_a.feed_type
      when 'rss'
        
          rss_a.items.each { |item| 
            @notice_last = Notice.where("title LIKE ?", item.title)
            if @notice_last.length == 0
              params_notice = {title: item.title, link: item.link, date_pub: item.pubDate, description: item.description, sector_id: @pagefeed.sector.id, active: false}
              @notice_new = Notice.new(params_notice)
              @notice_new.save
            end
          } 
      when 'atom'
          rss_a.items.each { |item| 
            @notice_last = Notice.where("title LIKE ?", item.title.content)
            if @notice_last.length == 0
              params_notice = {title: item.title.content, link: item.link.content, date_pub: item.pubDate.content,description: item.description.content, sector_id: @pagefeed.sector.id, active: false}
              @notice_new = Notice.new(params_notice)
              @notice_new.save
            end
          }
    end
    @pagefeeds = Pagefeed.all
    respond_to do |format|
      format.html { redirect_to pagefeeds_path(@pagefeeds) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pagefeed
      @pagefeed = Pagefeed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pagefeed_params
      params.require(:pagefeed).permit(:title, :link, :sector_id)
    end
end
