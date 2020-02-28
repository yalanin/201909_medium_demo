import { Controller } from "stimulus"
import axios from 'axios'

export default class extends Controller {
  static targets = [ "clapCount" ]

  addClap(event){
    event.preventDefault();
    let slug = event.currentTarget.dataset.slug;
    let target = this.clapCountTarget;

    // http://localhost:3000/@lala/api/stories/%E6%99%82%E9%96%93%E6%B8%AC%E8%A9%A6/clap

    axios.post(`/api/stories/${slug}/clap`)
         .then(function(response){
            let status = response.data.status
            switch(status){
              case 'sign in first':
                alert('請先登入');
                break;
              default:
                target.innerText = status;

            }
          })
         .catch(function(error){
           console.log(error)
    })
  }
}