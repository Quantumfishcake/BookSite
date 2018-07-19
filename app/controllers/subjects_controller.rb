class SubjectsController < ApplicationController
  def new
    @subject = Subject.new
  end

  def create
    book_id = params[:book_id]
    list_id = params[:list_id]
    subject = Subject.new
    subject.book_id = book_id
    subject.list_id = list_id
    subject.save
  end


  def destroy

    book_id = params[:book_id]
    list_id = params[:list_id]
    subject = Subject.where(book_id: book_id, list_id: list_id).first
    subject.destroy
    redirect_to list_path(list_id)

  end

  private

  def subject_params
    params.require(:subject).permit(:list_id, :book_id)
  end
end
