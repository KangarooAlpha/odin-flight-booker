import { Controller } from "@hotwired/stimulus"

export default class extends Controller{
    static targets = [ "container"]
    static values = { index: Number}

    connect(){
        if (!this.hasIndexValue){
            this.indexValue = 1
        }
    }

    addOne(){
        if (this.indexValue < 4) {
            const tempate = this.element.querySelector("[data-passenger-template]")
            const content = tempate.content.cloneNode(true)

            content.querySelectorAll("input").forEach((input)=> {
                input.name = input.name.replace("NEW_INDEX", this.indexValue)
                input.id = input.name.replace(/\[|\]/g, "_").replace(/__+$/, "")
            })
            this.containerTarget.appendChild(content)
            this.indexValue++
    }}

    deleteOne(event){
        if (this.indexValue > 1){
        event.target.closest("[data-passenger-wrapper]").remove()
        }
    }
}