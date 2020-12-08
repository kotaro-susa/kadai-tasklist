class Tasklist2sController < ApplicationController
  def index
    @tasklist2s = Tasklist2.all
  end

  def show
    @tasklist2 = Tasklist2.find(params[:id])
  end
  
  def new
    @tasklist2 = Tasklist2.new
  end

  def create
    @tasklist2 = Tasklist2.new(tasklist2_params)

    if @tasklist2.save
      flash[:success] ="タスクが正常に投稿されました"
      redirect_to @tasklist2
    else
      flash.now[:danger] = 'タスク が投稿されませんでした'
      render:new
    end
  end

  def edit 
   @tasklist2 = Tasklist2.find(params[:id])
  end

  def update
     @tasklist2 =Tasklist2.find(params[:id])

    if @tasklist2.update(tasklist2_params)
      flash[:success] = 'タスクは正常に更新されました'
      redirect_to tasklist2_url(@tasklist2)
    else
      flash.now[:danger] = 'タスクは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @tasklist2 = Tasklist2.find(params[:id])
    @tasklist2.destroy
    
    flash[:success] = "タスクは正常に削除されました"
    redirect_to tasklist2s_url
  end
  
  private
  
  def tasklist2_params
    params.require(:tasklist2).permit(:content,:status)
  end
end