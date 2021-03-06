require "navigatrix/version"
require "navigatrix/item"
require "navigatrix/item_collection"
require "navigatrix/renderer"
require "navigatrix/builder"
require 'navigatrix/integration/rails' if defined?(Rails)
require 'navigatrix/integration/sinatra' if defined?(Sinatra)

module Navigatrix
  extend self

  mattr_accessor :list_renderers

  self.list_renderers = {
    :unordered_list   => Rendering::Strategies::List,
    :bootstrap_navbar => Rendering::Strategies::Bootstrap::Navbar,
    :bootstrap_tabs   => Rendering::Strategies::Bootstrap::Tabs
  }

  mattr_accessor :item_renderers
  self.item_renderers = {
    :item => Rendering::Strategies::Item
  }

  def register_list_renderer(name, &block)
    list_renderers[name] = ListBuilder.build(&block)
  end

  def register_item_renderer(name, &block)
    item_renderers[name] = ItemBuilder.build(&block)
  end
end
