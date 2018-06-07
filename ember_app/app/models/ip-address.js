import DS from 'ember-data';

export default DS.Model.extend({
  ip: DS.attr('string'),
  country: DS.attr('string')
});
