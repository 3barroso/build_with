# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

# needs gems bootstrap and sass-rails? (this adds sprockets as dependency which then overrides Propshaft? — requires manifest.js)
# pin "bootstrap" # @5.3.3
# pin "@popperjs/core", to: "@popperjs--core.js" # @2.11.8
