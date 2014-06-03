# encoding: utf-8
class Sys::Domain < ActiveRecord::Base
  include Sys::Model::Base
  include Sys::Model::Base::Config
  include Sys::Model::Auth::Manager
  
  validates_presence_of :domain
  
end
