import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "click" ]

  click() {
    console.log("INSIDE CAUGHT CLICK ? ? ")
    this.clickTargets.forEach(target => target.click())
  }
}
