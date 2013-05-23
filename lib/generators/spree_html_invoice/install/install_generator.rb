module SpreeHtmlInvoice
  module Generators
    class InstallGenerator < Rails::Generators::Base

      # spree 1.2
      def install_migrations
        say_status :copying, "migrations"
        silence_stream(STDOUT) do
          silence_warnings { rake 'railties:install:migrations' }
        end
      end

      # pre spree 1.2
      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_html_invoice'
      end

      def run_migrations
         res = ask 'Would you like to run the migrations now? [Y/n]'
         if res == '' || res.downcase == 'y'
           run 'bundle exec rake db:migrate'
         else
           puts 'Skiping rake db:migrate, don\'t forget to run it!'
         end
      end
    end
  end
end
