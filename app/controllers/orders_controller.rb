class OrdersController < ApplicationController
 before_action :set_order, only: [:show, :edit, :update, :destroy]
 before_action :require_logged_in, only: [:show, :edit, :update, :destroy]


  def new
  end

  def edit
  end

  def show
  end

  def index
  end

  def destory
  end
end
