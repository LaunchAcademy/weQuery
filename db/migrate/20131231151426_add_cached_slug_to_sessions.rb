class AddCachedSlugToSessions < ActiveRecord::Migration
  class Session < ActiveRecord::Base
    begin
      is_sluggable :name
    rescue
    end
  end

  def self.up
    add_column :sessions, :cached_slug, :string
    add_index  :sessions, :cached_slug

    if Session.new.respond_to?(:generate_slug!)
      Session.find_each do |session|
        session.generate_slug!
      end
    end
  end

  def self.down
    remove_column :sessions, :cached_slug
  end

end
