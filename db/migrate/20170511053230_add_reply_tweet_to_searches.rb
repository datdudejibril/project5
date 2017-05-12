class AddReplyTweetToSearches < ActiveRecord::Migration[5.0]
  def change
    add_column :searches, :reply_tweet, :string
  end
end
