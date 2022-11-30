import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
  static targets = ["catagorySelect",
                    "sizeSelect"]

  change(event) {
    let catagory = event.target.selectedOptions[0].value;
    let typeTarget = this.catagorySelectTarget.id;
    let sizeTarget = this.sizeSelectTarget.id;

    get(`/garments/types?sizeTarget=${sizeTarget}&typeTarget=${typeTarget}&catagory=${catagory}`, { responseKind: "turbo-stream" });

  }
}
