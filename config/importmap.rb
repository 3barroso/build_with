# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"


# Bootstrap JS requirements (not for bootstrap CSS) [repin with vendor/javascript files]
# pin "jquery", preload: true # @3.7.1
# pin "bootstrap", to: "bootstrap.js", preload: true # @5.3.3
# pin "@popperjs/core", to: "@popperjs--core.js", preload: true # @2.11.8
