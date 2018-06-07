import Ember from 'ember';
import ENV from 'ember-app/config/environment';
const { service } = Ember.inject;

export default Ember.Controller.extend({
  store: service(),
  actions: {
    submit(model){
      let self = this, addresses = [], models = [];

      model.forEach((item) => {
        if (item.ip){
          addresses.push(item.ip);
        }
      });
      if (addresses.length){
        Ember.$.ajax({
          url: ENV.serverRoot + '/get_countries_by_ip',
          type: 'POST',
          data: {addresses},
          crossDomain: true,
        }).then((response) => {
          if (response.length){
            response.forEach((item) => {
                models.push(this.get('store').createRecord('ip-address', item));
            });
            this.transitionToRoute('test_one.show')
          }
        });
      }
    },
    addAddress(){
      this.get('model').pushObject(this.get('store').createRecord('ip-address'));
    },
    removeAddress(address){
      this.get('model').removeObject(address);
      address.unloadRecord();
    }
  }
});
