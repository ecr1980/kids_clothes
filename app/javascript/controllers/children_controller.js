import { Controller } from "@hotwired/stimulus"
//import { get } from "@rails/request.js"

export default class extends Controller {
  static targets = [
    "needs",
    "outgrown",
    "growin",
    "child",
    "edit",
    "new"
  ]

  turnOffAll(){
    this.needsTarget.style.display = "none"
    this.outgrownTarget.style.display = "none"
    this.growinTarget.style.display = "none"
    this.childTarget.style.display = "none"
    this.editTarget.style.display = "none"
    this.newTarget.style.display = "none"
  }

  toggleNeeds(){
    if (this.needsTarget.style.display == "") {
      this.needsTarget.style.display = "none"
    }
    else {
      this.turnOffAll()
      this.needsTarget.style.display = ""
    }
  }

  toggleOutgrown(){
    if (this.outgrownTarget.style.display == "") {
      this.outgrownTarget.style.display = "none"
    }
    else {
      this.turnOffAll()
      this.outgrownTarget.style.display = ""
    }
  }

  toggleGrowin(){
    if (this.growinTarget.style.display == "") {
      this.growinTarget.style.display = "none"
    }
    else {
      this.turnOffAll()
      this.growinTarget.style.display = ""
    }
  }

  toggleChild(){
    if (this.childTarget.style.display == "") {
      this.childTarget.style.display = "none"
    }
    else {
      this.turnOffAll()
      this.childTarget.style.display = ""
    }
  }

  toggleEdit(){
    if (this.editTarget.style.display == "") {
      this.editTarget.style.display = "none"
    }
    else {
      this.turnOffAll()
      this.editTarget.style.display = ""
    }
  }

  toggleNew(){
    if (this.newTarget.style.display == "") {
      this.newTarget.style.display = "none"
    }
    else {
      this.turnOffAll()
      this.newTarget.style.display = ""
    }
  }
}