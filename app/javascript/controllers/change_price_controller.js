import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="change-price"
export default class extends Controller {
  static targets = ["startsAt", "price"]
  static values = {
    price: Number
  }
  connect() {

  }

  totalPrice(event) {
    const start = new Date(this.startsAtTarget.value)
    const end = new Date(event.currentTarget.value)
    const days = (end - start) / (24*3600*1000);
    const total = (days*this.priceValue)
    this.priceTarget.innerText = total.toFixed(2)
    console.log("Total Price")
  }



}
