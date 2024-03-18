# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

# Able to add bootstrap css on application.html.erb with CDN in <head>
# pin "bootstrap", to: "https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" # @5.3.2
# pin "@popperjs/core", to: "https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js" # @2.11.8
