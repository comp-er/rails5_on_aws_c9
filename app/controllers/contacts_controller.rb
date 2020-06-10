class ContactsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @name = params[:name]
    @email = params[:email]
    @content = params[:content]
    new_contact = Contact.new(name: @name, email: @email, content: @content)
    if new_contact.save #저장 결과를 bool값으로 리턴한다
      redirect_to "/contacts/index" #세이브가 완료되면 컨텍츠들의 리스트를 보는 뷰로 간다
    else
      redirect_to "/contacts/new" #세이브가 실패하면 폼으로 다시 돌아간다
    end
  end
end
