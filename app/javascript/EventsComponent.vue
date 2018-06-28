<template>
  <full-calendar :eventSources="eventSources" :config="config"></full-calendar>
</template>

<script>
  import { FullCalendar } from 'vue-full-calendar'
  import axios from 'axios';

  export default {
    components: {
      FullCalendar
    },

    data: () => {
      return {
        eventSources: [
          {
            events(start, end, timezone, callback) {
              axios.get(`/events.json`).then(response => {
                callback(response.data);
              })
            },
            color: '',
            textColor: 'black'
          }
        ],

        config: {
          dayClick: function(date, jsEvent, view) {
            console.log('Clicked Day')
          }
        }
      }
    }
  }
</script>
d
<style scoped>
  p {
    font-size: 2em;
    text-align: center;
  }
</style>
