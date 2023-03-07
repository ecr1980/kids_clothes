import { Controller } from "@hotwired/stimulus"
//import { get } from "@rails/request.js"

export default class extends Controller {
  
  static targets = [
    "tops",
    "bottoms",
    "dresses",
    "socks",
    "pjs",
    "outerwear",
    "shoes"
  ]

  turnOffAll(){
    this.topsTarget.style.display = "none"
    this.bottomsTarget.style.display = "none"
    this.dressesTarget.style.display = "none"
    this.socksTarget.style.display = "none"
    this.pjsTarget.style.display = "none"
    this.outerwearTarget.style.display = "none"
    this.shoesTarget.style.display = "none"
  }

  toggleTops(){
    if (this.topsTarget.style.display == "") {
      this.topsTarget.style.display = "none"
    }
    else {
      this.turnOffAll()
      this.topsTarget.style.display = ""
    }
  }

  toggleBottoms(){
    if (this.bottomsTarget.style.display == "") {
      this.bottomsTarget.style.display = "none"
    }
    else {
      this.turnOffAll()
      this.bottomsTarget.style.display = ""
    }
  }

  toggleDresses(){
    if (this.dressesTarget.style.display == "") {
      this.dressesTarget.style.display = "none"
    }
    else {
      this.turnOffAll()
      this.dressesTarget.style.display = ""
    }
  }

  toggleSocks(){
    if (this.socksTarget.style.display == "") {
      this.socksTarget.style.display = "none"
    }
    else {
      this.turnOffAll()
      this.socksTarget.style.display = ""
    }
  }

  togglePJs(){
    if (this.pjsTarget.style.display == "") {
      this.pjsTarget.style.display = "none"
    }
    else {
      this.turnOffAll()
      this.pjsTarget.style.display = ""
    }
  }

  toggleOuterwear(){
    if (this.outerwearTarget.style.display == "") {
      this.outerwearTarget.style.display = "none"
    }
    else {
      this.turnOffAll()
      this.outerwearTarget.style.display = ""
    }
  }

  toggleShoes(){
    if (this.shoesTarget.style.display == "") {
      this.shoesTarget.style.display = "none"
    }
    else {
      this.turnOffAll()
      this.shoesTarget.style.display = ""
    }
  }
}