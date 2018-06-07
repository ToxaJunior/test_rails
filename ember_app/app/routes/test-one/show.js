import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    let addresses = this.get('store').peekAll('ip-address');
    return addresses.filterBy('country')
  },
});
