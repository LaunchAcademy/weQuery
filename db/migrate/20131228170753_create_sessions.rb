class CreateSessions < ActiveRecord::Migration
  class Question < ActiveRecord::Base
    belongs_to :session
  end

  class Session < ActiveRecord::Base
  end
  def self.up
    create_table :sessions do |t|
      t.string :name, null: false
      t.timestamps
    end

    add_index :sessions, :name, unique: true

    add_column :questions, :session_id, :integer

    Session.reset_column_information
    Question.reset_column_information

    if Question.count > 0
      session = Session.find_or_create_by(name: 'Legacy Questions')

      Question.where(session_id: nil).find_each do |question|
        question.session = session
        question.save!
      end
    end

    change_column :questions, :session_id, :integer, null: false
    add_index :questions, :session_id
  end

  def self.down
    drop_table :sessions
    remove_index :questions, :session_id
    remove_column :questions, :session_id
  end
end
