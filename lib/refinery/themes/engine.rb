# -*- encoding: utf-8 -*-
module Refinery
  module Themes
    class Engine < ::Rails::Engine
      require 'refinerycms-core'

      include Refinery::Engine
      isolate_namespace Refinery::Themes::Engine
      engine_name :refinery_themes

      config.autoload_paths += %W(#{config.root}/lib)

      config.to_prepare do
        WillPaginate::ActiveRecord::RelationMethods.send :alias_method, :per, :per_page
        WillPaginate::ActiveRecord::RelationMethods.send :alias_method, :num_pages, :total_pages
      end

      def self.activate
        Dir.glob(File.join(Pathname.new(File.expand_path('../../../../', __FILE__)), 'app/**/*_decorator*.rb')) do |c|
          Rails.configuration.cache_classes ? require(c) : load(c)
        end

        Dir.glob(File.join(Pathname.new(File.expand_path('../../../../', __FILE__)), "app/overrides/**/*.rb")) do |c|
          Rails.configuration.cache_classes ? require(c) : load(c)
        end

        Dir[root + 'lib/liquid/**/*.rb'].each { |f| Rails.configuration.cache_classes ? require(f) : load(f) }


        %w{. tags drops filters blocks}.each do |dir|
          Dir[File.join(Pathname.new(File.expand_path('../../../../', __FILE__)), 'app/**/liquid', dir, '*.rb')].each { |lib|
            Rails.configuration.cache_classes ? require(lib) : load(lib)
          }
        end


      end

      initializer "register refinery_themes plugin" do
        #Refinery::Plugin.register do |plugin|
        #  plugin.name = "refinery_themes"
        #  plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.themes_admin_themes_path }
        #  plugin.pathname = root
        #  plugin.menu_match = /refinery\/themes\/?(settings|editor|upload)?/
        #end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Themes::Engine)
      end

      config.to_prepare &method(:activate).to_proc
    end
  end

end
