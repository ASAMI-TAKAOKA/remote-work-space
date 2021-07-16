require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post)
    @comment_user = FactoryBot.create(:user)
    @comment = FactoryBot.build(:comment, user_id: @comment_user.id, post_id: @post.id)
  end

  describe '記事へのコメント機能' do
    context 'コメントが投稿できるとき' do
      it 'フォームに正しく入力すれば投稿できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメントが投稿できないとき' do
      it 'コメントが空欄では投稿できない' do
        @comment.comment = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Commentを入力してください')
      end
      it 'user_idが空では投稿できない' do
        @comment.user_id = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Userを入力してください')
      end
      it 'post_idが空では投稿できない' do
        @comment.post_id = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Postを入力してください')
      end
    end
  end
end
