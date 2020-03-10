import { Controller } from "stimulus"
import axios from 'axios'

export default class extends Controller {
  static targets = [ "followButton", "bookmark" ]

  follow(event){
    event.preventDefault();
    // different between event and this
    // console.log(this);
    // console.log(event);
    // console.log('===========');
    // console.log(this.currentTarget);
    // console.log(event.currentTarget);
    // console.log('*************');
    // console.log(event.currentTarget.dataset.user);
    // console.log('&&&&&&&&&&');
    // console.log(this.followButtonTarget)
    // console.log(event.followButtonTarget)
    // console.log('&&&&&&&&&&');
    // console.log(this.dataset.user);

    let member = this.followButtonTarget.dataset.user;
    let button = this.followButtonTarget;

    axios.post(`/api/members/${member}/follow`)
         .then(function(response){
          let status = response.data.status;
          switch(status) {
            case 'error':
              alert('請先登入');
              break;
            default:
              button.innerHTML = status;
          }
          console.log(response.data);
         })
         .catch(function(error){
           console.log(error);
         })
  }

  bookmark(event){
    event.preventDefault();
    let link = event.currentTarget;
    let slug = link.dataset.slug;

    axios.post(`/api/stories/${slug}/bookmark`)
         .then(function(response){
           // console.log(response.data);
         })
         .catch(function(error){
           // console.log(error);
         })
  }
}
