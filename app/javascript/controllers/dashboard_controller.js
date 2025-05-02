// app/javascript/controllers/dashboard_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  toggleWidth() {
    if (this.element.classList.contains('w-64')) {
      this.element.classList.remove('w-64')
      this.element.classList.add('w-20')
    } else {
      this.element.classList.remove('w-20')
      this.element.classList.add('w-64')
    }
  }
}
