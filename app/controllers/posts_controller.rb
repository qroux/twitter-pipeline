require 'selenium-webdriver'
require 'open-uri'
require 'nokogiri'

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    url = post_params[:official_url]
    driver = Selenium::WebDriver.for :chrome
    driver.get url

    p driver.page_source

    raise
    html_doc = Nokogiri::HTML(driver.page_source)

    element = wait.until { driver.find_element(:class => "gb_P") }
    element.click
    


    raise

    html_doc.search('.css-9pa8cd').each do |element|
      @post.official_url = element.attribute('src').value
    end

    if @post.save
      redirect_to root_path
    else
      flash[:alert] = "Missing field"
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(
      :title,
      :official_url,
      :official_photo,
      :opposite_url,
      :opposite_photo)
  end
end
