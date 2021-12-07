import { Controller } from "stimulus"
import httpClient from 'lib/http/client'

export default class extends Controller {
  static targets = [ "btn" ]
  static values = {
    liked: Boolean,
    courseId: Number,
  }

  connect(){
    if (this.likedValue){
      this.btnTarget.classList.add("favorite")
    }
  }

  like() {
    const courseID = this.courseIdValue
    const likeBtn = this.btnTarget
    httpClient.post(`/api/v1/courses/${courseID}/like`).then(function({data}){
      if (data.status === "like"){
        likeBtn.classList.add("favorite")
      } else {
        likeBtn.classList.remove("favorite")
      }
    })
  }
}
